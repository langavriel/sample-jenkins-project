FROM alpine:latest

COPY app.py /opt

ENTYPOINT python /opt/app.py
