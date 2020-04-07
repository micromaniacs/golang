#!/bin/sh

notify()
{
  MESSAGE=$1

  echo
  echo "************************************************"
  echo "* ${MESSAGE}"
  echo "************************************************"
  echo
}

build()
{
  DIR=$1
  TAG=$2

  notify "Building micromaniacs/golang:${TAG}"
  docker build --compress -t micromaniacs/golang:"${TAG}" -f "${DIR}"Dockerfile .
}

push()
{
  TAG=$1

  notify "Pushing micromaniacs/golang:${TAG}"
  docker push micromaniacs/golang:"${TAG}"
}

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

latestDir=""
for dir in */; do
  latestDir=${dir}
  tag=${dir%*/}

  build "${dir}" "${tag}"
  push "${tag}"
done

build "${latestDir}" "latest"
push "latest"
