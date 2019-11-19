FROM bmaltais/cudnn-neural-style

WORKDIR /code/neural-style

RUN apt-get update -qqy && \
    apt-get install -qqy python-skimage && \
    apt-get -qqy clean && \
    rm -rf /var/lib/apt/lists/*

RUN git pull

ENV PATH=$PATH:/code/neural-style/