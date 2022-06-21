# This dockerfile builds a container that pulls down and runs the latest version of Benchmark
FROM ubuntu:latest
MAINTAINER "Dave Wichers dave.wichers@owasp.org"

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -q -y \
     openjdk-8-jre-headless \
     openjdk-8-jdk \
     git \
     maven \
     wget \
     curl \
     iputils-ping \
     net-tools lsof \
     && apt-get clean

RUN mkdir /owasp
WORKDIR /owasp
RUN git clone https://github.com/OWASP-Benchmark/BenchmarkJava && git clone https://github.com/OWASP-Benchmark/BenchmarkUtils.git && cd BenchmarkUtils && mvn install
WORKDIR /owasp/BenchmarkJava
COPY . .
RUN mvn clean package cargo:install

RUN useradd -d /home/bench -m -s /bin/bash bench
RUN echo bench:bench | chpasswd

RUN chown -R bench /owasp/
ENV PATH /owasp/BenchmarkJava:$PATH
CMD bash entrypoint.sh ${IASTIP} ${TOKEN} ${ProjectName}
