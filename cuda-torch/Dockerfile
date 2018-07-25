FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu14.04

RUN mkdir /code
WORKDIR /code

RUN apt-get update -qqy && apt-get install -qqy \
                ca-certificates \
                git curl wget \
                software-properties-common \
        --no-install-recommends && \
        apt-get -qqy clean && rm -rf /var/lib/apt/lists/*

RUN curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
RUN git clone https://github.com/torch/distro.git torch --recursive
WORKDIR /code/torch
RUN bash install.sh
ENV PATH=$PATH:/code/torch/install/bin/

CMD ["/bin/bash"]
