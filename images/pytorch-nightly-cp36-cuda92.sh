#!/usr/bin/env bash

# platform check
platform="$(uname)"
case $platform in
   'Linux') ;; #allgood
   'Darwin') ;; #allgood
    *)
        echo "Platform $platform not supported!"
        return 1
        ;;
esac

# give a environment name
default_name="pytorch3-nightly"
echo -n "Choose environment name [default: $default_name]: "
read env_name
if [ -z "$env_name" ]; then
    env_name=$default_name
fi

mason create $env_name
mason install $env_name anaconda3
mason install $env_name cuda-9.2-conda
mason install $env_name pytorch-nightly-cuda92


# say hello
clear; mason_welcome $env_name
