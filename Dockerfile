FROM python:2-onbuild
ENV PYTHONUNBUFFERED 1

EXPOSE 8080

RUN mkdir -p /usr/src/app 
VOLUME /usr/src/app/codingTest/db.sqlite3:codingTest/db.sqlite3
VOLUME /usr/src/app/codingTest/reportMaker/db.sqlite3:codingTest/reportMaker/db.sqlite3
COPY . /usr/src/app
WORKDIR /usr/src/app


RUN apt-get update

RUN pip install -r requirements.txt

CMD python codingTest/manage.py runserver 0.0.0.0:8080


