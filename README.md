## DRSSS Isolette Project - Dockerized build environment

Docker environment complete with all the needed dependencies to build the project.
Note that this is not a complete implementation and it will need to be expanded during the project if new tools / requirements are needed.

This environment is not to be used as-is and it will probably need some tweaks for your specific needs.
Thus, I recommend you use this tool ONLY if you know how to use Docker properly.

The amd64 image is available at https://hub.docker.com/r/giammisimo/isolette
The arm64 image is available at https://hub.docker.com/r/andreacicca/isolette

The repository provides the two files necessary to build the image on your own.

### How to Use

The image currently offers building and testing.
Git and gnuplot functionalities are not provided and are meant to be used outside of the container. If needed they can be added to the image via Dockerfile and a custom build.

The git repository for the project is to be mounted to the `/Isolette` dir.

#### Build the image
```
docker build -t isolette:latest .
```

#### Run the container
```
docker run --rm -v <isolette_repository>:/Isolette isolette [build | run]
```
- `build` builds the project, `prepare.sh` and `build.sh` are executed
- `run` runs all tests, `run_all_ut.sh` and `run_all_scenarios.sh` are executed
