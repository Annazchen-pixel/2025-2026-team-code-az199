#!/bin/bash -e

#given job descriptions/parameters
#SBATCH --job-name=azmultiqc_out
#SBATCH --mem=16G
#SBATCH --partition=common
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=01:00:00

#SBATCH -o azmultiqc-%j.out #saves output to this file, replace %j w/ unique job ID
#SBATCH -e azmultiqc-%j.err #saves error to the file, replace %j w/ unique job ID

#SBATCH --mail-type=ALL #auto-send email on all updates
#SBATCH --mail-user=az199@duke.edu

#Load modules
module load multiqc

#establish paths
fastqc_output="/work/clh162/Data+/Anna/2025-2026-team-code-az199/Data+_team/Anna/fastqc_results"
multiqc_output="/work/clh162/Data+/Anna/2025-2026-team-code-az199/Data+_team/Anna/multiqc_results"

#create folders
mkdir -p $multiqc_output

#run data 
multiqc $fastqc_output -o $multiqc_output

#print completion ticket
echo "MultiQC Completed"