# Map Reduce Commands & Examples

Below you will find examples of running various types of MapReduce commands using a variety of methods. All methods are based on Python.

## Run a basic, command line MapReduce operation in Python:
``` echo "foo foo foo moo moo moo" | ./Code/mapper.py | sort | ./Code/reducer.py ```

or

``` echo "foo foo foo moo moo moo" | ./Code/mapper2.py | sort | ./Code/reducer2.py ```

## Run the same operations, using Apache Hadoop Streaming with INPUT and OUTPUT stored in HDFS (You must replace INPUT and OUTPUT with appropriate files/directories)

```mapred streaming -files /Workspace/Code/mapper.py,/Workspace/Code/reducer.py -mapper mapper.py -reducer reducer.py -input INPUT -output OUTPUT```

or

```hadoop jar /opt/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-streaming-3.2.1.jar -files /Workspace/Code/mapper.py,/Workspace/Code/reducer.py -mapper mapper.py -reducer reducer.py -input INPUT -output OUTPUT```

Additional documentation can be found at http://hadoop.apache.org/docs/current/hadoop-streaming/HadoopStreaming.html 

## Run MapReduce operations using mrjob:

```python3.5 wordCount.py < [LOCAL_INPUT]```

## Run MapReduce operations using mrjob and HDFS:

```python3.5 wordCount.py -r hadoop < [HDFS_INPUT]```

Information, examples, and explations found at https://mrjob.readthedocs.io/en/latest/guides/quickstart.html