# docker_tutorial
### 安裝 Docker (擇一)
* Docker desktop [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) or [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

* [brew insatll](https://blog.yowko.com/homebrew-docker/)


### 流程
1. 描述 images 所需要建置的環境
    * 法二：撰寫 Dockerfile
    * 法二：直接在 docker hub 上 pull images
  
2. 開始建置 images
    * `$ docker build . -t {image_name}`
        - `-t`：設定你的鏡像名稱
        - `.`：表示在當前目錄尋找 Dockerfile
       
3. 利用建好的 images 執行 container
    * `$ docker run`



### 基本指令
* 顯示 images 清單
    ```
    $ docker images
    ```

* 顯示 containers 清單
    ```
    $ docker ps # 顯示正在運行中的 container
    $ docker ps -a # 顯示所有 container(包含已停止的)
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

* 使用volume連結容器與本地端的資料夾
```
$ docker run -it -v {本地端資料夾路徑}:{容器資料夾路徑} {image_name} sh
```


