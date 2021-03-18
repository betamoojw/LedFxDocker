FROM python:3.9-buster

WORKDIR /app

RUN pip install Cython
RUN apt-get update
RUN apt-get install -y gcc \
                       git \
                       libatlas3-base \
		       libavformat58 \
                       portaudio19-dev \
		       avahi-daemon \
                       pulseaudio 
RUN pip install --upgrade pip wheel setuptools
RUN pip install git+https://github.com/LedFx/LedFx

RUN apt-get install -y alsa-utils
RUN adduser root pulse-access

RUN apt-get install -y wget \
                       libavahi-client3 \
                       libavahi-common3 \
                       apt-utils

RUN apt-get install -y squeezelite 

COPY setup-files/ /app/
RUN chmod a+wrx /app/*

ENTRYPOINT ./entrypoint.sh 
