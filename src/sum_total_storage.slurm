#!/bin/bash
#SBATCH --job-name=sum_storage     # name that you chose
#SBATCH -c 8                            # number of cores per task, unsure on UV
#SBATCH -p UV,normal              # seems slow on normal to read in files
#SBATCH -A iidd                        # your account
#SBATCH --time=00:45:00        # time at which the process will be cancelled if unfinished
#SBATCH --mem=100GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lplatt@usgs.gov
#SBATCH -o logs/slurm_sum_storage.out            # log file for each jobid (can insert %A_%a for each array id task if needed)
#SBATCH --export=ALL

mkdir -p grouped_total_storage

module load R/3.5.1-gcc7.1.0

srun Rscript src/sum_total_storage.R