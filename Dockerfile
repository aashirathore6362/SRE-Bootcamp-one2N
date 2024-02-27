FROM python:alpine
WORKDIR /rest-api
COPY requirements.txt makefile student.py /rest-api/ 
RUN apk update && apk add make
EXPOSE 5000
ENV FLASK_APP=student.py
CMD make run