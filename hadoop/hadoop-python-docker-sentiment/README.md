# Apache Hadoop 2.9.0 Docker cluster for sentiment analysis on movie reviews

## More info regarding the image will be provided later

## Run fully distributed cluster using the Makefile

* Single command to build images, start cluster, run analysis and get back results before shutting down the cluster by providing the number of workers needed (default is 1):

		make all worker=(#OFWORKERS)

	example: 
		make all worker=3

* Build images needed for master and workers

		make build worker=(#OFWORKERS)
		
* Launch hadoop cluster by using docker-compose with interactive shell

		make shell

* Launch hadoop cluster at back end

		make start

* Run the analysis after cluster is lunched

		make run

* Get the analysis result

		make get

* Shut down the cluster

		make down
		
* One can check the ResourceManger at [http://localhost:8088](http://localhost:8088)

## Run pseudo-distributed cluster 

The execution of the same analysis on pseudo-distributed cluster is isolated in the directory hadoop-pseudo, details are listed in the Readme.md file in this directory. 

* First cd to this directory then use the Makefile there:

		cd hadoop-pseudo


* Build image, run analysis, get results

		make all
		
* Build the image	

		make build

* Run container with interactive shell

		make container

* Run the container with sentiment analysis

		make run

* Get the result after the analysis

		make get

* Stop container

		make stop

* Clean up result 

		make clean


## Run cluster on Echo

The cluster can be deployed on FutureSystem Echo. Both pseudo-distributed and fully distributed clusters are supported. 

* First cd to this directory:

		cd echo

* To start pseudo-distributed cluster, run analysis and get back results before shutting down the cluster

		./pseudo-run.sh

* To start fully distributed cluster with number of workers using docker-compose, run analysis and get back results before shutting down the cluster 

		./compose-all.sh (#OFWORKERS)

	example:
		./compose-all.sh 3

* To remove the Results folders and created yml file

		./clean.sh