#Build the base image ->Stage 1
FROM python:alpine as baseimage
RUN mkdir /app
COPY requirements.txt /app/
WORKDIR /app
RUN pip install --user -r requirements.txt

#App run ->Stage2
FROM python:alpine
COPY --from=baseimage /root/.local /root/.local
COPY student.py /app/
WORKDIR /app
ENV FLASK_APP=student.py
ENV PATH=/root/.local/bin:$PATH
CMD flask run