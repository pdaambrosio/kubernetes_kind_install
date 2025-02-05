#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

# Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/
echo "source <(kind completion zsh)" >> ~/.zshrc
echo "kind installed"

# Install kubectl
curl -Lo https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/
echo "kubectl installed"

# Create kind cluster
kind create cluster --config kind-config.yaml
echo "kind cluster created"

# Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
echo "helm installed"

# Install kubectx
git clone https://github.com/ahmetb/kubectx /opt/kubectx
ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
ln -s /opt/kubectx/kubens /usr/local/bin/kubens
mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 /opt/kubectx/completion
ln -s /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -s /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh
echo "kubectx installed"

# Install k9s
curl -sS https://webinstall.dev/k9s | bash
echo "k9s installed"

# Install kubetail
curl -sS https://webinstall.dev/kubetail | bash
echo "kubetail installed"
