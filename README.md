# README

## Pre-Installation

Notice: гайд был проверен на Ubuntu 18.04 и должен быть применим для всех deb-based дистрибутивов.

0. Clone repo

    ```shell
    git clone #TODO
    ```

1. Install node-exporter, set listening address to `127.0.0.1` and enable expose systemd metrics.
You can use bash-script `install-prometheus-node-exporter.sh` for automated install. Don't forget execute it from root user.

    ```shell
    chmod +x install-prometheus-node-exporter.sh
    ./install-prometheus-node-exporter.sh
    ```

2. Install docker and docker-compose if you didn't it before.

    ```shell
    curl -fsSL https://get.docker.com -o- | sh

    curl -fsSL https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose && \
    curl -fsSL https://raw.githubusercontent.com/docker/compose/1.25.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
    ```
