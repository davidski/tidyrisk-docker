FROM rocker/rstudio:latest

LABEL maintainer="davidski@deadheaven.com"

RUN apt-get update \
    && apt-get install -y zlib1g-dev libproj-dev \
    && install2.r --deps=TRUE remotes \
    && installGithub.r rstudio/rmarkdown \
    && installGithub.r --deps=TRUE davidski/evaluator \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8787
