# Docker Volume

### 直接 docker run:
* 前提是容器的資料夾路徑要事先存在，要不然會 build error
```
$ docker run -it -v {本地端資料夾路徑}:{容器資料夾路徑} {image_name} sh
$ docker run -it -v /Users/Desktop:/data {image_name} sh
```

### 撰寫 Dockerfile
```
VOLUME ["{容器資料夾路徑}"]
VOLUME ["/data"]
```
使方法會在本地端隨機建立一個資料夾路徑，查看方法如下：
* Linux: `sudo docker inspect {container_name}`
* macOS: https://stackoverflow.com/questions/55603421/accessing-docker-volume-content-on-macos