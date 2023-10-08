#!/bin/bash

echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 9870:9870 \
                -p 9860-9866:9860-9866 \
				        -p 9000:9000 \
				        -p 4040:4040 \
                --name hadoop-master \
                --hostname hadoop-master \
                puppets/hadoop:1.1


echo "start hadoop-slave1 container..."
sudo docker run -itd \
        --net=hadoop \
        --name hadoop-slave1 \
        --hostname hadoop-slave1 \
        puppets/hadoop:1.1



echo "start hadoop-slave2 container..."
sudo docker run -itd \
        -p 8088:8088 \
        --net=hadoop \
        --name hadoop-slave2 \
        --hostname hadoop-slave2 \
        puppets/hadoop:1.1
