FROM rocker/tidyverse:4.0.3

ARG EVALUATOR_VERSION
ARG GITHUB_PAT

LABEL org.opencontainers.licenses="MIT" \
      org.opencontainers.source="https://github.com/davidski/tidyrisk-docker" \
      maintainer="David F. Severski <davidski@deadheaven.com>"

# collector doesn't need shiny
#RUN export ADD=shiny && bash /etc/cont-init.d/add

RUN apt-get update \
    && apt-get install -y zlib1g-dev libproj-dev libcairo2-dev libmagick++-dev \
    && install2.r --deps=TRUE remotes \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD "https://api.github.com/repos/davidski/collector/git/refs/heads/main?access_token=${GITHUB_PAT}" "collector_version.json"

# Silence pragma warnings for RcppEigen
# Reference https://github.com/kaskr/adcomp/issues/277#issuecomment-400191014
COPY Makevars /root/.R/Makevars

RUN installGithub.r --deps=TRUE davidski/collector \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /data

EXPOSE 8787
EXPOSE 3838
