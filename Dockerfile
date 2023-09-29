FROM golang:1.21-alpine AS builder

WORKDIR /go/src
COPY go.mod ./
COPY go.sum ./

RUN --mount=type=cache,target=/root/.cache \
    --mount=type=cache,target=/go/pkg/mod \
     go mod download

COPY . ./
RUN go build -o hello main.go

FROM alpine:3
COPY --from=builder /go/src/hello /hello
ENTRYPOINT ["/hello"]
