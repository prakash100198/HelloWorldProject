FROM golang:latest as builder

COPY . ./
RUN GOOS=linux go build -o main .
CMD ["./main"]