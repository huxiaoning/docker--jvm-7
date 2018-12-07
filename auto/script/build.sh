#!/bin/bash

# 停止运行中的app:1.0的容器
if [ $(docker ps | grep "app" | wc -l) -gt 0 ];then
    c_pid=$(docker ps | grep "app" | awk '{print $1}')
    echo "停止运行中的容器"
    docker stop $c_pid
fi

# 删除停止的app:1.0容器
if [ $(docker ps -a | grep "app" | wc -l) -ge 1 ];then
    echo "删除已停止的容器"
    docker rm $c_pid
fi

cd ~/IdeaProjects/docker-jvm-7

mvn clean package

cp ~/IdeaProjects/docker-jvm-7/target/docker-jvm-7-1.0-SNAPSHOT.jar ~/IdeaProjects/docker-jvm-7/auto/build

cd ~/IdeaProjects/docker-jvm-7/auto/build

docker build -t app:1.0 .

docker run --cap-add=SYS_PTRACE --rm --name app -p 7000:7000 -p 1099:2099 -d app:1.0




# 删除没用的镜像
if [ $(docker images| grep "<none>" | wc -l) -ge 1 ];then
    echo "删除没用的镜像"
    docker rmi $(docker images| grep "<none>" | awk '{print $3}')
fi