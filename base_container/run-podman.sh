#!/bin/bash
set -x
cmd=(
    podman run --rm -it
    -v "$HOME/code/complytime:/complytime"
    -v "$HOME/code/complytime-demos:/complytime-demos"
    -v "$HOME/code/vm-toolbox:/vm-toolbox"
    -p 127.0.0.1:2222:2222

    complytime_centos
    #complytime_fedora

    /bin/bash
)
"${cmd[@]}"
