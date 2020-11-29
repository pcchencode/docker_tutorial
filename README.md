# docker_tutorial
### 安裝 Docker (擇一)
* Docker desktop [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) or [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)

* [brew install](https://blog.yowko.com/homebrew-docker/)


### 流程
1. 描述 images 所需要建置的環境
    * 法二：撰寫 Dockerfile
    * 法二：直接在 docker hub 上 pull images
  
2. 開始建置 images
    * `$ docker build . -t {image_name}`
        - `-t`：設定你的鏡像名稱
        - `.`：表示在當前目錄尋找 Dockerfile

    * `$ docker build -t {image_name} . --no-cache`
        - 使用 `--no-cache` 的主要原因在於，避免 docker build image 時被 cache 住，造成沒有 build 到修改過的 Dockerfile（所以除非有修改過，要不然不要加 --no-cache，要不然每次都會重新 build 一次可能會跑很久）
       
3. 利用建好的 images 執行 container
    * `$ docker run`



### 基本指令
* 顯示 images 清單
    ```
    $ docker images
    ```
* 移除 image
    ```
    $ docker rmi {image_name}
    ```
* 移除所有 images
    ```
    $ docker rmi $(docker images ps -a -q)
    ```


* 顯示 containers 清單
    ```
    $ docker ps # 顯示正在運行中的 container
    $ docker ps -a # 顯示所有 container(包含已停止的)
    ```

* 建置 run container
    ```
    $ docekr run -it -d {image_name} sh 
        run container 但進入編程模式
        -i: attach時鍵盤輸入會被Container接手。互動模式
        -t: attach時Container的螢幕會接到原來的螢幕上。配置一個終端機
        -d: --detach 背景執行, 結束 shell 不會停止 container
        --rm: Automatically remove the container when it exits
        sh: 建立 shell

    $ docker exec -it {container_id} sh
        若 docker run -d, 則後續可以直接運行
    ```

* 手動對 container 執行一個不停止的服務並將其丟入背景執行
    ```
    $ docker run -d {image_name} ping localhost

    $ docker run -d --name my_container test_image
        -d: -- detach 在背景執行
        —name: 幫自己的container取名字
    ```
* container 背景服務、自動重新啟動
    ```
    $ docker run --restart=always -d -it ubuntu
    ```

* 後續就可以進入container進行編程
    ```
    $ docker exec -it {container_name} bash/sh
    ```

* 使用volume連結容器與本地端的資料夾
    ```
    $ docker run -it -v {本地端資料夾路徑}:{容器資料夾路徑} {image_name} sh
    ```

* 命名container
    ```
    $ docker run --name {NAME} -d {image_name} ping localhost
    ```

* 停止 container
    ```
    $ docker stop {containerID or containerNAME}
    ```

* 列出所有 container
    ```
    $ docker ps
    $ docker ps -a => 列出包括已停止的 container
    ```

* 停止 container
    ```
    $ docker rm {container_name}
    ```

* 移除所有 container
    ```
    $ docker rm $(docker ps -a -q)
    $ docker rm -f $(docker ps -a- q) => 強制停止
    ```


