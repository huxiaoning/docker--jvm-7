#!/bin/bash

nohup jstatd -J-Djava.security.policy=jstatd.all.policy -J-Djava.rmi.server.logCalls=true &

java -jar /work/docker-jvm-7-1.0-SNAPSHOT.jar