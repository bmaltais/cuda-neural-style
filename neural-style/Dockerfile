FROM bmaltais/cuda8.0-cudnn5-torch-14.04

WORKDIR /code

RUN apt-get update -qqy && \
    apt-get install -qqy wget libpng-dev libprotobuf-dev protobuf-compiler --no-install-recommends && \
    apt-get -qqy clean && \
    rm -rf /var/lib/apt/lists/*

RUN /code/torch/install/bin/luarocks install loadcaffe
RUN /code/torch/install/bin/luarocks install cudnn

# RUN git clone --depth 1 https://github.com/jcjohnson/neural-style.git
RUN git clone --depth 1 https://github.com/bmaltais/neural-style.git

WORKDIR /code/neural-style

RUN chmod +x models/download_models.sh
RUN sh models/download_models.sh
RUN cd models && wget https://gist.githubusercontent.com/ksimonyan/f0f3d010e6d5f0100274/raw/d2772f53a1c0f475dac65a8f2609d543062fa691/VGG_CNN_M_1024_deploy.prototxt && \
    wget http://www.robots.ox.ac.uk/~vgg/software/deep_eval/releases/bvlc/VGG_CNN_M_1024.caffemodel

ENV PATH=$PATH:/code/neural-style/

# Copy some extra models to model directory
COPY ["models/*" ,"models/"]
COPY ["lua/*" ,"./"]

