FROM golang:1.17-alpine AS builder

WORKDIR /app

COPY .  /app

RUN go build -o fizzbuzz .


CMD ["/app/fizzbuzz", "serve"]
