## Introduction

An all-in-one setup for running [evaluator](https://github.com/davidski/evaluator). As a Docker
container based upon the [rocker](https://hub.docker.com/r/rocker/rstudio/) RStudio image, this allows users to have a known working installation of Evaluator with all dependencies without having to install R.

##  How to Use

1. Install Docker (free community editions for MacOS, Windows, Linux, and several cloud provideres are all available via the [Docker Store](https://store.docker.com/search?type=edition&offering=community)).
2. `docker run -d -p 8787:8787 davidski/evaluator:0.1.0`.
3. Navigate with a local web browser to http://localhost:8787.
4. Login to RStudio with the user `rstudio` and the password `rstudio`.

### Data Storage

By mounting volumes to the container's `/home/rstudio` directory you can share data between your local computer and the evaluator instance. 

To store data in a pre-existing `data` subdirectory in the current working directory, use the follwing command:

> `docker run -d -p 8787:8787 -v $(pwd)/data:/home/rstudio davidski/evaluator:0.1.0`

## See Also

* [Evaluator](https://github.com/davidski/evaluator) - For information on the Evaluator risk quantification project.
* [Rocker Wiki](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image) - For additional options on running and configuring the Dockerized RStudio instance.

## Contributing

This project is governed by a [Code of Conduct](./CODE_OF_CONDUCT.md). By 
participating in this project you agree to abide by these terms.

## License

The [MIT License](LICENSE) applies.
