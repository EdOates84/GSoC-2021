import sys
from segment_video import segment_video

vid_path = sys.argv[1]
output_path = sys.argv[2]
verbose = sys.argv[3]

segment_video(vid_path, output_path, verbose)
