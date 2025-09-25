FROM ubuntu:20.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl wget ca-certificates gnupg unzip tar xz-utils bash tzdata locales gettext \
        less vim nano lsof procps parallel software-properties-common passwd \
        net-tools iproute2 iputils-ping dnsutils traceroute telnet nmap socat tcpdump openssh-client rsync \
        build-essential make cmake pkg-config g++ autoconf automake libtool \
        python3 python3-pip python3-dev python3-venv libffi-dev libssl-dev awscli \
        default-jdk ca-certificates-java \
        zip bzip2 gzip p7zip-full \
        jq git htop tree file man-db \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && locale-gen en_US.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN wget https://get.helm.sh/helm-v3.15.0-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.15.0-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64 helm-v3.15.0-linux-amd64.tar.gz


RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    rm get-docker.sh


RUN DOCKER_COMPOSE_VERSION=v2.20.2 && \
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose


RUN TERRAFORM_VERSION=1.6.0 && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata


COPY --from=builder / /


RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    locale-gen en_US.UTF-8


RUN helm version && \
    docker --version && \
    docker-compose --version && \
    terraform -version
