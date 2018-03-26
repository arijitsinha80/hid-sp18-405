# Docker Hub

Min Chen (hid-sp18-405) 

Docker Hub is a cloud-based registry service which allows users to link to code repositories, build their own images and test them, stores manually pushed images, and links to Docker Cloud so they can deploy images to their hosts~\cite{hid-sp18-405-tutorial-dockerhub-overview}. There are both public and private repositories. Companies could have a private repository for use within their own organization, whereas public images can be used by anyone. 

There are thousands of images published on DockerHub. DockerHub is hardcoded into Docker as the default registry, so when you run the docker pull command against any image, it will be downloaded from Docker Hub~\cite{hid-sp18-405-tutorial-dockerhub-blog-use}. It provides a centralized resource for container image discovery, distribution and change management, user and team collaboration, and workflow automation throughout the development pipeline~\cite{hid-sp18-405-tutorial-dockerhub-overview}.

## Create Docker ID and Log In
You could create a Docker ID on the [Docker Hub main page](https://hub.docker.com/). Log-in is not necessary for pulling Docker images from the Hub but necessary for push images. After registration, you get one free private Docker Hub Repository. Upgrade to a paid plan is needed if you need more private repositories.

## Searching for Docker Images
There are two ways to search for Docker images on Docker Hub:
* One way is to search via the Web Search box at the top of the Docker web page by typing the keyword
* The other way is to use the Docker command line tool. You could open an terminal and run the *docker search* command. For example, the following command searches for centOS images:

        docker search centos

and here is the first several lines of the result:

        | NAME                            | DESCRIPTION                  | STAR | OFFICIAL | AUTOMATED |
        |---------------------------------|------------------------------|------|----------|-----------|
        | centos                          | The official build of CentOS | 4130 | [OK]     |           |
        | ansible/centos7-ansible         | Ansible on Centos7           | 105  |          | [OK]      |
        | imagine10255/centos6-lnmp-php56 | centos6-lnmp-php56           | 40   |          | [OK]      |


## Resources

* The steps and instructions are modified from [Apache Avro 1.8.2 Getting Started](http://avro.apache.org/docs/1.8.2/gettingstartedpython.html)

* The Avro Python library does not support code generation, while Avro used with Java supports code generation, see [Apache Avro 1.8.2 Getting Started (Java)](http://avro.apache.org/docs/1.8.2/gettingstartedjava.html) for details






