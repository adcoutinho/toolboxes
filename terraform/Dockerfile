FROM alpine

ENV TERRAFORM_VERSION=1.0.7

VOLUME [ "/data" ]

WORKDIR /data

RUN apk update && \
    apk add curl jq python3 py3-pip bash ca-certificates git openssl unzip wget && \
    pip3 install --upgrade pip && \
    pip3 install awscli && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
