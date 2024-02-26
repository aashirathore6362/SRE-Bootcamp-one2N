FROM python:alpine
WORKDIR /Rest-api
COPY requirements.txt makefile student.py /Rest-api/ 
RUN apk update && apk add make
EXPOSE 4000
ENV FLASK_APP=student.py
CMD make run