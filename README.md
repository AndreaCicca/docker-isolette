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

Since other scripts (like `clean.sh`) rely on the path of the CMake compilation, it is important to bind the git repository directory to the same path of the host system (`-v` flag in the run command).
Furthermore, it is important to run the container as the current user to avoid permission headaches (`-u`).

#### Build the image
```
docker build -t isolette:latest .
```

#### Run the container
```
docker run --rm -v $(pwd)/Isolette:$(pwd)/Isolette -u $(id -u):$(id -g) isolette [build | run | build_run] $(pwd)
```
- `build` builds the project, `prepare.sh` and `build.sh` are executed
- `run` runs all tests, `run_all_ut.sh` and `run_all_scenarios.sh` are executed
- `build_run` runs both of the above commands
- `$(pwd)` is the path of the parent directory of the Git repository

### Other containers
Dockerfiles for other useful containers will be added during the project to address specific needs.
- light: lighter version of the default container, only building tools
- sphinx: tools needed to build the specification paper

## `sphinx`
The sphinx container builds the specification paper using the building scripts provided in the Isolette repository.
The amd64 image is available at https://hub.docker.com/r/giammisimo/sphinx
#### Build
```
docker build -t isolette_sphinx:latest -f Dockerfile_sphinx .
```
#### Run
```
docker run --rm -v $(pwd)/Isolette:/Isolette -u $(id -u):$(id -g) sphinx
```
