#!/usr/bin/env bash
set -xe
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install python3
sudo apt-get install python3-pip -y
sudo pip3 install google-cloud-bigquery
sudo apt-get install ipython -y
sudo pip3 install jupyter
sudo useradd -M jupyter

###############post installation #############################
#gcloud compute ssh jupytr-instance
#sudo su cloud-user
#cd /home/cloud-user
#jupyter notebook --generate-config
#VARIABLE="c.NotebookApp.allow_origin = '*'"
#VARIABLE2="c.NotebookApp.ip = '0.0.0.0'"
#echo $VARIABLE | cat - .jupyter/jupyter_notebook_config.py > temp && mv temp .jupyter/jupyter_notebook_config.py
#echo $VARIABLE2 | cat - .jupyter/jupyter_notebook_config.py > temp2 && mv temp2 .jupyter/jupyter_notebook_config.py
#jupyter notebook --no-browser --port 8888
