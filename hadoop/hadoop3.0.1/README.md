# Apache Hadoop 3.0.1 Docker image
Originally cloned from [this repo](https://github.com/sequenceiq/hadoop-docker)

# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

		docker build  -t minchen57/hadoop-docker:3.0.1 .


# Pull the image

		docker pull minchen57/hadoop-docker:3.0.1 .


# Start a container with interactive shell

In order to use the Docker image you have just build or pulled use:

		docker run -it minchen57/hadoop-docker:3.0.1 /etc/bootstrap.sh -bash


# Testing
To test, please refer to the docker hadoop section in the [book](https://drive.google.com/file/d/1Mdd_TJcbXurJYRpG2gKCVqWmbhvED2Mp/view)

## Statistics
* Complie the java sources for calculating statistics: Min, Max, Std, Average

		export HADOOP_CLASSPATH=`$HADOOP_PREFIX/bin/hadoop classpath`
		mkdir /cloudmesh/exer1/dest
		javac -classpath $HADOOP_CLASSPATH -d /cloudmesh/exer1/dest cloudmesh/exer1/src/exercise/MinMaxAvgStd.java

* Archiving class files into a jar file 
		
		cd /cloudmesh/exer1
		jar -cvf exer1.jar -C ./dest/ .

* Load input files to HDFS

		export PATH=$PATH:/$HADOOP_PREFIX/bin
		hadoop fs -mkdir exer1_input
		hadoop fs -put input_data/* exer1_input
		hadoop fs -ls exer1_input/

* Run program with a single input file
		
		hadoop jar exer1.jar exercise.MinMaxAvgStd exer1_input/data_1000.txt exer1_output_1000

* Result
		
		hadoop fs -cat exer1_output_1000/part-r-00000

* Run program with With Multiple Files
		
		hadoop jar exer1.jar exercise.MinMaxAvgStd exer1_input/ exer1_output_all

* Result

		hadoop fs -cat exer1_output_all/part-r-00000

## PageRank Example

We provide two ways to run this example, either using the automated script or build the necessary files by hand
### Use the automated script

* We make the steps of compiling java source, archiving class files, load input files and run the program into one single script. To execute it with the input file: PageRankDataGenerator/pagerank5000g50.input.0, using 5000 urls and 1 iteration:
		
		cd /cloudmesh/pagerank

		./compileAndExecHadoopPageRank.sh PageRankDataGenerator/pagerank5000g50.input.0 5000 1
		
* Result

		output.pagerank/part-r-00000

* Head of the result

		head output.pagerank/part-r-00000

### Compile and run by hand
* If one wants to generate the java class files and archive them as the previous exercise, one could use the following code (which is actually inside compileAndExecHadoopPageRank.sh)

		export HADOOP_CLASSPATH=`$HADOOP_PREFIX/bin/hadoop classpath`
		mkdir /cloudmesh/pagerank/dist
		find /cloudmesh/pagerank/src/indiana/cgl/hadoop/pagerank/ -name "*.java"|xargs  javac -classpath $HADOOP_CLASSPATH -d /cloudmesh/pagerank/dist
		cd /cloudmesh/pagerank/dist
		jar -cvf HadoopPageRankMooc.jar -C . .

* Load input files to HDFS

		export PATH=$PATH:/$HADOOP_PREFIX/bin
		cd /cloudmesh/pagerank/
		hadoop fs -mkdir input.pagerank
		hadoop fs -put PageRankDataGenerator/pagerank5000g50.input.0 input.pagerank
		
* Run program with the [PageRank Inputs File Directory][PageRank Output Directory][Number of Urls][Number Of Iterations]
		
		hadoop jar dist/HadoopPageRankMooc.jar indiana.cgl.hadoop.pagerank.HadoopPageRank input.pagerank output.pagerank 5000 1

* Result
		
		hadoop fs -cat output.pagerank/part-r-00000
		
