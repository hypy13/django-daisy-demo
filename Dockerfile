# pull official base image
FROM python:3.11-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add git  gcc python3-dev musl-dev jpeg-dev zlib-dev freetype-dev

# install dependencies
RUN pip install --upgrade pip
#RUN python -m pip install Pillow

COPY ./requirements.txt .

RUN --mount=type=cache,target=/root/.cache  pip install -r requirements.txt

# copy project
COPY . .
