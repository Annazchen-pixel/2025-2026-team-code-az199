#!/bin/bash
#SBATCH --job-name=azfastqc
#SBATCH --mem=8G
#SBATCH --partition=common

module load FastQC
fastqc -o results