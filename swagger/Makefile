.PHONY: book images

JARFILE=swagger-codegen-cli-2.3.1.jar
YAMLFILE=nlp.yaml
DESTDIR=server/nlp/flaskConnexion
DESTDIR2=server

dest:
	mkdir -p $(DESTDIR)

service: dest
	java -jar $(JARFILE) generate -i $(YAMLFILE) -l python-flask -o $(DESTDIR) -D supportPython3=true
	cp -r *.py $(DESTDIR)/swagger_server/controllers
	#cp -r config.yaml $(DESTDIR)/creds
run: 
	cd $(DESTDIR) && pip install -r requirements.txt && \
	python setup.py install && python -m swagger_server

start:  
	cd $(DESTDIR) && python -m swagger_server

test:
	curl http://localhost:8080/nlp/all/Tim%20Cook%20is%20the%20CEO%20of%20Apple.
	curl http://localhost:8080/nlp/pos/Tim%20Cook%20is%20the%20CEO%20of%20Apple.
            
stop:
	ps -ef | grep swagger | grep -v "grep"| awk '{print $$2}' | xargs kill -9

clean:
	rm -rf $(DESTDIR2)
