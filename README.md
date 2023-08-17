## Run Hadoop v3.3.1 within Docker Containers

`环境：MacOS Ventura 13.5`

`机型：Mac mini (M1, 2020)`

##### 1. build Dockerfile
```
docker build -f Dockerfile -t puppets/hadoop:1.0 .
```

##### 2. create hadoop network

```
sudo docker network create --driver=bridge hadoop
```

##### 3. start container

```
sudo ./start-container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
```

##### 4. start hadoop

```
docker exec -it hadoop-master bash
./start-hadoop.sh
```
因为yarn配置在hadoop-slave2节点，所以还需要去hadoop-slave2启动
```
docker exec -it hadoop-slave2 bash
./start-hadoop.sh
```

##### 5. run wordcount
在master节点运行任务
```
./run-wordcount.sh 3.3.1
```

**output**

```
input file1.txt:
Hello Hadoop

input file2.txt:
Hello Docker

wordcount output:
Docker    1
Hadoop    1
Hello    2
```

##### 8. WebUI
- [HDFS UI](http://localhost:9870/)
![img1.png](images%2Fimg1.png)
- [SPARK UI](http://localhost:8088/)
![img2.png](images%2Fimg2.png)
