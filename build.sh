#!/usr/bin/env bash
docker build -t rs-dev-registry.sachdev.intern:5000/check24/alpine-scipy .
docker push rs-dev-registry.sachdev.intern:5000/check24/alpine-scipy
