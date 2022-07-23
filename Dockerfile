# Use Python runtime (from parent Python image):
FROM python:3.7-alpine
 
# Set working directory:
WORKDIR /app
 
# Copy current directory contents into the container at WORKDIR:
ADD ./src /app
 
# Set HTTP(S) proxy server:
ENV http_proxy http://host.docker.internal:3128
ENV https_proxy http://host.docker.internal:3128
 
# Install any needed packages specified in requirements.txt:
RUN pip install -r requirements.txt
RUN python3 test.py
