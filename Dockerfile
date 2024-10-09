# Docker installation inspired by:
# https://stackoverflow.com/a/71513191
FROM debian:bookworm-slim


SHELL ["/bin/bash", "-c"]


RUN echo "deb http://deb.debian.org/debian bullseye main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://deb.debian.org/debian bullseye main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y \
    build-essential \
    curl \
    git \
    jq \
    libffi-dev \
    libffi7 \
    libgmp-dev \
    libgmp10 \
    libncurses-dev \
    libncurses5 \
    libtinfo5 \
    libnuma-dev \
    vim


RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | \
    BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
    BOOTSTRAP_HASKELL_GHC_VERSION=latest \
    BOOTSTRAP_HASKELL_CABAL_VERSION=latest \
    BOOTSTRAP_HASKELL_INSTALL_STACK=1 \
    BOOTSTRAP_HASKELL_INSTALL_HLS=1 \
    BOOTSTRAP_HASKELL_ADJUST_BASHRC=P \
    sh


# add ghc to PATH
RUN echo "source /root/.ghcup/env" >> /root/.bashrc
RUN ln -s /root/.ghcup/bin/cabal /usr/bin/cabal
RUN ln -s /root/.ghcup/bin/ghc /usr/bin/ghc
RUN ln -s /root/.ghcup/bin/ghci /usr/bin/ghci
