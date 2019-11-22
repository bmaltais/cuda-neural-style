FROM pytorch/pytorch:1.3-cuda10.1-cudnn7-runtime

WORKDIR /root

RUN pip install neural-style
RUN git clone https://github.com/ProGamerGov/neural-style-pt.git
WORKDIR /root/neural-style-pt
RUN python models/download_models.py