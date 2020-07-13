#!/usr/bin/env bash
# Download kind cli
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64
chmod +x ./kind
sudo mv ./kind /bin/kind

# Enable command completion
kind completion bash >kind.sh
sudo mv kind.sh /etc/bash_completion.d/

source ~/.bashrc
