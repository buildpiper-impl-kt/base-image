FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
ENV AIRGAP_ENV=true


RUN apt-get update && \
    apt-get install -y --no-install-recommends \

        curl \
        wget \
        ca-certificates \
        gnupg \
        unzip \
        tar \
        xz-utils \
        bash \
        tzdata \
        sudo \
        locales \
        gettext \
        less \
        vim \
        nano \
        lsof \
        procps \
        parallel \
        software-properties-common \
        passwd \
  
        net-tools \
        iproute2 \
        iputils-ping \
        dnsutils \
        traceroute \
        telnet \
        nmap \
        socat \
        tcpdump \
        openssh-client \
        rsync \

        build-essential \
        make \
        cmake \
        pkg-config \
        g++ \
        autoconf \
        automake \
        libtool \

        python3 \
        python3-pip \
        python3-dev \
        python3-venv \
        libffi-dev \
        libssl-dev \
        awscli \

        default-jdk \
        ca-certificates-java \

        zip \
        bzip2 \
        gzip \
        p7zip-full \

        jq \
        git \
        htop \
        tree \
        file \
        man-db && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    locale-gen en_US.UTF-8 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV SLEEP_DURATION=5s


