#!/usr/bin/env bash

# install golang
[[ -z $(which go 2>/dev/null) ]] && sudo yum install golang && [[ -z $(cat ~/.bashrc|grep GOPATH) ]] && echo "export PATH=$PATH:~/go/bin/ #GOPATH" | tee -a ~/.bashrc
source ~/.bashrc

# install opengfw
if [[ -z $(which OpenGFW 2>/dev/null) ]]; then
	go install -v github.com/apernet/OpenGFW@latest
fi

export OPENGFW_LOG_LEVEL=debug
cd ~/.local/share/opengfw
yes $USER_PASSWD | sudo /home/$USER/go/bin/OpenGFW -c config.yaml rules.yaml
