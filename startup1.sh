#!/bin/sh

service docker start

# 1. 启动服务发现服务
a=$(docker ps -a | grep discoveryservice-1.0 | awk '{print $1}')
l=$(expr length $a)

if [ "$a" != "" -a "$l" -eq 12 ]
then
	docker stop $a
	echo "服务discoveryservice已停止"
	docker rm $a
	echo "服务discoveryservice已删除"
fi
docker run --name discoveryservice-1.0 -d -p 8761:8761 -v /commonjars/lib:/commonjars/lib/ -v /root/docker/jre1.8.0_171:/usr/java/jre1.8.0_171 scup08/discoveryservice:1.0
echo "服务discoveryservice已启动，，，，"


# 2. 启动配置中心服务
a=$(docker ps -a | grep configservice-1.0 | awk '{print $1}')
l=$(expr length $a)

if [ "$a" != "" -a "$l" -eq 12 ]
then
    docker stop $a
    echo "服务configservice已停止"
	docker rm $a
	echo "服务configservice已删除"
fi
docker run --name configservice-1.0 -d -p 9001:9001 -v /commonjars/lib:/commonjars/lib/ -v /root/docker/jre1.8.0_171:/usr/java/jre1.8.0_171 scup08/configservice:1.0
echo "服务configservice已启动，，，，"
