#!/bin/sh
set -eu

if [ -z "$DOCKER_REMOTE_HOST" ]; then
    echo "DOCKER_REMOTE_HOST is required!"
    exit 1
fi

# Extra handling for SSH-based connections.
##if [ ${DOCKER_REMOTE_HOST#"ssh://"} != "$DOCKER_REMOTE_HOST" ]; then
##    SSH_HOST=${DOCKER_REMOTE_HOST#"ssh://"}
##    SSH_HOST=${SSH_HOST#*@}

##    if [ -z "$DOCKER_SSH_PRIVATE_KEY" ]; then
##        echo "DOCKER_SSH_PRIVATE_KEY is required for SSH hosts!"
##        exit 1
##    fi

##    if [ -z "$DOCKER_SSH_PUBLIC_KEY" ]; then
##        echo "DOCKER_SSH_PUBLIC_KEY is required for SSH hosts!"
##        exit 1
##    fi

    ##echo "Registering SSH keys..."

    # Save private key to a file and register it with the agent.
    ##mkdir -p "$HOME/.ssh"
    ##echo "Made directory"
    ##printf '%s' "$DOCKER_SSH_PRIVATE_KEY" > "$HOME/.ssh/docker"
    ##echo "proof"
    ##head -c 50 $HOME/.ssh/docker
    ##echo "Added private key"
    ##chmod 600 "$HOME/.ssh/docker"
    ##echo "Updated chmod"
    ##eval $(ssh-agent)
    ##echo "Evaled SSH-AGENT"
    ##ssh-add "$HOME/.ssh/docker"
    ##echo "SSH-Added"

    # Add public key to known hosts.
    ##printf '%s %s\n' "$SSH_HOST" "$DOCKER_SSH_PUBLIC_KEY" >> /etc/ssh/ssh_known_hosts
    ##echo "Added key to known hosts"
##fi

echo "Connecting to $DOCKER_REMOTE_HOST..."
docker --log-level debug --host "$DOCKER_REMOTE_HOST" "$@" 2>&1
