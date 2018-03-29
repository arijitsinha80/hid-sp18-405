# Apache Hadoop 3.0.1 Docker image
Originally cloned from [this repo](https://github.com/sequenceiq/hadoop-docker)

# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build  -t minchen57/hadoop-docker:3.0.1 .
```
# Pull the image


```
docker pull minchen57/hadoop-docker:3.0.1 .
```

# Start a container

In order to use the Docker image you have just build or pulled use:


```
docker run -it minchen57/hadoop-docker:3.0.1 /etc/bootstrap.sh -bash
```

# Testing
To test, please refer to the docker hadoop section in the [book](https://drive.google.com/file/d/1Mdd_TJcbXurJYRpG2gKCVqWmbhvED2Mp/view)

## Statistics

Find instruction and source code to run in the following directory:

`/cloudmesh/exer1`

## PageRank Example

Find instruction and source code to run in the following directory:

`/cloudmesh/pagerank`


