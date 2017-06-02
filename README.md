# Alpine based Dockerimage for Python with SciPy-stack

This repository contains a Dockerfile for building a python ready image
that is running based on Alpine 3.4 and Python 3.6

It provides the following python libaries

- pynum (1.11.0)
- pandas (0.18.0)
- scipy (0.18.0)
- scikit-learn (0.17.1)

To build the image execute the following command in the repository root directory:

```
docker build .
```

This will be made available on Docker hub as cathalgarvey/alpine-python3-scipy for use as a base in other images.
