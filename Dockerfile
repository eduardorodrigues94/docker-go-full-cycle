FROM golang:1.19.2-alpine AS builder

WORKDIR /go/src/app

COPY ./app .
 
RUN go mod init

RUN go build -o /app/main

FROM scratch

WORKDIR /app

COPY --from=builder /app/main ./main

CMD ["./main"]
