#!/usr/bin/env nextflow

process SAMTOOLS_SORT {

    label 'process_medium'
    conda 'envs/samtools_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    path(bam)

    output:
    path("${bam.baseName}.sorted.bam")

    shell:
    """ 
    samtools sort -@ $task.cpus $bam > ${bam.baseName}.sorted.bam
    samtools index ${bam.baseName}.sorted.bam
    """

}