#!/bin/sh


# 3. 启动api网关服务
a=$(docker ps -a | grep zuulservice-1.0 | awk '{print $1}')
l=$(expr length $a)

if [ "$a" != "" -a "$l" -eq 12 ]
then
    docker stop $a
	docker rm $a
	echo "服务zuulservice已删除"
fi
docker run --name zuulservice-1.0 -d -p 9030:9030 -v /commonjars/zuulservice/lib:/commonjars/lib/ -v /root/docker/jre1.8.0_171:/usr/java/jre1.8.0_171 scup08/zuulservice:1.0
echo "服务zuulservice已启动，，，，"

# 4. 启动权鉴服务
a=$(docker ps -a | grep authenticationservice-1.0 | awk '{print $1}')
l=$(expr length $a)

if [ "$a" != "" -a "$l" -eq 12 ]
then
    docker stop $a
	docker rm $a
	echo "服务authenticationservice已删除"
fi
docker run --name authenticationservice-1.0 -d -p 9002:9002 -v /commonjars/authenticationservice/lib:/commonjars/lib/ -v /root/docker/jre1.8.0_171:/usr/java/jre1.8.0_171 scup08/authenticationservice:1.0
echo "服务authenticationservice已启动，，，，"

# 5. 启动用户管理服务
a=$(docker ps -a | grep account-1.0 | awk '{print $1}')
l=$(expr length $a)

if [ "$a" != "" -a "$l" -eq 12 ]
then
    docker stop $a
	docker rm $a
	echo "服务account已删除"
fi
docker run --name account-1.0 -d -p 9011:9011 -v /commonjars/account/lib:/commonjars/lib/ -v /root/docker/jre1.8.0_171:/usr/java/jre1.8.0_171 scup08/account:1.0
echo "服务account已启动，，，，"
