#!/bin/bash
set -e
sudo apt update
sudo apt install -y wget unzip nmap python3-pip

echo "Go version: $(go version)"
echo "APT working: $(apt --version)"
echo "Ready - now you can run go install for nuclei tools"