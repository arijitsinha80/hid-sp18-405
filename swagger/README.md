# Cloud and Big Data Rest Service with Swagger

## Notes For Instructors 
Below are the files that I modified or used which are not given by Swagger CodeGen
* The yaml file I used is in 

        hid-sp18-405/swagger/nlp.yaml
    
* I modified the file default_controller at 

        hid-sp18-405/swagger/server/nlp/flaskConnexion/swagger_server/controllers/default_controller.py
    
* The nlp related modules are called from 

      	hid-sp18-405/swagger/nlps/

To install these modules, please cd to the above directory and
run:

		python setup.py install

## Service Descprition

I was trying to build a service with Natural Language Processing
capabilities which takes English sentences as input and returns
various linguistic features. This may lead towards the final project
in this course.

In the current implementation, I allow the request to specify
sentences in the uri and the response will include the following
features:

* tokens
* part of speech taggings
* dependency parsing results
* named entity recognition
    
These features are derived mainly using spacy. Later in the semester,
I may consider using Stanford CoreNLP, NLTk etc to get more nlp
results depending on the final service that I want to deliver.

## Server Generation Using Swagger Codegen

I followed the instruction from
[handbook](https://drive.google.com/file/d/1Mdd_TJcbXurJYRpG2gKCVqWmbhvED2Mp/view),
chapter 34: REST Service Generation with Swagger

## Start The Service

* clone the repository
* navigate to the server directory 

        cd /hid-sp18-405/swagger/server/nlp/flaskConnexion

* start the service by execute:

        python -m swagger_server

* The following will show

        Running on http://0.0.0.0:8080/ (Press CTRL+C to quit)


## Testing and Requesting Using the Browser
Now I will give examples of the services with the example sentence "Tim Cook is the CEO of Apple."
* part of speech taggings

	    http://localhost:8080/nlp/pos/Tim Cook is the CEO of Apple.
	
	Get following response:

		{
	  "tags": "('Tim', 'PROPN') , ('Cook', 'PROPN') , ('is', 'VERB') ,
	  ('the', 'DET') , ('CEO', 'PROPN') , ('of', 'ADP') , ('Apple', 'PROPN') , ('.', 'PUNCT')",
	  "tokens": "Tim , Cook , is , the , CEO , of , Apple , ."
		}

* dependency parsing results

	    http://localhost:8080/nlp/depparse/Tim Cook is the CEO of Apple.
	
	Get following response:

		{
	    "parsetree": "('Tim', 'compound', 'Cook') , ('Cook', 'nsubj', 'is'), ('is', 'ROOT', 'is') ,
	    ('the', 'det', 'CEO') , ('CEO', 'attr', 'is') , ('of', 'prep', 'CEO') , 
	    ('Apple', 'pobj', 'of') , ('.', 'punct', 'is')",
	    "tokens": "Tim , Cook , is , the , CEO , of , Apple , ."
        }

* named entity recognition

		http://localhost:8080/nlp/entity/Tim Cook is the CEO of Apple.

	Get following response:
	
		{
	  "entities": "('Tim', 'PERSON') , ('Cook', 'PERSON') , ('is', '') , ('the', '') ,
	   ('CEO', '') , ('of', '') , ('Apple', 'ORG') , ('.', '')",
	  "tokens": "Tim , Cook , is , the , CEO , of , Apple , ."
		}

* all linguistic features enabled
 
		http://localhost:8080/nlp/all/Tim Cook is the CEO of Apple.
	
	Get following response:

	    {
	  "entities": "('Tim', 'PERSON') , ('Cook', 'PERSON') , ('is', '') , ('the', '') , 
	  ('CEO', '') , ('of', '') , ('Apple', 'ORG') , ('.', '')",
	  "parsetree": "('Tim', 'compound', 'Cook') , ('Cook', 'nsubj', 'is') , ('is', 'ROOT', 'is') ,
	   ('the', 'det', 'CEO') , ('CEO', 'attr', 'is') , ('of', 'prep', 'CEO') , 
	   ('Apple', 'pobj', 'of') , ('.', 'punct', 'is')",
	  "tags": "('Tim', 'PROPN') , ('Cook', 'PROPN') , ('is', 'VERB') , ('the', 'DET') , 
	  ('CEO', 'PROPN') , ('of', 'ADP') , ('Apple', 'PROPN') , ('.', 'PUNCT')",
	  "tokens": "Tim , Cook , is , the , CEO , of , Apple , ."
		}

