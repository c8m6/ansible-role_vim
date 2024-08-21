FROM ubuntu:24.04

ARG USER=nvim
ENV TERM=xterm-256color
ENV CONTAINER=true
ENV HOME=/home/nvim

RUN apt-get update && \
    apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      curl \
      git \
      ca-certificates \
      lsb-release \
      sudo \
      ansible

#RUN { \
#  echo '#!/bin/bash'; \
#  echo 'sudo chown -R $(id -un):$(id -gn) /home/nvim'; \
#  echo 'sudo ln -s /home/nvim $HOME'; \
#  echo 'export PATH="$HOME/.local/bin:$PATH"'; \
#  echo '/opt/neovim/nvim "$@"'; \
#} > /entry-point.sh \
#	&& chmod +x /entry-point.sh

RUN useradd \
    --create-home \
    --groups sudo \
    --no-log-init \
    --shell /bin/bash \
    --system \
    $USER && \
  echo 'ALL ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER $USER
WORKDIR /opt/ansible-role_vim
COPY . /opt/ansible-role_vim/
RUN ansible-playbook -i 'localhost,' --connection=local -K standalone.yml

WORKDIR /NVIM
RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /opt/ansible-role_vim
RUN sudo chmod -R o=u ${HOME}

ENTRYPOINT ["/opt/neovim/nvim"]

