FROM alpine

RUN mkdir /app
WORKDIR /app
COPY . /app/

ENTRYPOINT [ "init.sh" ]
