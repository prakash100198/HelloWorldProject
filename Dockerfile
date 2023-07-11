FROM golang:latest as builder

WORKDIR /go/src/app
ADD . /go/src/app/
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .
CMD ["./main"]

