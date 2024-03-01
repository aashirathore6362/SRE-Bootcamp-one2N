FROM python:alpine
WORKDIR /app
COPY requirements.txt makefile student.py /app/ 
RUN apk update && apk add make
EXPOSE 4000
ENV FLASK_APP=student.py
CMD make run