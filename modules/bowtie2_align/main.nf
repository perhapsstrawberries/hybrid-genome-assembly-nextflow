#!/usr/bin/env nextflow

process BOWTIE2_ALIGN {
    label 'process_high'
    conda 'envs/bowtie2_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    tuple val(name), path(short1), path(short2)
    tuple val(consensus), path(index)

    output:
    path("${name}.bam")

    shell:
    """ 
    bowtie2 -x bowtie2_index/${consensus} -1 $short1 -2 $short2 | samtools view -bS - > ${name}.bam
    """

}