FROM ubuntu:10.04

RUN apt-get update

RUN apt-get install -y  -y --force-yes \
    curl \
    zlib1g-dev \
    ssh \
    openssl \
    perl \
    libcurl4-gnutls-dev \
    expat \
    tk8.5 \
    gettext \
    python \
    #

RUN mkdir -p /tmp/git/src /tmp/git/static
RUN curl https://www.kernel.org/pub/software/scm/git/git-2.1.0.tar.gz | tar xzv -C /tmp/git/src

WORKDIR /tmp/git/src/git-2.1.0
RUN ./configure --prefix=/tmp/git/static/git-2.1.0 CFLAGS="${CFLAGS} -static"
RUN make
RUN make install

RUN tar czvf /tmp/git/static/git-static-2.1.0-ubuntu-10.04.tar.gz -C /tmp/git/static/git-2.1.0 .
