FROM debian:trixie-slim AS base

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    git \
    curl \
    ca-certificates \
    unzip \
    jq \
    ripgrep \
    fzf \
    procps \
    iputils-ping \
    sudo \
    starship \
    && rm -rf /var/lib/apt/lists/*

# Make bash the default shell for interactive sessions
ENV SHELL=/bin/bash
ENV STARSHIP_CONFIG=/etc/starship/starship.toml

COPY starship.toml /etc/starship/starship.toml

RUN useradd -m -s /bin/bash vscode \
    && echo "vscode ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/vscode \
    && echo 'eval "$(starship init bash)"' >> /etc/bash.bashrc

USER vscode
