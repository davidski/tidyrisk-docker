FROM rocker/rstudio:3.5.3

ARG EVALUATOR_VERSION
ARG GITHUB_TOKEN

LABEL org.opencontainers.licenses="MIT" \
      org.opencontainers.source="https://github.com/davidski/tidyrisk-docker" \
      maintainer="David F. Severski <davidski@deadheaven.com>"

RUN export ADD=shiny && bash /etc/cont-init.d/add

RUN apt-get update \
    && apt-get install -y zlib1g-dev libproj-dev \
    && install2.r --deps=TRUE remotes \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://api.github.com/repos/davidski/evaluator/git/refs/heads/master?access_token=$GITHUB_TOKEN version.json

RUN installGithub.r --deps=TRUE davidski/evaluator \
                          && apt-get clean \
                          && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY scripts/create_templates.R /usr/local/bin/create_templates
COPY scripts/run_analysis.R /usr/local/bin/run_analysis

VOLUME /data

EXPOSE 8787
EXPOSE 3838
