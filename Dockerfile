# pull official base image
FROM python:3.11-alpine

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies and required libraries
RUN apk update && \
    apk add git gcc python3-dev musl-dev jpeg-dev zlib-dev freetype-dev

# upgrade pip
RUN pip install --upgrade pip

# copy requirements and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy the application code
COPY . .

# expose the port Hugging Face Spaces expects
EXPOSE 7860

# run migrations and start the server
CMD ["sh", "-c", "python manage.py migrate && python seeder.py &&python manage.py runserver 0.0.0.0:7860"]
