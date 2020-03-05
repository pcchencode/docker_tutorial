FROM python:3.7.3-stretch

ENV TZ Asia/Taipei



COPY ./requirements.txt /requirements.txt
COPY ./hellodocker.py /hellodocker.py
RUN pip install -r /requirements.txt

CMD ["python3","hellodocker.py"]
