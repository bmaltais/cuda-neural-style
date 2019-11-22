# cuda-neural-style
## Prep docker hub:
export DOCKER_ID_USER="bmaltais"

docker login

## Build base torch base container:

cd cuda80-cudann5-torch

docker build -t cuda8.0-cudnn5-torch-14.04 .

docker tag cuda8.0-cudnn5-torch-14.04 bmaltais/cuda8.0-cudnn5-torch-14.04

docker push bmaltais/cuda8.0-cudnn5-torch-14.04


## Build neural-style container:

cd neural-style

docker build -t cudnn-neural-style .

docker tag cudnn-neural-style bmaltais/cudnn-neural-style

docker push bmaltais/cudnn-neural-style

## Build neural-style-skimage container:

cd neural-style-skimage

docker build -t cudnn-neural-style-skimage .

docker tag cudnn-neural-style-skimage bmaltais/cudnn-neural-style-skimage

docker push bmaltais/cudnn-neural-style-skimage

## Build neural-style-pt container:

cd neural-style-pt

docker build -t cudnn-neural-style-pt .

docker tag cudnn-neural-style-pt bmaltais/cudnn-neural-style-pt

docker push bmaltais/cudnn-neural-style-pt

## Run neural-style:

nvidia-docker run --rm -it -v ~/images:/code/neural-style/images bmaltais/cudnn-neural-style

where "~/images" is your path to your images folder

## Run neural-style:

nvidia-docker run --rm -it -v ~/images:/root/neural-style-pt/images bmaltais/cudnn-neural-style-pt

where "~/images" is your path to your images folder