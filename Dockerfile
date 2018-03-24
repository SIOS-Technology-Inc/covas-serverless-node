FROM node:8.10.0
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
      wget \
      zip && \
    npm config set registry http://registry.npmjs.org/ && \
    npm install --silent -g yarn && \
    chmod 0755 /usr/local/lib/node_modules/yarn/bin/yarn.js && \
    echo "Install Spy filewatcher" && \
    cd /tmp && \
    wget -q https://github.com/jpillora/spy/releases/download/1.0.1/spy_linux_amd64.gz && \
    gunzip spy_linux_amd64.gz && \
    chmod 0755 spy_linux_amd64 && \
    mv spy_linux_amd64 /usr/bin/spy && \
    echo "Init supervisor" && \
    mkdir -p /etc/supervisor && \
    mkdir -p /var/log/supervisor
