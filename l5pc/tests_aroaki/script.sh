#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --partition=macke
#SBATCH --mem=10000
#SBATCH --output=/mnt/qb/macke/mdeistler57/tsnpe_collection/l5pc/tests_aroaki/out_%j.out
#SBATCH --error=/mnt/qb/macke/mdeistler57/tsnpe_collection/l5pc/tests_aroaki/out_%j.err
#SBATCH --time=0-00:30
python file.py
