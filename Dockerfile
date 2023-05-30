FROM golang:latest as builder

RUN mkdir /app
ADD . ./app
WORKDIR /app
COPY . ./
RUN go build -o main .
CMD ["./main"]