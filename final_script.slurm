#!/bin/bash

#SBATCH -o test.o%j

#SBATCH --time=1-00:00:00      

#SBATCH -N 1                 

#SBATCH -n 1                 

#SBATCH -mem=8gb 

module load singularity

singularity exec -B /mnt/rds/redhen/gallina/Singularity/Show_Segmentation_2021/show_segmentation_2021.img python3 segment_tv.py
