FROM python:3.7-alpine
LABEL maintainer="DK Corp"

ENV PYTHONUNBUFFERED 1

COPY ./Pipfile /Pipfile
RUN pip install -r /requirements

RUN mkdir /leadmanager
WORKDIR /leadmanager
COPY ./leadmanager /leadmanager

RUN adduser -D beno
USER beno