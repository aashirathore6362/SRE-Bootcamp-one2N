FROM python:alpine
WORKDIR /app
COPY requirements.txt makefile appdb.py /app/ 
RUN apk update && apk add make
EXPOSE 4000
ENV FLASK_APP=student.py
CMD make migrate