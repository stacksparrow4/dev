FROM debian:12.6@sha256:45f2e735295654f13e3be10da2a6892c708f71a71be845818f6058982761a6d3

RUN apt-get update && apt-get install -y python3 python3-pip sudo gcc git openssl libssl-dev vim php-cli curl wget gdb file netcat-openbsd sslscan nmap binwalk exiftool tmux neovim hydra lftp ftp ncat ffuf gobuster golang unzip zip python3-pwntools python3-ropgadget nasm zsh
RUN apt-get update && apt-get install -y sagemath
RUN useradd -m -s /bin/zsh user && usermod -a -G sudo user && echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN ln -s /usr/bin/python3 /usr/local/bin/python

USER user

ENV LC_CTYPE=C.UTF-8
ENV SHELL=/bin/zsh

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN cargo install pwninit

RUN sed -i 's/robbyrussell/alanpeabody/' /home/user/.zshrc 

WORKDIR /home/user