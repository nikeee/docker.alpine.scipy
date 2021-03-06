FROM alpine:3.8

RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime
RUN echo "http://nl.alpinelinux.org/alpine/v3.8/main" > /etc/apk/repositories

COPY libs/* /tmp/

RUN apk update &&\
    apk add python3 \
            python3-dev \
            ca-certificates \
            openntpd \
            build-base \
            musl-dev \
            gfortran \
            libgfortran

RUN python3 /tmp/get-pip.py

# Build BLAS and LAPACK
RUN source /tmp/blas.sh
RUN source /tmp/lapack.sh

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

# Install numpy, pandas, scipy and scikit
RUN BLAS=~/src/BLAS/libfblas.a LAPACK=~/src/lapack-3.5.0/liblapack.a pip3.6 install -v numpy==1.15.1
RUN BLAS=~/src/BLAS/libfblas.a LAPACK=~/src/lapack-3.5.0/liblapack.a pip3.6 install -v pandas==0.23.4
RUN BLAS=~/src/BLAS/libfblas.a LAPACK=~/src/lapack-3.5.0/liblapack.a pip3.6 install -v scipy==1.1.0
RUN BLAS=~/src/BLAS/libfblas.a LAPACK=~/src/lapack-3.5.0/liblapack.a pip3.6 install -v scikit-learn[alldeps]==0.19.2

# Clean up
RUN mv ~/src/BLAS/libfblas.a /tmp/
RUN mv ~/src/lapack-3.5.0/liblapack.a /tmp/
RUN rm -rf ~/src
RUN rm -rf ~/.cache/pip
RUN mkdir -p ~/src/BLAS ~/src/lapack-3.5.0
RUN mv /tmp/libfblas.a ~/src/BLAS/libfblas.a
RUN mv /tmp/liblapack.a ~/src/lapack-3.5.0/liblapack.a
RUN rm -rf /tmp/*

# Remove all the extra build stuff
RUN apk del build-base "*-dev"
