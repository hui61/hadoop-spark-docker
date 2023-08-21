## Run Hadoop and Spark within Docker Containers

`环境：MacOS Ventura 13.5`

`机型：MacBook Pro (M1, 2021)`

#### 1. Download resource files
- [hadoop-3.3.1-aarch64](https://dlcdn.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1-aarch64.tar.gz)
- [JDK1.8-aarch64](https://gitee.com/Bric666/java/attach_files/803375/download/jdk-8u301-linux-aarch64.tar.gz) 
- [scala-2.12.14](https://downloads.lightbend.com/scala/2.12.14/scala-2.12.14.tgz) 
- [spark-3.2.1-bin-hadoop3.2](https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz)
- [pyspark-3.4.1](https://files.pythonhosted.org/packages/0c/66/3cf748ba7cd7c6a4a46ffcc8d062f11ddc24b786c5b82936c857dc13b7bd/pyspark-3.4.1.tar.gz)

Move `hadoop-3.3.1-aarch64.tar.gz`、`jdk-8u301-linux-aarch64.tar.gz`、`scala-2.12.14.tgz`、`spark-3.2.1-bin-hadoop3.2.tgz` and `pyspark-3.4.1.tar.gz` to `resources` folder

##### 2. build Dockerfile
```
docker build -f Dockerfile -t puppets/hadoop:1.1 .
```

##### 3. create hadoop network

```
sudo docker network create --driver=bridge hadoop
```

##### 4. start container

```
sudo ./start-container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
```

##### 5. start hadoop

```
docker exec -it hadoop-master bash
./start-hadoop.sh
```
因为yarn配置在hadoop-slave2节点，所以还需要去hadoop-slave2启动
```
docker exec -it hadoop-slave2 bash
./start-hadoop.sh
```

##### 6. run wordcount
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
