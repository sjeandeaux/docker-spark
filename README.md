# Docker Spark

##Build

```shell
docker build -t sjeandeaux/docker-spark .
```

##Run

```shell
##open spark-submit
make run-ti
```

##open bash

```shell
docker run -ti --name spark --entrypoint="/bin/bash" -v $(pwd)/job:/var/lib/job:ro sjeandeaux/docker-spark 
```
