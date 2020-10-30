FROM alpine

RUN mkdir /app
WORKDIR /app
COPY . /app/

ENTRYPOINT [ "/bin/sh","init.sh" ]
