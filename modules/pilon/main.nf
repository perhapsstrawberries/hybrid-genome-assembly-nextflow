#!/usr/bin/env nextflow

process PILON {
    label 'process_high'
    conda 'envs/pilon_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    path(genome)
    path(bam)
    
    output:
    path("*sorted.fasta")

    shell:
    """ 
    pilon --genome $genome --frags $bam --output ${bam.baseName} -Xmx${task.cpus}G
    """

}