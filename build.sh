#!/usr/bin/env bash

mvn -B package
cp minikube-pvc/src/main/docker/Dockerfile minikube-pvc/target/
docker login ghcr.io -u $GITHUB_ACTOR -p $GITHUB_TOKEN
docker build --tag ghcr.io/armin1503/minikube-pvc/backend:latest ./target
docker push ghcr.io/armin1503/minikube-pvc/backend:latest
