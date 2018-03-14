FROM rocker/rstudio:latest

ARG EVALUATOR_VERSION

LABEL maintainer="davidski@deadheaven.com"

RUN apt-get update \
    && apt-get install -y zlib1g-dev libproj-dev \
    && install2.r --deps=TRUE remotes \
    && installGithub.r --deps=TRUE davidski/evaluator \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY evaluator.sh /etc/cont-init.d/evaluator

VOLUME /data

EXPOSE 8787
