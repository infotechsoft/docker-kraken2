FROM ubuntu:20.04

ARG BUILD_DATE
ENV KRAKEN_VERSION=v2.0.9-beta \
    KRAKEN_DB_VERSION=v2_8GB_201904 \
    TOOLS_DIR=/usr/local/NGS

LABEL name="Kraken2 ${KRAKEN_VERSION}" \
	  maintainer="Thomas J. Taylor <thomas@infotechsoft.com>" \
	  build-date="${BUILD_DATE}"

# Dependencies
RUN apt-get update && \
    apt-get upgrade -y perl && \
    apt-get install -y git make sed wget g++ rsync locales && \
    locale-gen --purge en_US.UTF-8 && \
    DEBIAN_FRONTEND="noninteractive" dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
    
ENV KRAKEN_SRC=https://github.com/DerrickWood/kraken2/archive/${KRAKEN_VERSION}.tar.gz \
    KRAKEN_DB=ftp://ftp.ccb.jhu.edu/pub/data/kraken2_dbs/old/minikraken2_${KRAKEN_DB_VERSION}.tgz

# Kraken2
RUN mkdir -p $TOOLS_DIR && \
    cd $TOOLS_DIR && \
    wget -qO- $KRAKEN_SRC | tar xz && \
    cd kraken2-*/ && \
    mkdir bin && \
    ./install_kraken2.sh ./bin/

# minikraken2 DB
RUN mkdir /kraken2_db/ && \
    cd /kraken2_db/ && \
    wget -qO- $KRAKEN_DB | tar xz

ENV LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}" \
    PATH="$TOOLS_DIR/kraken-${KRAKEN_VERSION}/bin:${PATH}" \
    KRAKEN_DB_PATH="/kraken2_db:${KRAKEN_DB_PATH}"

# Clean
RUN apt-get remove -y git make locales && apt-get autoclean -y

VOLUME /data/
WORKDIR /data/