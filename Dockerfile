FROM debian:12.6@sha256:45f2e735295654f13e3be10da2a6892c708f71a71be845818f6058982761a6d3

RUN apt-get update && apt-get install -y python3 python3-pip sudo gcc git openssl libssl-dev vim php-cli curl wget gdb file netcat-openbsd sslscan nmap binwalk exiftool tmux neovim hydra lftp ftp ncat ffuf gobuster golang unzip zip python3-pwntools python3-ropgadget nasm sagemath strace ltrace elfutils
RUN dpkg --add-architecture i386
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 gcc-multilib build-essential
RUN useradd -m -s /bin/bash user && usermod -a -G sudo user && echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y patchelf

RUN ln -s /usr/bin/python3 /usr/local/bin/python
RUN chown -R user:user /opt

RUN gem install one_gadget

USER user

ENV LC_CTYPE=C.UTF-8
ENV SHELL=/bin/bash

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN /home/user/.cargo/bin/cargo install ropr
RUN /home/user/.cargo/bin/cargo install --git https://github.com/robbert1978/pwninit.git --rev b4d4d90fab43d8d5cb7844f61d02ce7aa65578be

WORKDIR /opt
RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh

WORKDIR /home/user
