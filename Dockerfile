FROM alpine

ENV TERRAFORM_VERSION=1.0.7
ENV KUBECTL_VERSION=1.23.0

VOLUME [ "/data" ]

WORKDIR /data

RUN apk update && \
    apk add curl jq python3 py3-pip bash ca-certificates git openssl unzip wget netcat ansible && \
    pip3 install --upgrade pip && \
    pip3 install awscli && \
    cd /tmp && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*


# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# Install kubectl
RUN curl -LO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \ 
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    kubectl version --client

COPY ~/.ssh/* ~/.ssh/