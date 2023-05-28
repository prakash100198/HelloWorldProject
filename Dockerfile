################################# Build Container ###############################

FROM golang:1.19-alpine as builder

# Setup the working directory
WORKDIR /app

# Add source code
ADD . /app/

#Expose port
EXPOSE 3000

# Build the source
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main app.go


################################# Prod Container #################################

# Use a minimal alpine image
FROM alpine:3.7
# Add ca-certificates in case you need them
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
# Set working directory
WORKDIR /root
# Copy the binary from builder
COPY --from=builder /app/. .

# Run the binary
CMD ["./main"]