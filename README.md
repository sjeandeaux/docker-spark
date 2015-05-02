# Docker Spark

##Build

```shell
docker build -t sjeandeaux/docker-spark .
```

##Run

```shell
docker run -ti --rm=true  --name spark  -v $(pwd)/job:/var/lib/job:ro \
      sjeandeaux/docker-spark --class org.apache.spark.examples.SparkPi --master local[8] \
      /var/lib/job/examples.jar 100
```

##open bash

```shell
docker run -ti --name spark --entrypoint="/bin/bash" -v $(pwd)/job:/var/lib/job:ro sjeandeaux/docker-spark 
```
