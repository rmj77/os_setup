#!/bin/bash

set -e

cd ~
git clone git@github.com:spack/spack.git
echo "source ~/spack/share/spack/setup-env.sh" >> ~/.bashrc


# TODO `spack install` some software
spack install -y lmod gcc llvm python
