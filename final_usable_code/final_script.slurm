#!/usr/bin/bash
#SBATCH --time=1-00:00:00
#SBATCH --mem=16gb
#SBATCH -N 1

module load singularity
singularity exec --bind /mnt/rds/redhen/gallina /mnt/rds/redhen/gallina/Singularity/Show-Segmentation-2021/show-segementation-2021_latest.sif python3 /mnt/rds/redhen/gallina/Singularity/Show-Segmentation-2021/final_usable_code/segment_tv.py $1 $2 $3
