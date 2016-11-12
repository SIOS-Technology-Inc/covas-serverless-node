FROM node:5.11.1
# Debian OS.

RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends \
      ack-grep \
      bash \
      build-essential \
      cpio \
      cron \
      curl \
      git \
      g++ \
      htop \
      jq \
      rsync \
      supervisor \
      tree \
      vim \
      wget \
      zip && \
    npm config set registry http://registry.npmjs.org/ && \
    npm install --silent -g yarn && \
    echo "Install Spy filewatcher" && \
    cd /tmp && \
    wget -q https://github.com/jpillora/spy/releases/download/1.0.1/spy_1.0.1_linux_amd64.tar.gz && \
    tar xzf spy_1.0.1_linux_amd64.tar.gz && \
    mv spy_1.0.1_linux_amd64/spy /usr/bin && \
    rm -Rf spy_1.0.1_linux_amd64* && \
    echo "Init supervisor" && \
    mkdir -p /etc/supervisor && \
    mkdir -p /var/log/supervisor
