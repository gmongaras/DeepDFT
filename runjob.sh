#!/bin/bash

#SBATCH -J DeepDFT              # Job Name
#SBATCH -p batch			# (debug or batch)
###SBATCH --exclusive
#SBATCH -o runjob.out			# Output file name
#SBATCH --gres=gpu:1			# Number of GPUs to use
#SBATCH --mem=1500G

#source ~/MyEnv/bin/activate		# Activate my Python Env
#python -m eval.compute_model_stats
#source /home/gmongaras/.bashrc
source activate base
#python train.py
#/home/gmongaras/miniconda3/bin/torchrun --nproc_per_node 8 --master-port 29502 src/train.py
python runner.py --dataset /work/group/kalescky/projects/04_ml_rho/data/qm9/qm9vasp.txt --split_file datadir/splits.json --ignore_pbc --cutoff 4 --num_interactions 6 --max_steps 100000000 --node_size 128
