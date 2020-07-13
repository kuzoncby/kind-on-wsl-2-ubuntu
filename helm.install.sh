#!/usr/bin/env bash
curl https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz | tar xvz -C /tmp/ --exclude="*.cmd" --exclude="docs"
sudo mv /tmp/linux-amd64/helm /bin/helm

helm completion bash >~/helm.sh
sudo mv ~/helm.sh /etc/bash_completion.d/

source ~/.bashrc
