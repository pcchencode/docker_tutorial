# Use an official Python runtime as a parent image
FROM python:3.7.3-stretch

ENV TZ Asia/Taipei

COPY requirements.txt .
COPY test.py .



# Install any needed packages specified in requirements.txt
RUN pip install -r /requirements.txt

# install vim editor
RUN ["mkdir", "data"] # 創建container的同時馬上創建一個data資料夾

# 使用 volumn 做連結
VOLUME v"/data"


CMD ["python3","test.py"] # 執行一個永遠不會停止的程式，才能讓container不會停止，就可以 exec 進到 