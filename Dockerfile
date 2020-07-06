# Use an official Python runtime as a parent image
FROM python:3.7.3-stretch

ENV TZ Asia/Taipei

COPY requirements.txt .
COPY hellodocker.py .

# Install any needed packages specified in requirements.txt
RUN pip install -r /requirements.txt

# CMD ["python3","hellodocker.py"]
