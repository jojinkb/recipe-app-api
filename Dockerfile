FROM python:3.7-alpine
LABEL  maintainer="jojin.kb@gmail.com"

ENV PYTHONUNBEFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

#Create application user.
RUN adduser -D user

#This way, even if the application is compromised, attacker won't have root permissions on container.
USER user
