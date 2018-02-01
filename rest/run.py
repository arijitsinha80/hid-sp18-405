from eve import Eve
import platform
import psutil
from time import gmtime, strftime

my_settings = {
    'MONGO_HOST': 'localhost',
    'MONGO_PORT': 27017,
    'MONGO_DBNAME': 'the_db_name',
    'DOMAIN': {'contacts': {}}
}

time = strftime("%a, %d %b %Y %H:%M:%S, %Z",gmtime())

app = Eve(settings=my_settings)

@app.route('/processor')
def processor():
    name = platform.processor()
    return "Processor name: "+name+"\n"

@app.route('/ram')
def ram():
    totalRam = list(psutil.virtual_memory())[0]
    return "Total RAM: "+str(totalRam)+"\n"

@app.route('/disk')
def disk():
    Totaldisk = list(psutil.disk_usage('/'))[0]
    return "Total Disk : "+str(Totaldisk)+"\n"

@app.route('/freedisk')
def freedisk():
    freeDisk = {"value":list(psutil.disk_usage('/'))[2],"timeStamp": time}

    return "Free disk : "+str(freeDisk)+"\n"

if __name__ == '__main__':
    app.run()


#in shell use:
#python run.py
#curl -i http://localhost:5000/processor
#curl -i http://localhost:5000/ram
#curl -i http://localhost:5000/disk
#curl -i http://localhost:5000/freedisk

