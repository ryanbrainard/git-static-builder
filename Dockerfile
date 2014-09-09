FROM ubuntu:10.04

RUN apt-get update

RUN apt-get install -y curl
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y ssh
RUN apt-get install -y openssl
RUN apt-get install -y perl
RUN apt-get install -y libcurl4-gnutls-dev
RUN apt-get install -y expat
RUN apt-get install -y tk8.5
RUN apt-get install -y gettext
RUN apt-get install -y python

RUN mkdir -p /app/git-static-src /app/git-static
RUN curl https://www.kernel.org/pub/software/scm/git/git-2.1.0.tar.gz | tar xzv -C /app/git-static-src

WORKDIR /app/git-static-src/git-2.1.0
RUN ./configure --prefix=/app/git-static CFLAGS="${CFLAGS} -static"
RUN make
RUN make install
