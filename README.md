# Docker Gambas 3 - Ubuntu 22.10

Ubuntu 22.10 Docker image for the Gambas programming language.

Use Gambas stable version `3.17.3`

## Pull from Docker Hub
docker pull ricp/gambas:3.17.3

### Or build image from Dockerfile
To build the image use the script `./build.sh`

Or run the command below
`docker  build -t ricp/gambas:3.17.3 .`

## Run the container
To run the docker container use `./run.sh`

Or run the command below
`docker run --rm -it  --name gambas ricp/gambas:3.17.3`
