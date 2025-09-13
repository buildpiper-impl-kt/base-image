RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        # Basic essentials
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
        # Networking + debugging
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
        # Build tools
        build-essential \
        make \
        cmake \
        pkg-config \
        g++ \
        autoconf \
        automake \
        libtool \
        # Python
        python3 \
        python3-pip \
        python3-dev \
        python3-venv \
        libffi-dev \
        libssl-dev \
        # Java
        default-jdk \
        ca-certificates-java \
        # Compression/archiving
        zip \
        bzip2 \
        gzip \
        p7zip-full \
        # Extra utilities
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
