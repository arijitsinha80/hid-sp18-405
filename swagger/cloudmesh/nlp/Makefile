
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
	docker build -t minchen57/cloudmesh-nlp .

docker-pull:
	docker pull minchen57/cloudmesh-nlp

docker-start:
	docker run -p 8080:8080 minchen57/cloudmesh-nlp

docker-stop:
	docker stop $$(docker ps -alq)

docker-remove:
	docker rmi -f minchen57/cloudmesh-nlp

docker-clean: docker-stop docker-remove


dest:
	mkdir -p $(DESTDIR)
	 
service: dest
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
	cd $(DESTDIR) && python -m swagger_server

test:
	curl http://localhost:8080/cloudmesh/nlp/all/Tim%20Cook%20is%20the%20CEO%20of%20Apple.

	curl http://localhost:8080/cloudmesh/nlp/pos/Tim%20Cook%20is%20the%20CEO%20of%20Apple.
            
stop:
	ps -ef | grep swagger_server | grep -v "grep" | awk '{print $$2}' | xargs kill -9


clean:
	rm -rf $(CREATED)


