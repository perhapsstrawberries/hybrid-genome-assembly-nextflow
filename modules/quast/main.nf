#!/usr/bin/env nextflow

process QUAST{
    label 'process_medium'
    conda 'envs/quast_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    path(genome)
    path(ref_genome)

    output:
    path("${genome.baseName}/")

    shell:
    """ 
    quast.py -t $task.cpus -r $ref_genome -o $genome.baseName $genome
    """

}