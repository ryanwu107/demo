FROM golang:1.25-alpine AS builder

WORKDIR /
COPY . .

RUN go build -o app ./


FROM alpine:latest
WORKDIR /
COPY --from=builder /app .

CMD ["./app"]

