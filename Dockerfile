# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2022.3-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

COPY workspace-public-pythonpath.sh /etc/datahub-profile.d/

RUN apt-get update && apt-get install --no-install-recommends -y git-lfs \
    && apt-get clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* 

USER jovyan

# Install & activate this Jupyterlab plugin
RUN conda install -c conda-forge ipywebrtc && \
    jupyter labextension install jupyter-webrtc 

