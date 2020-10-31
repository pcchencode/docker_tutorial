# Use an official Python runtime as a parent image
FROM python:3.7.3-stretch

ENV TZ Asia/Taipei

#COPY requirements.txt .
COPY hellodocker.py .
COPY demo.sh .
#COPY download_ckip.py .

# Install any needed packages specified in requirements.txt
#RUN pip install -r /requirements.txt

# install vim editor
#RUN ["apt-get","update"]
#RUN ["apt-get","install","-y","vim"]
RUN ["mkdir", "data"] # 創建container的同時馬上創建一個data資料夾

#RUN ["python3","download_ckip.py"] # build的時候就會在容器內執行

#ENTRYPOINT [ "/bin/echo" ] # 容器一進入點後的執行程序, 一定會被執行!
ENTRYPOINT [ "/bin/bash" ]
#ENTRYPOINT [ "python3" ]
#ENTRYPOINT ["/bin/ping"]
#ENTRYPOINT ["/bin"]
#CMD ["python3","download_ckip.py"]
#CMD ["./hellodocker.py"]
#CMD ["python3","hellodocker.py"]
#CMD ["demo.sh"]
#CMD ["ping","localhost"] # 執行一個永遠不會停止的程式，才能讓container不會停止，就可以 exec 進到 container 裡面
CMD ["localhost"] # 由entrypoint帶下來要執行的參數