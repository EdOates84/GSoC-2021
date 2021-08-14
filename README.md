# Show-Segmentation
GSoC 2021 project with Red Hen Lab. I want to improve the clustering algorithm to the in-production code and enhance the previous work. The main problem is to find the correct anchor. Currently, the most time-consuming process in the program is going frame by frame and extracting faces. The face-recognition method used in the production code processes each frame individually. I want to upgrade it to a parallelized algorithm to process multiple frames in a batch and increase the processing speed exponentially, which will also help in faster testing of hyperparameters. Batch processing can be much quicker than processing single images at a time. So I think we use batch processing for multi-threading. More information about the project statement can be found <a href="https://sites.google.com/site/distributedlittleredhen/home/the-cognitive-core-research-topics-in-red-hen/the-barnyard/tv-show-segmentation">here</a>. 

<b>Mentors:</b> <a href="https://www.rees.ox.ac.uk/people/dr-anna-wilson">Anna Wilson</a>, <a href="https://comm.ucla.edu/person/francis-steen/">Francis Steen</a>, <a href="http://frankie.robertson.name/">Frankie Robertson</a> 

### Blog detailing the research and working can be found at <a href="https://edoates84.github.io">edoates84.github.io</a>

## Usage
1. Clone the repo to your machine
```bash
git clone https://github.com/EdOates84/Show-Segmentation-2021.git
```
2. Install the required python packages using either of these commands
```bash
pip install numpy pandas matplotlib opencv-python scikit-learn face_recognition wikipedia ffmpeg traceback2
``` 

3. Download the <a href="https://drive.google.com/open?id=1AAkCoH1FDuJz4pTOyZv9QCUFPZAHECRI">anchors-encodings pickle</a> and place it in this location.
```bash
/Show-Segmentation-2021/final_celeb_detection/final_pickles/anchors-with-TV-encodings.pickle
```
4. Download the <a href="https://drive.google.com/drive/folders/1LpbtUeRHRcEW7Avf4_y_jphe7i-Z0JKU?usp=sharing">IMDB Datasets</a> and place it in this location.
```bash
Show-Segmentation-2021/IMDB_Datasets/name.basics.tsv
Show-Segmentation-2021/IMDB_Datasets/title.basics.tsv
Show-Segmentation-2021/IMDB_Datasets/title.principals.tsv
Show-Segmentation-2021/IMDB_Datasets/name.akas.tsv
Show-Segmentation-2021/IMDB_Datasets/name.crew.tsv
```
5. Navigate to Show-Segmentation-2021/final_usable_code/
```bash
cd Show-Segmentation-2021/final_usable_code
```
6. segment_tv.py takes 3 inputs, the path to the input video, path to the output location and a flag --verbose.
```python
python3 segment_tv.py path/to/input/video.mp4 path/to/store/output --verbose
```
7. Make sure that the input video's name follows RedHenLab's Tv dataset's format. Here's an example
```
1980-06-03_0000_US_00020088_V0_U2_M9_EG1_DB.mp4
```

## Singularity Usage
### Setup
<i> **This is for those using the singularity image (segmentation_production.simg) on the CWRU HPC Cluster.</i>
1. Connect to the <a href="https://vpnsetup.case.edu/">CWR VPN</a>.
2. Login to the cluster using your CWR ID and your credentials. Example:
```bash
ssh abc123@rider.case.edu
```
3. Navigate to the project's location on the cluster.
```bash
cd /mnt/rds/redhen/gallina/Singularity/Show-Segmentation-2021/final_usable_code
```
4. Request a computing node using
```bash
srun --mem=16gb --pty /bin/bash
```
5. Load <a href="http://singularity.lbl.gov/">singularity</a> 2.5.1 to your environment using
```bash
module load singularity
```
6. I have made <a href="https://github.com/EdOates84/Show-Segmentation-2021/blob/main/final_usable_code/segment_tv.py">segment_tv.py</a> for <b>testing</b> and <a href="https://github.com/EdOates84/Show-Segmentation-2021/blob/main/final_usable_code/final_script.py">final_script.py</a> for final <b>production</b>. After setup, read the Testing section or the Production section according to the requirement.

### Testing
1. segment_tv.py is made to work on a single video file. It takes 3 inputs (in this order)
*  ```path/to/input/video.mp4```
*  ```path/to/output/directory``` (where the output will be stored)
*  ```--verbose``` (an optional flag which will make the program print progress statements like 'done extracting faces', 'done clustering faces' etc.)
2. The main command is of the form
```bash
singularity exec -B /mnt../show-segementation-2021_latest.sif python3 segment_video.py {INPUT_VIDEO_PATH} {OUTPUT_PATH} {--verbose}
```
3. The Tv dataset is present at ```/mnt/rds/redhen/gallina/tv```, we can take some video file from this as our input.
4. An example command for the file ```1998-01/1998-01-01/1998-01-01_0000_US_00019495_V3_VHS50_MB20_H17_WR.mp4``` is
```bash
singularity exec -B /mnt../show-segementation-2021_latest.sif python3 segment_video.py /mnt/rds/redhen/gallina/tv/1998/1998-01/1998-01-01/1998-01-01_0000_US_00019495_V3_VHS50_MB20_H17_WR.mp4 mnt/path/to/output/directory --verbose
```

### Production
1. final_script.py is made to work recursively on all the video files present in ```/mnt/rds/redhen/gallina/tv/``` and store the outputs in ```/mnt/rds/redhen/gallina/Singularity/Show-Segmentation-2021/TvSplit_2```
2. ```--verbose``` flag mentioned earlier is set to False by default for production.
3. Run the script using
```bash
python3 final_script.py
```
Please raise an issue if you run into any errors.

<!-- ## Future work
* If possible, replace the current celeb detection method with Azure’s Computer Vision service.
* Currently the most time consuming process in the program is that of going frame by frame and extracting faces. This can be speed up using multi-threading or any other means possible.
* Explore the dataset that contains news shows with anchors. -->