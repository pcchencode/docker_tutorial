# docker_test
### 使用方法：
* Docker:
1. download and install Docker desktop  [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) or [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

2. clone this repo and cd into this as working directory

3. build image from `Dockerfile` and run `hellodocker.py` in container:
```
docker build -t my_image .
docker run --mount type=bind,source={/YOUR/PATH/OF/LOCAL/WORKING/DIRECTORY},target={/work_dir} my_image python3 {/work_dir}/hellodocker.py 

docker run --mount type=bind,source=/Users/user/Desktop/docker_test,target=/Users/user/Desktop/docker_test my_image python3 /Users/user/Desktop/docker_test/hellodocker.py
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
