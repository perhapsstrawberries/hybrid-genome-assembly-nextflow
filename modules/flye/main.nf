#!/usr/bin/env nextflow

process FLYE {
    label 'process_high'
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