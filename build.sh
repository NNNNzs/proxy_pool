#!/bin/bash

echo "Building Docker image..."
docker build -t nnnnzs/proxy_pool:latest .
build_status=$?

if [ $build_status -ne 0 ]; then
  echo "Docker build failed with status $build_status"
  exit $build_status
fi

echo "Pushing Docker image..."
docker push nnnnzs/proxy_pool:latest --force
push_status=$?

if [ $push_status -ne 0 ]; then
  echo "Docker push failed with status $push_status"
  exit $push_status
fi

echo "Docker image pushed successfully."
