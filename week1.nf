#!/usr/bin/env nextflow

process FASTQC {
    label 'process_single'
    conda 'envs/fastqc_env.yml'
    publishDir params.outdir, mode:'copy', pattern: "*.html"

    input:
    tuple val(name), path(read1), path(read2)

    output:
    path("*.html")
    tuple path(read1), path(read2), emit: reads

    script:
    """ 
    fastqc $read1 $read2
    """

}

process FILTLONGER {
    label 'process_single'
    conda 'envs/filtlong_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    tuple val(name), path(nano)

    output:
    tuple val(name), path("${name}.filtered.fastq.gz")

    script:
    """
    filtlong --min_length 500 --keep_percent 90 ${nano} | gzip > ${name}.filtered.fastq.gz
    """

}

process FLYE {
    label 'process_single'
    conda 'envs/flye_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    tuple val(name),path(nano)

    output:
    path("assembly.fasta")

    script:
    """
    flye --nano-corr $nano -o .
    """
}

workflow {

    // Look in the nextflow.config file to see values for params
    // This makes a "channel" with the files and info we need to run our pipeline

    // This will make a channel with the information needed for the long reads
    Channel.fromPath(params.bac_samples)
    | splitCsv(header: true)
    | map { row -> tuple(row.name, file(row.nano))}
    | set { longread_ch }

    // Use similar logic and make a channel for the short reads
    Channel.fromPath(params.bac_samples)
    | splitCsv(header: true)
    | map { row -> tuple(row.name, file(row.short1), file(row.short2))}
    | set { shortread_ch }

    // Run QC on the short reads
    FASTQC(shortread_ch)

    // Filter the long reads
    FILTLONGER(longread_ch)

    // Pass the filtered reads to the assembly tool
    FLYE(FILTLONGER.out)

}