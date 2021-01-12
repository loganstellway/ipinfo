ARG GO_VERSION="1.15.6"
FROM golang:${GO_VERSION}-alpine

ENV API_PORT=8080
WORKDIR /go/src/app
COPY ./src/* .
RUN go build -o app main.go

CMD ["./app"]
