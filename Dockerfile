FROM rocker/rstudio:latest

ARG EVALUATOR_VERSION

LABEL maintainer="davidski@deadheaven.com"

RUN apt-get update \
    && apt-get install -y zlib1g-dev libproj-dev \
    && install2.r --deps=TRUE remotes

ADD https://api.github.com/repos/davidski/evaluator/git/refs/heads/master version.json

RUN installGithub.r --deps=TRUE davidski/evaluator \
                          && apt-get clean \
                          && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY create_templates.R /usr/local/bin/create_templates
COPY run_analysis.R /usr/local/bin/run_analysis

VOLUME /data

EXPOSE 8787
