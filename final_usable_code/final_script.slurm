#!/bin/bash
#SBATCH -o test.o%j
#SBATCH --time=1-00:00:00
#SBATCH -mem=8gb     
#SBATCH -N 1                 
#SBATCH -n 1                 
module load singularity
singularity exec /mnt/rds/redhen/gallina/Singularity/Show_Segmentation_2021/show_segmentation_2021.img python3 segment_tv.py $1 $2

# singularity pull show_segmentation_2021.sif docker://ghcr.io/EdOates84/Show_Segmentation_2021:latest