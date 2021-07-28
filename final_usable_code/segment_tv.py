"""
This file is made specifically to work on the tv dataset present
on the CWRU HPC Cluster.

Recursively works on all .mp4 files present in the CWRU tv dataset.
"""
import sys
from segment_video import segment_video

vid_path = sys.argv[1]
output_path = sys.argv[2]

try:
    segment_video(vid_path, output_path)
except:
    print("Error segmenting {}, possible problems: \n1. Video is too small (<20 minutes)\n2. Video file_name doesn\'t follow the tv naming convention\n3. Video .txt3 file doesn\'t follow the tv format\n4. Raise an issue on github if any other error exists".format(vid_path))
