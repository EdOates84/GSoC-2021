#!/bin/bash

for video in /path/to/videos/*.mp4
do
    sbatch /path/to/mysubmissionsscript.slurm $video /path/to/ouptuts/$(basename $video).txt
done