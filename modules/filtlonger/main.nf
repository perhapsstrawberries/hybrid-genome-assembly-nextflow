#!/usr/bin/env nextflow

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