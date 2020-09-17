# Use an official Python runtime as a parent image
FROM python:3.4-alpine

ENV TZ Asia/Taipei

COPY requirements.txt .
COPY app.py .

# Install any needed packages specified in requirements.txt
RUN pip install -r /requirements.txt

# install vim editor
RUN ["apt-get","update"]
RUN ["apt-get","install","-y","vim"]

#RUN ["python3","download_ckip.py"]

#ENTRYPOINT [ "/bin/sh" ]
#CMD ["python3","download_ckip.py"]

#CMD ["python3","app.py"]