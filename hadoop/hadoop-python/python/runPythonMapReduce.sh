#!/bin/bash

if [ $# -ne 4 ]; then
    echo 1>&2 Usage: [Input Dir][Output Dir][Mapper][Reducer]
    echo "e.g. ./runPythonMapReduce.sh ./data output /cloudmesh/python/mapper.py /cloudmesh/python/reducer.py"
    exit -1
fi

# run

export PATH=$PATH:/$HADOOP_PREFIX/bin
export JARFILE=$HADOOP_PREFIX/share/hadoop/tools/lib/hadoop-streaming-2.9.0.jar
hadoop fs -rm -R output_textanalysis
hadoop fs -rm -R input_textanalysis
hadoop fs -mkdir input_textanalysis
hadoop fs -put $1/* input_textanalysis
hadoop jar $JARFILE  -input input_textanalysis -output $2  -mapper $3 -reducer $4

# capture the standard output
rm -rf $2
hadoop fs -get $2 .

echo "PageRank Finished execution, see results in: "
echo $2