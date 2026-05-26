#!/bin/bash -e

#given job descriptions/parameters
#SBATCH --job-name=azfastqc_out
#SBATCH --mem=16G
#SBATCH --partition=common
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=7-00:00:00

#SBATCH -o azfastqc-%j.out #saves output to this file, replace %j w/ unique job ID
#SBATCH -e azfastqc-%j.err #saves error to the file, replace %j w/ unique job ID

#SBATCH --mail-type=ALL #auto-send email on all updates
#SBATCH --mail-user=az199@duke.edu

#Load modules
module load fastqc

#establish paths
raw_input="/work/clh162/OysterRNA24/rawreads"
fastqc_output="/work/clh162/Data+/Anna/2025-2026-team-code-az199/Data+_team/Anna/fastqc_results"

#create folders
mkdir -p $fastqc_output

#run data 
fastqc -t 8 $raw_input/*.fastq.gz -o $fastqc_output

#print completion ticket
echo "FastQC Completed"