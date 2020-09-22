# docker_tutorial
### docker installation
* Docker desktop [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) or [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

* [brew insatll](https://blog.yowko.com/homebrew-docker/)


### 使用方法：
1. clone this repo and cd into this as working directory

2. cd dir `cut_word` -> 中研院斷詞系統API 

3. cd dir `selenium` -> run selenium on Linux OS

***

### 基本指令
* 顯示 images 清單
```
$ docker images
```

* 顯示 containers 清單
```
$ docker ps
$ docker ps -a
```

```
$ docker build -t {image_name} .
# 利用 dockerfile 建立 images
# -t: 指定 image 的 tag
# .: 引入當前目錄的 dockerfile

$ docekr run -it -d {image_name} sh 
# run container 但進入編程模式
# -i: attach時鍵盤輸入會被Container接手。互動模式
# -t: attach時Container的螢幕會接到原來的螢幕上。配置一個終端機
# -d: --detach 背景執行, 結束 shell 不會停止 container
# --rm: Automatically remove the container when it exits
# sh: 建立 shell

$ docker exec -it {container_id} sh
# 若 docker run -d, 則後續可以直接運行
```
