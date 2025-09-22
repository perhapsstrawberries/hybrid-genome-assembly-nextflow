#!/usr/bin/env nextflow

process BOWTIE2_INDEX {
    label 'process_high'
    conda 'envs/bowtie2_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    path(consensus)

    output:
    tuple val("${consensus.baseName}"), path("bowtie2_index/")

    shell:
    """ 
    mkdir bowtie2_index
    bowtie2-build --threads $task.cpus $consensus bowtie2_index/${consensus.baseName}
    """
}