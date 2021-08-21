#!/bin/bash

cd ~
git clone git@github.com:spack/spack.git
echo "source ~/spack/share/spack/setup-env.sh" >> ~/.bashrc


# TODO `spack install` some software
