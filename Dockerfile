FROM golang:1.22.0-alpine AS build

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY cmd ./cmd
COPY lib ./lib
COPY templates ./templates
COPY main.go ./

RUN go build -o build/fizzbuzz

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY templates ./templates

COPY --from=build /app/build/fizzbuzz /fizzbuzz

CMD ["/fizzbuzz", "serve"]