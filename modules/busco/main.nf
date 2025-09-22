#!/usr/bin/env nextflow

process BUSCO{
    label 'process_high'
    conda 'envs/busco_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    path(genome)
    
    output:
    path("BUSCO_${genome.baseName}*")

    shell:
    """ 
    busco -i ${genome} -m genome --cpu $task.cpus -l alteromonas_odb12
    
    """

}