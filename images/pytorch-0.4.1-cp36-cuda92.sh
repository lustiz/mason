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

# read environment name
default_name="pytorch2"
echo -n "Choose environment name [default: $default_name]: "
read env_name
if [ -z "$env_name" ]
then
    env_name=$default_name
fi

source ../bin/mason.bashrc
mason create $env_name
mason install $env_name ../gravel/anaconda3.mason
mason install $env_name ../gravel/cuda-9.2.mason  # this must be before PyTorch
mason install $env_name ../gravel/pytorch-0.4.1-cuda92.mason

# say a few things
clear
mason_welcome $env_name