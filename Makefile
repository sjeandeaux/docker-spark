current_dir = $(shell pwd)
host = $(shell if [ -n "$(shell which boot2docker)" ]; then boot2docker ip; else echo 127.0.0.1; fi)
docker_host = $(shell if [ -n "$(shell which boot2docker)" ]; then boot2docker ip; else ifconfig docker0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'; fi)

tag = sjeandeaux/docker-spark
littleName = spark
publish =
environment =
command =
volume = -v $(current_dir)/job:/var/lib/job:ro
expose = -p 4040:4040
 
build:
	docker build -t $(tag) -f $(shell docker-proxy-file) .

rm:
	docker rm -f $(littleName)

rmi:
	docker rmi -f $(tag)

logs:
	docker logs $(littleName)

exec:
	docker exec -ti $(littleName) /bin/bash

run:
	docker run -d --name $(littleName) $(publish) $(expose) $(volume) $(tag) $(command)

run-ti:
	docker run --rm -ti --name $(littleName) $(publish) $(expose) $(volume) $(tag) $(command)

run-bash:
	docker run -ti --name $(littleName) --entrypoint="/bin/bash" $(publish) $(expose) $(volume) $(tag) $(command)

run-example:
	docker run -ti --rm=true --name $(littleName) $(publish) $(expose) $(volume) $(tag) --class org.apache.spark.examples.SparkPi --master local[8] /var/lib/job/examples.jar 10000
