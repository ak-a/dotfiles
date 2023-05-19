#!/bin/bash

command -v kubectl &> /dev/null || {
    cat <<<ERROR
$0: kubectl not install, probably you want to do
sudo snap install kubectl --classic

Once done, come back here and run $0 again
ERROR
}
# install krew
(   set -x; cd "$(mktemp -d)" &&   OS="$(uname | tr '[:upper:]' '[:lower:]')" &&   ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&   KREW="krew-${OS}_${ARCH}" &&   curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&   tar zxvf "${KREW}.tar.gz" &&   ./"${KREW}" install krew; )
# setup krew
source <(echo 'AppendPath ~/.krew/bin' | tee -a ~/.bashrc)
# install neat
kubectl krew install neat
