FROM python:alpine
WORKDIR /Rest-api
COPY requirements.txt makefile student.py /Rest-api/ 
RUN apk update && apk add make
EXPOSE 4000
ENV FLASK_APP=student.py HOSTPORT=0.0.0.0 APP_PORT=4000
CMD make run