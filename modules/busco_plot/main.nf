#!/usr/bin/env nextflow

process BUSCO_PLOT {
    label 'process_single'
    conda 'envs/busco_env.yml'
    publishDir params.outdir, mode:'copy'

    input:
    path(busco_results)
    
    output:
    path("**/*.png")

    shell:
    """ 
    busco --plot $busco_results
    """

}