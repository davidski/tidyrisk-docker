## Introduction

An all-in-one setup for running [evaluator](https://github.com/davidski/evaluator). Based upon
the [rocker](https://hub.docker.com/r/rocker/rstudio/) RStudio image, this allows users to have a known 
working installation of Evaluator and all of its dependencies without having to manage a local installation.

##  How to Use

### Interactive Use

1. Install Docker (free community editions for MacOS, Windows, Linux, and several cloud providers are 
all available via the [Docker Store](https://store.docker.com/search?type=edition&offering=community)).
2. `docker run -d -p 8787:8787 davidski/evaluator-docker:latest`.
3. Navigate with a local web browser to http://localhost:8787.
4. Login to RStudio with the user `rstudio` and the password `rstudio`.

### Simplified Analysis Flow

1. `docker run --rm -v "$(pwd)/evaluator":/data davidski/evaluator-docker:latest create_templates`.
2. Edit the templates in the `evaluator/inputs` subdirectory on your host system.
3. `docker run --rm -v "$(pwd)/evaluator":/data davidski/evaluator-docker:latest run_analysis`.
4. Consume the reports and analysis in the `evaluator/results` directory on your host system.

### Data Storage

You can share data between your local host and the evaluator instance by mounting volumes to the 
container's `/home/rstudio` directory.

To store data in a pre-existing `data` subdirectory in your host's current working directory, use the 
following command:

> `docker run -d -p 8787:8787 -v $(pwd)/data:/home/rstudio davidski/evaluator-docker:latest`

## See Also

* [Evaluator](https://evaluator.severski.net) - For information on the Evaluator risk 
quantification toolkit.
* [Rocker Wiki](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image) - For additional 
options on running and configuring the Dockerized RStudio instance.

## Contributing

This project is governed by a [Code of Conduct](./CODE_OF_CONDUCT.md). By 
participating in this project you agree to abide by these terms.

## License

The [MIT License](LICENSE) applies.
