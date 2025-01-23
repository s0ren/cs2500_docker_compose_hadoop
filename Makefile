DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := $(shell git rev-parse --abbrev-ref HEAD)
build:
	docker build -t rgreen13/hadoop-base ./base
	docker build -t rgreen13/hadoop-namenode ./namenode
	docker build -t rgreen13/hadoop-datanode ./datanode
	docker build -t rgreen13/hadoop-resourcemanager ./resourcemanager
	docker build -t rgreen13/hadoop-nodemanager ./nodemanager
	docker build -t rgreen13/hadoop-historyserver ./historyserver
	# docker build -t rgreen13/hadoop-submit:$(current_branch) ./submit

pull:
	docker pull rgreen13/hadoop-base
	docker pull rgreen13/hadoop-namenode
	docker pull rgreen13/hadoop-datanode 
	docker pull rgreen13/hadoop-resourcemanager
	docker pull rgreen13/hadoop-nodemanager
	docker pull rgreen13/hadoop-historyserver

push:
	docker push rgreen13/hadoop-base
	docker push rgreen13/hadoop-namenode
	docker push rgreen13/hadoop-datanode 
	docker push rgreen13/hadoop-resourcemanager
	docker push rgreen13/hadoop-nodemanager
	docker push rgreen13/hadoop-historyserver
	
wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -copyFromLocal -f /opt/hadoop-3.2.1/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r /input
