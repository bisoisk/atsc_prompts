#!/bin/bash
#SBATCH --job-name=1zsbatch
#SBATCH -o gypsum_logs/stdout/gpt-2_zero_shot_prompt_logit_softmax_atsc_laptops.txt
#SBATCH -e gypsum_logs/stderr/gpt-2_zero_shot_prompt_logit_softmax_atsc_laptops.err
#SBATCH --ntasks=1
#SBATCH --partition=titanx-long
#SBATCH --gres=gpu:1
#SBATCH --mem=10GB
#SBATCH --cpus-per-task=4

eval "$(conda shell.bash hook)"
conda activate zeroshotatsc

python gpt-2_zero_shot_prompt_logit_softmax_atsc_laptops.py