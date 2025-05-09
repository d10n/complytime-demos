#!/bin/bash
set -x
cmd=(
    podman build
    -t complytime_centos
    #--build-arg ANSIBLE_SSH_KEY="$(cat ~/.ssh/id_ed25519.pub)"
    -f Containerfile
)
"${cmd[@]}"
