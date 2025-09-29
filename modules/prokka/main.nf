#!/usr/bin/env nextflow

process PROKKA {
    label 'process_medium'
    conda "envs/prokka_env.yml"
    publishDir params.outdir

    input:
    path(fa)

    output:
    path("**/*.gff"), emit: gff

    shell:
    """
    prokka --cpus 1 --outdir annots/ --prefix genome $fa
    """
}