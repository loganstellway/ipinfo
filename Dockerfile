#########
# BUILD #
#########
ARG GO_VERSION="1.15.7"
ARG ALPINE_VERSION="3.13.1"
FROM golang:${GO_VERSION}-alpine as build

ENV API_PORT=8080
WORKDIR /go/src/app
COPY ./src/* .
RUN go build -o app main.go

#######
# RUN #
#######
FROM alpine:${ALPINE_VERSION}

COPY --from=build /go/src/app/app /app
RUN adduser -u 1000 -H -D app \
    && chown 1000:1000 /app

ENTRYPOINT ["./app"]
