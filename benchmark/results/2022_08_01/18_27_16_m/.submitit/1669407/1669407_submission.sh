#!/bin/bash

# Parameters
#SBATCH --array=0-5%6
#SBATCH --cpus-per-task=8
#SBATCH --error=/mnt/qb/macke/mdeistler57/tsnpe_collection/benchmark/benchmark/../results/2022_08_01/18_27_16_m/.submitit/%A_%a/%A_%a_0_log.err
#SBATCH --job-name=run
#SBATCH --mem=400GB
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --open-mode=append
#SBATCH --output=/mnt/qb/macke/mdeistler57/tsnpe_collection/benchmark/benchmark/../results/2022_08_01/18_27_16_m/.submitit/%A_%a/%A_%a_0_log.out
#SBATCH --partition=cpu-short
#SBATCH --signal=USR1@120
#SBATCH --time=120
#SBATCH --wckey=submitit

# command
export SUBMITIT_EXECUTOR=slurm
srun --unbuffered --output /mnt/qb/macke/mdeistler57/tsnpe_collection/benchmark/benchmark/../results/2022_08_01/18_27_16_m/.submitit/%A_%a/%A_%a_%t_log.out --error /mnt/qb/macke/mdeistler57/tsnpe_collection/benchmark/benchmark/../results/2022_08_01/18_27_16_m/.submitit/%A_%a/%A_%a_%t_log.err /home/macke/mdeistler57/.conda/envs/tsnpe/bin/python -u -m submitit.core._submit /mnt/qb/macke/mdeistler57/tsnpe_collection/benchmark/benchmark/../results/2022_08_01/18_27_16_m/.submitit/%j
