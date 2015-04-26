current_dir = $(shell pwd)
host = $(shell if [ -n "$(shell which boot2docker)" ]; then boot2docker ip; else echo 127.0.0.1; fi)
docker_host = $(shell if [ -n "$(shell which boot2docker)" ]; then boot2docker ip; else ifconfig docker0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'; fi)

tag = sjeandeaux/docker-spark
littleName = spark
publish =
environment =
command =

 
build:
	docker build -t $(tag) .

rm:
	docker rm -f $(littleName)

rmi:
	docker rmi -f $(tag)

logs:
	docker logs $(littleName)

exec:
	docker exec -ti $(littleName) /bin/bash

run:
	docker run -d --name $(littleName) $(publish) $(tag) $(command)

run-ti:
	docker run --rm -ti --name $(littleName) $(publish) $(tag) $(command)
