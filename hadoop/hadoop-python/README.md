# Apache Hadoop 2.9.0 Docker image
Originally cloned from [this repo](https://github.com/sequenceiq/hadoop-docker)

# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

		docker build  -t minchen57/hadoop-docker-python .


# Pull the image

		docker pull minchen57/hadoop-docker-python .


# Start a container with interactive shell

In order to use the Docker image you have just build or pulled use:

		docker run -it minchen57/hadoop-docker-python /etc/bootstrap.sh -bash

# Testing

* Load data

		export PATH=$PATH:/$HADOOP_PREFIX/bin
		cd /cloudmesh/python
		hadoop fs -mkdir tom_input
		hadoop fs -put ./data/* tom_input

* Run 

		hadoop  jar $HADOOP_HADOOP_PREFIX/share/hadoop/tools/lib/hadoop-streaming-2.9.0.jar   -input tom_input     -output tom_output    -mapper /cloudmesh/python/mapper2.py  -reducer /cloudmesh/python/reducer2.py

* Or using script directly

		cd /cloudmesh/python
		./runPythonMapReduce.sh ./data output /cloudmesh/python/mapper2.py /cloudmesh/python/reducer2.py"
