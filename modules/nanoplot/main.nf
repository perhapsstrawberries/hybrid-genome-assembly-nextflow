#!/usr/bin/env nextflow

process NANOPLOT {
    label 'process_single'
    conda 'envs/nanoplot_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    tuple val(name), path(nano), path(read1), path(read2)

    output:
    path("*.txt")

    shell:
    """
    NanoPlot --fastq $nano
    """
}