#!/bin/bash

. <(curl -s https://raw.githubusercontent.com/nodejumper-org/cosmos-utils/main/logo/logo.sh)

while getopts v: flag; do
  case "${flag}" in
  v) VER=$OPTARG ;;
  *) echo "WARN: unknown parameter: ${OPTARG}"
  esac
done

version=${VER:-"1.18.3"}

cd || return
curl -L -# -O "https://golang.org/dl/go$version.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$version.linux-amd64.tar.gz"
rm "go$version.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bash_profile
echo "export GOPATH=$HOME/go" >> ~/.bash_profile
