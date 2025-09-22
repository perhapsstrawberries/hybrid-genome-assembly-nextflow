#!/usr/bin/env nextflow

process FASTQC {
    label 'process_single'
    conda 'envs/fastqc_env.yml'
    publishDir params.outdir, mode:'copy', pattern: "*.html"

    input:
    tuple val(name), path(read1), path(read2)

    output:
    path("*.html")
    tuple val(name), path(read1), path(read2), emit: reads

    script:
    """ 
    fastqc $read1 $read2
    """

}