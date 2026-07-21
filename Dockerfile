FROM debian:trixie-slim AS base

# Combine ALL apt operations and the task runner installation into ONE layer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
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
        libatomic1 && \
        openssh-client && \
    curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | bash && \
    apt-get install -y --no-install-recommends task && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV SHELL=/bin/bash
ENV STARSHIP_CONFIG=/etc/starship/starship.toml

COPY starship.toml /etc/starship/starship.toml

# Only create user if strictly necessary for your workflow
RUN useradd -m -s /bin/bash vscode && \
    echo "vscode ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode && \
    echo 'eval "$(starship init bash)"' >> /etc/bash.bashrc && \
    echo 'eval "$(fzf --bash)"' >> /etc/bash.bashrc && \
    echo 'eval "$(task --completion bash)"' >> /etc/bash.bashrc

CMD ["bash"]