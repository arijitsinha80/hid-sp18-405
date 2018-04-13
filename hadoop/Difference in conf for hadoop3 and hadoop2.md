# The default configuration for hadoop 2.x.x and 3.01 

## The key properties that we may focus on are summarized as follows:

| Property Name                                                                | config file     | Description                                  | 2.9.0 default | 3.0.1 default                                                                                                                                                                                                                                          |
|------------------------------------------------------------------------------|-----------------|----------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| yarn.nodemanager.vmem-pmem-ratio                                             | yarn-site.xml   | ratio of virtual mem to physical mem allowed | 2.1           | 2.1                                                                                                                                                                                                                                                    |
| mapreduce.map.memory.mb                                                      | mapred-site.xml | Physical memory for each map task            | 1024          | -1 (If this is not specified or is non-positive, it is inferred from mapreduce.map.java.opts and mapreduce.job.heap.memory-mb.ratio. If java-opts are also not specified, it is 1024)                                                                  |
| mapreduce.reduce.memory.mb                                                   | mapred-site.xml | Physical memory for each reduce task         | 1024          | -1 (If this is not specified or is non-positive, it is inferred from mapreduce.map.java.opts and mapreduce.job.heap.memory-mb.ratio. If java-opts are also not specified, it is 1024)                                                                  |
| mapred.child.java.opts (mapreduce.map.java.opts, mapreduce.reduce.java.opts) | mapred-site.xml | Java heap size for the task processes.       | -Xmx200m      | If -Xmx is not set, it is inferred from mapreduce.{map,reduce}.memory.mb and mapreduce.job.heap.memory-mb.ratio                                                                                                                                        |
| mapreduce.job.heap.memory-mb.ratio                                           | mapred-site.xml | The ratio of heap-size to container-size.    | NA            | 0.8 (If no -Xmx is specified, it is calculated as (mapreduce.{map,reduce}.memory.mb * mapreduce.heap.memory-mb.ratio). If -Xmx is specified but not mapreduce.{map,reduce}.memory.mb, it is calculated as (heapSize / mapreduce.heap.memory-mb.ratio). |


## According to the table, there are several caveats:

* No need to change the yarn-site.xml, by default, it is the same
* mapreduce.job.heap.memory-mb.ratio does not exist in hadoop 2.x.x, but in 3.0.1, it is set to be 0.8. Therefore, to make the setting in 3.0.1 compatible with 2.x.x, we need to fix the mapred.child.java.opts (mapreduce.map.java.opts, mapreduce.reduce.java.opts) to be -Xmx200m. Otherwise, it will become, 1024*0.8 which differs from 200. 
* If we only change the mapred.child.java.opts to -Xmx200m in 3.0.1, then mapreduce.reduce(map).memory.mb will be inferred from 200/0.8, which is not 1024 anymore, therefore, we need to explicitly set them to 1024.

## Conclusion

To make settings in hadoop 3.0.1 compatible with 2.x.x, add the following in mapred-site.xml:

		<property>
	        <name>mapreduce.map.memory.mb</name>
	        <value>1024</value>
	    </property>
	    <property>
	        <name>mapreduce.reduce.memory.mb</name>
	        <value>1024</value>
	    </property>
	    <property>
	        <name>mapreduce.map.java.opts</name>
	        <value>-Xmx200m</value>
	    </property>
	    <property>
	        <name>mapreduce.reduce.java.opts</name>
	        <value>-Xmx200m</value>
	    </property>
	
Alternatively, could add the following in 2.x.x of mapred-site.xml:
		
		<property>
	        <name>mapred.child.java.opts</name>
	        <value>-Xmx800m</value>
	    </property>

**Do not do BOTH!!!**