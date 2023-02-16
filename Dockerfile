# syntax=docker/dockerfile:1
FROM python:3.10-slim-buster
LABEL maintainer="Shayan Gxhani <shayanghani1384@gmail.com>"
ENV MACHIMETRIC_API_ENV=production MACHIMETRIC_API_DEBUG=0 TESTING=0
EXPOSE 8080 8080
WORKDIR /
COPY ./requirements.txt /requirements.txt 
RUN pip --default-timeout=100 install -r requirements.txt
COPY . /
RUN apt update && apt-get install -y curl
CMD [ "./start" ]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl --fail http://localhost:8080/ || exit 1





