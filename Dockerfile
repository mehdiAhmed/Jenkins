ARG UBUNTU_VERSION=20.04
ARG SERVERLESS_VERSION=2.34.0
FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get -y update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata git unzip software-properties-common apt-transport-https ca-certificates curl wget \
    gnupg lsb-release gcc make build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev libbz2-dev && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get -y install nodejs && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install python
ENV PY_VERSION=3.8.6
RUN cd /opt \
    && wget https://www.python.org/ftp/python/${PY_VERSION}/Python-${PY_VERSION}.tgz \
    && tar xzf Python-${PY_VERSION}.tgz \
    && cd Python-${PY_VERSION} \
    && ./configure --enable-optimizations --enable-loadable-sqlite-extensions \
    && make altinstall \
    && ln -sf /usr/local/bin/python3.8 /usr/bin/python3 \
    && ln -sf /usr/local/bin/python3.8 /usr/bin/python \
    && ln -sf /usr/share/pyshared/lsb_release.py /usr/local/lib/python3.8/site-packages/lsb_release.py

RUN apt install --yes python3-pip python-pytest

# Install serverless and Yarn
RUN npm install -g serverless@${SERVERLESS_VERSION} yarn && \
yarn set version 1.22.1

# Install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
unzip /tmp/awscliv2.zip -d /tmp && /tmp/aws/install

# User management
ARG USERNAME=jenkins
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # Add user to docker group
    && groupadd docker \
    && usermod -aG docker $USERNAME

RUN DEBIAN_FRONTEND=noninteractive apt update && \
    apt-get install -y docker-ce && \
    apt-get install -y docker-ce-cli && \
    apt-get install -y containerd.io && \
    rm -rf /var/lib/apt/lists/*

USER jenkins
