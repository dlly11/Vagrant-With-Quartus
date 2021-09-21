 #!/bin/bash
set -x

script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

read -d '' PACKAGES <<EOT
linux-image-generic
bc
libtool-bin
gperf
bison
flex
texi2html
texinfo
help2man
gawk
libtool
build-essential
automake
libncurses5-dev
libncurses6
libglib2.0-dev
libfdt-dev
device-tree-compiler
qemu-user-static
binfmt-support
multistrap
git
lib32z1
lib32stdc++6
libssl-dev
kpartx
dosfstools
nfs-common
zerofree
u-boot-tools
rpm2cpio
curl
libsdl1.2-dev
libpixman-1-dev
libc6-dev
chrpath
socat
zlib1g-dev
zlib1g:i386
unzip
rsync
python3-pip
python3
gcc-multilib
xterm
net-tools
libidn11
libxft2
libxft2:i386
libxrender1:i386
libxtst6:i386
libxi6:i386
EOT
set -e

sudo apt-get update
sudo dpkg --add-architecture i386
sudo apt-get update
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/ppa
sudo apt update
sudo apt-get install -y $PACKAGES
sudo apt full-upgrade -y
