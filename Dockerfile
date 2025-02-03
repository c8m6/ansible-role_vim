FROM ubuntu:24.04

ARG USER=nvim
ENV TERM=xterm-256color
ENV CONTAINER=true
ENV HOME=/home/nvim

RUN apt-get update && \
    apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      ansible \
      bundler \
      ca-certificates \
      curl \
      git \
      lsb-release \
      sudo

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
RUN sudo chmod -R o=u ${HOME} /var/lib/gems /usr/local/bin
RUN bundle config set --local path "${HOME}/bundler"


ENTRYPOINT ["/opt/neovim/nvim"]

