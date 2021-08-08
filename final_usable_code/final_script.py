"""
This file is made specifically to work on the tv dataset present
on the CWRU HPC Cluster.

Recursively works on all .mp4 files present in the CWRU tv dataset.
"""
import os, sys
from os.path import join as join
import subprocess

dataset = '/mnt/rds/redhen/gallina/tv/'
split   = '/mnt/rds/redhen/gallina/Singularity/Show-Segmentation-2021/TvSplit'
slurm_path = '/mnt/rds/redhen/gallina/Singularity/Show-Segmentation-2021/final_usable_code/final_script.slurm'
verbose = '--verbose'
MP4 = '.mp4'


for y in os.listdir(dataset):
    for y_m in os.listdir(join(dataset, y)):
        for y_m_d in os.listdir(join(dataset, y, y_m)):
            for video in os.listdir(join(dataset, y, y_m, y_m_d)):
                if MP4 in str(video):
                    vid_path    = join(dataset, y, y_m, y_m_d, video)
                    output_path = join(split, y, y_m, y_m_d) # Exact same tree structure as tv/ is to be used in TvSplit/

                    if not os.path.exists(output_path): 
                        os.makedirs(output_path) # os.makedirs creates all missing directories in the path recursively
                    
                    cmd = ['sbatch', slurm_path, vid_path, output_path, verbose]
                    print(cmd)
                    subprocess.run(cmd)
                else:
                    pass
            
        sys.exit(0)