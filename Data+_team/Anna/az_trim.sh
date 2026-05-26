#!/bin/bash -e

#given job descriptions/parameters
#SBATCH --job-name=trim_out
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=7-00:00:00

#SBATCH -o trim_output-%j.out #saves output to this file, replace %j w/ unique job ID
#SBATCH -e trim_output-%j.err #saves error to the file, replace %j w/ unique job ID

#SBATCH --mail-type=ALL #auto-send email on all updates
#SBATCH --mail-user=az199@duke.edu

#create new conda environment and install trim-galore
conda create -n rna_seq -c bioconda -c conda-forge trim-galore fastqc multiqc
#Load modules
module load fastqc