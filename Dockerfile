FROM golang:latest as builder

WORKDIR /go/src/app
ADD . /go/src/app/
RUN CGO_ENABLED=0 GOOS=linux go build -o main .
CMD ["./main"]