FROM centos:stream9
#FROM docker.io/fedora

RUN dnf update -y && dnf install -y \
    openscap-scanner \
    openscap-engine-sce \
    scap-security-guide\
    vim \
    tmux \
    file \
    golang \
#    awk \
    git \
    make \
    openssh-clients \
    openssh-server \
    python3-pip \
    tar \
# Uncomment for centos:
    go-toolset \
# Uncomment for fedora:
#    golang \
    tree
RUN mkdir -p ~/.config/complytime/{bundles,controls,plugins}

#COPY docs/samples/sample-profile.json ~/.config/complytime/controls/
#COPY docs/samples/sample-component-definition.json ~/.config/complytime/bundles/
#COPY bin/complytime /usr/bin/complytime
#COPY bin/openscap-plugin ~/.config/complytime/plugins/
#RUN sha256sum ~/.config/complytime/plugins/openscap-plugin

# Set the ansible ssh key, or if empty, configure ansible to use root:toor
ARG ANSIBLE_SSH_KEY
# Example:
#ssh-ed25519 AAAAxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx user@host

EXPOSE 2222
RUN echo root:toor | chpasswd && \
    sed -i 's/#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#Port .*/Port 2222/' /etc/ssh/sshd_config && \
    ssh-keygen -A && \
    printf '%s\n' "$ANSIBLE_SSH_KEY" >>~/.ssh/authorized_keys


env GOTOOLCHAIN=auto

ENTRYPOINT ["/bin/sh", "-c", "/usr/sbin/sshd && exec /usr/bin/bash -l"]
