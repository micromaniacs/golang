FROM golang:1.14.0-alpine3.11 AS build

ENV XDG_CACHE_HOME /tmp/go-build
ENV GO111MODULE on

# First we need to build all development tools
RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        git \
        curl \
    # BDD testing framework
    && go get -u github.com/onsi/ginkgo/ginkgo@v1.11.0 \
    # Golang linter
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.23.7 \
    # Protobuf code generation for go
    && go get -u github.com/golang/protobuf/protoc-gen-go@v1.3.5 \
    # Protobuf code generation for micro
    && go get -u github.com/micro/protoc-gen-micro/v2@v2.0.0 \
    # A Micro services runtime environment
    && export MICRO=micro-v2.2.0-linux-amd64.tar.gz \
    && cd /tmp \
    && wget https://github.com/micro/micro/releases/download/v2.2.0/$MICRO \
    && tar zxvpf $MICRO \
    && mv ./micro /go/bin/micro

# And finally build our image
FROM golang:1.14.0-alpine3.11

ENV CGO_ENABLED 0
ENV XDG_CACHE_HOME /tmp/go-build
ENV GO111MODULE on

COPY --from=build /go/bin/ginkgo /bin/ginkgo
COPY --from=build /go/bin/golangci-lint /bin/golangci-lint
COPY --from=build /go/bin/protoc-gen-go /bin/protoc-gen-go
COPY --from=build /go/bin/protoc-gen-micro /bin/protoc-gen-micro
COPY --from=build /go/bin/micro /bin/micro

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
      protobuf \
      git \
      make
