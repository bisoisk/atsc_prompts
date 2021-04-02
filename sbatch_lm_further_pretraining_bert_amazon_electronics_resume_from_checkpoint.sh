#!/bin/bash
#SBATCH --job-name=lm_further_pretraining_bert_amazon_electronics
#SBATCH -o gypsum_logs/stdout/lm_further_pretraining_bert_amazon_electronics_%j.txt
#SBATCH -e gypsum_logs/stderr/lm_further_pretraining_bert_amazon_electronics_%j.err
#SBATCH --ntasks=1
#SBATCH --partition=1080ti-long
#SBATCH --gres=gpu:2
#SBATCH --mem=64GB
#SBATCH --cpus-per-task=4

eval "$(conda shell.bash hook)"
conda activate zeroshotatsc

EXPERIMENT_ID_PREFIX=lm_further_pretraining_bert_amazon_electronics
EXPERIMENT_USERNAME=$(whoami)
EXPERIMENT_STARTTIME=`date +"%Y-%m-%d--%H_%M_%S"`

papermill --autosave-cell-every 300 --progress-bar --log-output --log-level INFO \
          lm_further_pretraining_bert_amazon_electronics.ipynb \
          gypsum_logs/${EXPERIMENT_ID_PREFIX}_${EXPERIMENT_USERNAME}_${EXPERIMENT_STARTTIME}.ipynb \
          -p experiment_id ${EXPERIMENT_ID_PREFIX}_${EXPERIMENT_USERNAME}_${EXPERIMENT_STARTTIME} \
          -p random_seed 696 \
          -p total_subset_proportion 1.0 \
          -p validation_dataset_proportion 0.1 \
          -p num_train_epochs 20 \
          -p per_device_train_batch_size 16 \
          -p per_device_eval_batch_size 16 \
          -p weight_decay 0.01 \
          -p checkpoint_path progress/lm_further_pretraining_bert_amazon_electronics_bseoh_2021-03-06--18_59_53/results/checkpoint-1180388 \