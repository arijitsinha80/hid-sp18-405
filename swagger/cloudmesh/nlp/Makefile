
SWAGGERCODEGEN=java -jar swagger-codegen-cli-2.3.1.jar
YAMLFILE=nlp_v2.yaml
DESTDIR=server/nlp/flaskConnexion
CREATED=server
NLPDIR=nlps

all: service start 
	@echo "DONE"

docker-all: docker-build docker-start
	@echo "DONE"

docker-build:
	@echo "building the image from docker file..."
	docker build -t minchen57/cloudmesh-nlp .
	@echo "image DONE"

docker-pull:
	@echo "pulling the image from dockerhub..."
	docker pull minchen57/cloudmesh-nlp
	@echo "image DONE"

docker-start:
	@echo "starting the service in container..."
	docker run -p 8080:8080 minchen57/cloudmesh-nlp

docker-stop:
	@echo "stoping the service..."
	docker stop $$(docker ps -alq)
	@echo "service stopped"

docker-remove:
	@echo "removing the image..."
	docker rmi -f minchen57/cloudmesh-nlp
	@echo "image removed"

docker-clean: docker-stop docker-remove
	@echo "DONE"

dest:
	mkdir -p $(DESTDIR)
	 
service: dest
	@echo "creating the service..."
	wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.3.1/swagger-codegen-cli-2.3.1.jar
	$(SWAGGERCODEGEN) generate \
	-i $(YAMLFILE) \
	-l python-flask \
	-o $(DESTDIR) \
	-D supportPython3=true
	
	rm *.jar

	cp -r *.py $(DESTDIR)/swagger_server/controllers
	cd $(NLPDIR) && pip install -r requirements.txt && python setup.py install
	
	cd $(DESTDIR) && pip install -r requirements.txt && \
	python setup.py install 
	
	

start:  
	@echo "starting the service..."
	cd $(DESTDIR) && python -m swagger_server

test:
	curl http://localhost:8080/cloudmesh/nlp/all/Tim%20Cook%20is%20the%20CEO%20of%20Apple.

	curl http://localhost:8080/cloudmesh/nlp/pos/Tim%20Cook%20is%20the%20CEO%20of%20Apple.
            
stop:
	@echo "stopping the service"
	ps -ef | grep swagger_server | grep -v "grep" | awk '{print $$2}' | xargs kill -9
	@echo "service stopped"

clean:
	@echo "removing service files created"
	rm -rf $(CREATED)


