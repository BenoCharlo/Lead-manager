FROM python:3.7-alpine
LABEL maintainer="DK Corp"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk update && apk add gcc libc-dev make libffi-dev \
    openssl-dev libxml2-dev libxslt-dev
RUN pip install -r /requirements.txt

RUN mkdir /leadmanager
WORKDIR /leadmanager
COPY ./leadmanager /leadmanager

RUN adduser -D beno
USER beno