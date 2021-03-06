FROM golang:1.14.1-alpine3.11 AS build

ENV XDG_CACHE_HOME=/tmp/go-build \
    GO111MODULE=on

# First we need to build all development tools
RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        curl \
        git \
        upx \
    # BDD testing framework
    && go get -u github.com/onsi/ginkgo/ginkgo@v1.12.0 \
    # Golang linter
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.25.1 \
    # Protobuf code generation for go
    && go get -u github.com/golang/protobuf/protoc-gen-go@v1.4.0 \
    # Protobuf code generation for micro
    && go get -u github.com/micro/protoc-gen-micro/v2@v2.3.0 \
    # Generate swagger from proto
    && go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger@v1.14.4 \
    # A Micro services runtime environment
    && export MICRO=micro-v2.5.0-linux-amd64.tar.gz \
    && cd /tmp \
    && wget https://github.com/micro/micro/releases/download/v2.5.0/$MICRO \
    && tar zxvpf $MICRO \
    && mv ./micro /go/bin/micro \
    && upx -9 \
        /go/bin/ginkgo \
        /go/bin/golangci-lint \
        /go/bin/protoc-gen-go \
        /go/bin/protoc-gen-micro \
        /go/bin/protoc-gen-swagger

# And finally build our image
FROM golang:1.14.1-alpine3.11

ENV CGO_ENABLED=0 \
    XDG_CACHE_HOME=/tmp/go-build \
    GO111MODULE=on

COPY --from=build \
    /go/bin/ginkgo \
    /go/bin/golangci-lint \
    /go/bin/protoc-gen-go \
    /go/bin/protoc-gen-micro \
    /go/bin/protoc-gen-swagger \
    /go/bin/micro \
    /bin/

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
      build-base \
      gcc \
      git \
      make \
      protobuf \
      protobuf-dev \
      upx
