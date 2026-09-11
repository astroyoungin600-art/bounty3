#!/bin/bash
sudo apt update && sudo apt install -y wget unzip
BIN=/usr/local/bin
install_tool(){
  name=$1; repo=$2; bin=$3
  ver=$(curl -sL https://github.com/$repo/releases/latest | grep -o '/v[0-9.]*' | head -1 | tr -d '/')
  echo "Installing $name $ver"
  wget -q https://github.com/$repo/releases/download/$ver/${bin}_*_linux_amd64.zip -O /tmp/$bin.zip
  unzip -o /tmp/$bin.zip -d /tmp/
  sudo mv /tmp/$bin $BIN/ 2>/dev/null || sudo mv /tmp/${bin}-* $BIN/$bin 2>/dev/null || true
  sudo chmod +x $BIN/$bin
}
install_tool subfinder projectdiscovery/subfinder subfinder
install_tool httpx projectdiscovery/httpx httpx
install_tool katana projectdiscovery/katana katana
install_tool nuclei projectdiscovery/nuclei nuclei
install_tool dnsx projectdiscovery/dnsx dnsx
install_tool naabu projectdiscovery/naabu naabu
nuclei -update-templates || true
httpx -version; nuclei -version
