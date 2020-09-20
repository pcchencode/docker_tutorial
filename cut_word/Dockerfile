# Use an official Python runtime as a parent image
FROM python:3.7.3-stretch

ENV TZ Asia/Taipei

COPY requirements.txt .
COPY download_ckip.py .
COPY corpus.csv .
COPY cut_word.py .

# Install any needed packages specified in requirements.txt
RUN pip install -r /requirements.txt

# download ckip package
RUN ["python3","download_ckip.py"] # build的時候就會在容器內執行


CMD ["python3","cut_word.py"]

