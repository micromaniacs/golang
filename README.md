# Docker image for golang development with useful tools
Based on Linux Alpine

[![Build Status](https://travis-ci.com/micromaniacs/golang.svg?branch=master)](https://travis-ci.com/micromaniacs/golang)
[![Docker Image Size](https://img.shields.io/docker/image-size/micromaniacs/golang)](https://hub.docker.com/r/micromaniacs/golang)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/micromaniacs/golang)](https://hub.docker.com/r/micromaniacs/golang)
[![Docker Pulls](https://img.shields.io/docker/pulls/micromaniacs/golang)](https://hub.docker.com/r/micromaniacs/golang)
[![Docker Stars](https://img.shields.io/docker/stars/micromaniacs/golang)](https://hub.docker.com/r/micromaniacs/golang)

## Includes
| Tool                                                          | Description                                                                                                                                   |
|---------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| [ginkgo](https://github.com/onsi/ginkgo)                      | BDD testing framework                                                                                                                         |
| [golangci](https://github.com/golangci/golangci-lint)         | Golang linter                                                                                                                                 |
| [protobuf](https://github.com/protocolbuffers/protobuf)       | Protocol buffers                                                                                                                              |
| protobuf-dev                                                  | Includes [well known types](https://developers.google.com/protocol-buffers/docs/reference/google.protobuf) (see /usr/include/google/protobuf) |
| [protoc-gen-go](https://github.com/golang/protobuf)           | Protobuf code generation for go                                                                                                               |
| [protoc-gen-micro](https://github.com/micro/protoc-gen-micro) | Protobuf code generation for micro                                                                                                            |
| [protoc-gen-swagger](github.com/grpc-ecosystem/grpc-gateway)  | Generate swagger from .proto files                                                                                                            |
| [micro](https://github.com/micro/micro)                       | A Micro services runtime environment                                                                                                          |
| Git                                                           | In Linus we trust!                                                                                                                            |
| Make                                                          | GNU Make                                                                                                                                      |
| [upx](https://upx.github.io/)                                 | The Ultimate Packer for eXecutables                                                                                                           |

## Example usage
Using `docker-compose`:
```yaml
version: '3.7'

services:
  app:
    image: micromaniacs/golang:latest
    restart: unless-stopped
    volumes:
      - .:/go/src/path/to/source
    working_dir: /go/src/path/to/source
    command: tail -f /dev/null
    networks:
      - internal

networks:
  internal:
    external: false
```

...or:
```
$ docker run --rm -i -t -v `pwd`:`pwd` -w `pwd` micromaniacs/golang sh
```

## License

```
MIT License

Copyright (c) 2020 Alexey Popov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
