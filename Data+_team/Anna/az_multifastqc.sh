#!/bin/bash -e

##Given job descriptions/parameters
#SBATCH --job-name=azfastqc_out
#SBATCH --mem=16G
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=01:00:00

#SBATCH -o azfastqc-%a.out #saves output to this file, replace %a w/ unique array ID
#SBATCH -e azfastqc-%a.err #saves error to the file, replace %a w/ unique array ID

#SBATCH --mail-type=ALL #auto-send email on all updates
#SBATCH --mail-user=az199@duke.edu

#Load modules and enviroments
source /hpc/home/az199/miniconda3/etc/profile.d/conda.sh
conda activate rna_seq
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

conda deactivate