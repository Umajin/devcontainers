#!/bin/bash

set -e

USERNAME="${_REMOTE_USER:-vscode}"

if [ "${USERNAME}" = "root" ]; then
    USER_HOME="/root"
else
    USER_HOME="/home/${USERNAME}"
fi

echo "Installing Volta for ${USERNAME}"

su "${USERNAME}" -c "curl https://get.volta.sh | bash"

cat >/etc/profile.d/volta.sh <<EOF
export VOLTA_HOME="${USER_HOME}/.volta"
export PATH="\$VOLTA_HOME/bin:\$PATH"
EOF

chmod +x /etc/profile.d/volta.sh