# This is for the assignment of REST using EVE
* ensure that eve is installed
* within the rest directory execute 
      ```
       python run.py
      ```
      
     

* Here are the rest route to check respective system params:
       
      * curl -i http://localhost:5000/processor
      * curl -i http://localhost:5000/ram
      * curl -i http://localhost:5000/disk
      * curl -i http://localhost:5000/freedisk
      * curl -i http://localhost:5000/allinfo
       
    
* Note that the previous 4 route is returning a string and the last one is returning a dictionary format