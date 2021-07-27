"""
This file is made specifically to work on the tv dataset present
on the CWRU HPC Cluster.

Recursively works on all .mp4 files present in the CWRU tv dataset.
"""
import os
from os.path import join as join
import subprocess

dataset = '/mnt/rds/redhen/gallina/tv/'
split   = '/mnt/rds/redhen/gallina/TvSplit/'

for y in os.listdir(dataset):
    for y_m in os.listdir(join(dataset, y)):
        for y_m_d in os.listdir(join(dataset, y, y_m)):
            for video in os.listdir(join(dataset, y, y_m, y_m_d)):
                vid_path    = join(dataset, y, y_m, y_m_d, video)
                output_path = join(split, y, y_m, y_m_d) # Exact same tree structure as tv/ is to be used in TvSplit/

                if not os.path.exists(output_path): 
                    os.makedirs(output_path) # os.makedirs creates all missing directories in the path recursively

                subprocess.run("sbatch"+"final_usable_code/final_script.slurm"+" "+vid_path+" "+output_path)