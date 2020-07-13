#!/usr/bin/env bash
# Download kubectl cli
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /bin/kubectl

# Enable command completion
kubectl completion bash >kubectl.sh
sudo mv kubectl.sh /etc/bash_completion.d/

source ~/.bashrc
