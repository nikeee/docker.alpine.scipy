# Alpine based Dockerimage for Python with SciPy-stack

This repository contains a Dockerfile for building a python ready image
that is running based on Alpine 3.4 and Python 3.6

It provides the following python libaries:
- numpy (numpy==1.13.1)
- pandas (pandas==0.20.3)
- scipy (scipy==0.19.1)
- scikit-learn (scikit-learn[alldeps]==0.18.2)
To build the image execute the following command in the repository root directory:

```
docker build .
```

This will be made available on Docker hub as nikeee/alpine-python3-scipy for use as a base in other images.
