# Hybrid Genome Assembly with Nextflow

## Overview
This project implements a modular Nextflow pipeline for **hybrid bacterial genome assembly**, integrating long-read and short-read sequencing data. Long reads are used to generate a contiguous draft assembly, while short reads are used to polish and correct sequencing errors. The pipeline also performs quality control, assembly evaluation, and genome annotation.

This project was developed as part of **BF528 (Applications in Bioinformatics)** to practice workflow design, channel construction, and reproducible computational genomics.

---

## Biological Context
Hybrid genome assembly combines the strengths of different sequencing technologies:

- **Long-read sequencing (Nanopore)** provides long contigs and improved assembly continuity.
- **Short-read sequencing (Illumina)** provides high base-level accuracy for polishing.
- Together, they enable more accurate and complete genome assemblies than either technology alone.

This approach is widely used for bacterial genomes and other small to medium-sized genomes.

---

## Pipeline Workflow
The pipeline performs the following major steps:

1. Quality control of long and short reads  
2. Assembly of long-read sequencing data  
3. Polishing of the draft assembly using short reads  
4. Quality assessment and comparison to a reference genome  
5. Genome annotation and visualization of genomic features  

The workflow was developed incrementally across multiple weeks, emphasizing understanding of Nextflow channels, modular processes, and workflow dependencies.

---

## Project Structure
```
.
├── week1.nf # Initial pipeline scaffold and channels
├── week2.nf # Modularized assembly and polishing steps
├── week3.nf # Final pipeline connections and evaluation
├── nextflow.config # Reference paths, resources, and profiles
├── modules/ # Individual Nextflow process modules
├── envs/ # Conda environments (early development)
├── results/ # Pipeline outputs
├── full_pipeline.png # Workflow DAG visualization
├── report_project1_final.html
├── report_project1_final.ipynb
└── README.md
```

---

## Tools and Technologies
- **Nextflow** — workflow orchestration  
- **Conda** — environment management  
- **Long-read assembly tools** (Nanopore-based)  
- **Short-read polishing tools** (Illumina-based)  
- **QC and evaluation utilities**  

All computational environments and reference paths are encoded in `nextflow.config` to ensure reproducibility.

---

## Key Learning Outcomes
This project emphasizes **workflow engineering rather than novel biological discovery**. Skills demonstrated include:

- Designing and debugging multi-step Nextflow pipelines  
- Creating and reusing channels across workflow stages  
- Modularizing processes for extensibility  
- Managing computational environments and resources  
- Interpreting assembly quality metrics responsibly  

This project serves as a foundation for more open-ended pipelines developed in later projects.

---

## Course Context
This is **Project 1** in a three-project computational genomics sequence:
- Project 1: Hybrid genome assembly (this repository)
- Project 2: RNA-seq differential expression analysis
- Project 3: ChIP-seq analysis and regulatory interpretation

---

## Author
Wendy Bui
