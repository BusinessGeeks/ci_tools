FROM alpine

RUN mkdir /app
WORKDIR /app
COPY . /app/

CMD [ "init.sh" ]
