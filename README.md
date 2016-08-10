# Alpine based Dockerimage for Python with SciPy-stack

This repository contains a Dockerfile for building a python ready image
that is running based on Alpine 3.4 and Python 2.7

It provides the following python libaries

- pynum (1.11.0)
- pandas (0.18.0)
- scipy (0.18.0)
- scikit-learn (0.17.1)

To build the image execute the following command

```
docker build -t rs-dev-registry.sachdev.intern:5000/check24/alpine-scipy .
```

To push the latest build to the rs-docker-registry you've to enter the
following command:

```
docker push rs-dev-registry.sachdev.intern:5000/check24/alpine-scipy
```

