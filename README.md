# docker_test
### 使用方法與下載：
* Docker:
1. download and install Docker desktop  [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) or [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

2. clone this repo and cd into this as working directory

3. build image from `Dockerfile` and run `hellodocker.py` in container:
```
docker build -t {image_name} .
# 利用 dockerfile 建立 images
# -t: 指定 image 的 tag
# .: 引入當前目錄的 dockerfile

docekr run -it -d {image_name} sh 
# run container 但進入編程模式
# -i: attach時鍵盤輸入會被Container接手。互動模式
# -t: attach時Container的螢幕會接到原來的螢幕上。配置一個終端機
# -d: --detach 背景執行, 結束 shell 不會停止 container
# --rm: Automatically remove the container when it exits
# sh: 建立 shell

docker exec -it {container_id} sh
# 若 docker run -d, 則後續可以直接運行

```

### 基本指令
* 顯示 docker 的 images 清單
```
docker images
```

* 透過 image 執行產生一個新的 container
```
docker run {image名稱}
```
