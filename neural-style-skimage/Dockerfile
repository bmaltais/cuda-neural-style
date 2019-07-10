FROM bmaltais/cudnn-neural-style

WORKDIR /code

RUN apt-get update -qqy && \
    apt-get install -qqy python-skimage && \
    apt-get -qqy clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /code/neural-style

ENV PATH=$PATH:/code/neural-style/
