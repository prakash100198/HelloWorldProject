FROM golang:latest as builder

WORKDIR /go/src/app
ADD . /go/src/app/
RUN GOOS=linux go build -o main .
CMD ["./main"]