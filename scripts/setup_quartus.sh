 #!/bin/bash
set -x

script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

pkgbase=quartus-free
pkgname=(${pkgbase} ${_components[@]})

# Keep dot in _patchver
_mainver=20.1; _patchver=.1; _buildver=720
# Latest version of quartus - issues with licensing, do not use without installing an older version of modelsim
#_mainver=21.1; _patchver=.0; _buildver=842

_fpgadir="/workspace/intelFPGA"
_alteradir="${_fpgadir}/${_mainver}"
pkgver=${_mainver}${_patchver}.${_buildver}

tar_file=Quartus-lite-${pkgver}-linux.tar
_base_url="https://download.altera.com/akdlm/software/acdsinst"

if [ $_patchver == ".0" ];
then
    source=("${_base_url}/${_mainver}std/${_buildver}/ib_tar/${tar_file}")
else
    source=("${_base_url}/${_mainver}std${_patchver}/${_buildver}/ib_tar/${tar_file}")
fi

if [ -d $_alteradir ]
then
    echo "$_alteradir exists"
else
    echo "$_alteradir does not exist: creating..."
    mkdir $_fpgadir
    mkdir $_alteradir
fi

if [ -f "/shared/${tar_file}" ]
then
    echo "Extracting Quartus, this may take some time..."
    tar -xvf /shared/${tar_file} -C ${_fpgadir} --exclude "components/arria_lite-${pkgver}.qdz" --exclude "components/cyclone10lp-${pkgver}.qdz" --exclude "components/max10-${pkgver}.qdz"
else
    echo "Downloading Quartus, this may take some time..."
    wget $source -P /shared
    echo "Extracting Quartus, this may take some time..."
    tar -xvf /shared/${tar_file} -C ${_fpgadir} --exclude "components/arria_lite-${pkgver}.qdz" --exclude "components/cyclone10lp-${pkgver}.qdz" --exclude "components/max10-${pkgver}.qdz"
fi





sudo chmod a+x ${_fpgadir}/components/*
sudo chown -R vagrant:vagrant /workspace/*

install_command="${_fpgadir}/components/QuartusLiteSetup-${pkgver}-linux.run \
        --disable-components modelsim_ae \
        --mode unattended \
        --unattendedmodeui none \
        --accept_eula 1 \
        --installdir "${_alteradir}""
echo "Installing Quartus, this may take some time..."
`runuser -l vagrant -c "${install_command}"`


# Cleanup
echo "Cleaning up"
rm -r ${_fpgadir}/components
rm ${_fpgadir}/readme.txt
rm ${_fpgadir}/setup.sh

#if [ -f "/workspace/${tar_file}" ]
#then
#    echo "Removing Tar file"
#    rm /workspace/$tar_file
#fi

 # Copy over base files
\cp -f /shared/quartus-free/base_quartus.sh /shared/quartus-free/quartus.sh
\cp -f /shared/quartus-free/base_quartus.desktop /shared/quartus-free/quartus.desktop
\cp -f /shared/quartus-free/base_modelsim-ase.sh /shared/quartus-free/modelsim-ase.sh
\cp -f /shared/quartus-free/base_modelsim-ase.desktop /shared/quartus-free/modelsim-ase.desktop

\cp -f /shared/images/modelsim_icon.png ${_alteradir}/modelsim_ase/modelsim_icon.png

 # Replace altera directory in integration files
sed -i "s,_alteradir,${_alteradir},g" /shared/quartus-free/quartus.sh
sed -i "s,_alteradir,${_alteradir},g" /shared/quartus-free/quartus.desktop
sed -i "s,_alteradir,${_alteradir},g" /shared/quartus-free/modelsim-ase.sh
sed -i "s,_alteradir,${_alteradir},g" /shared/quartus-free/modelsim-ase.desktop

# Fix modelsim startup code for Linux Kernel >=4.0
# see https://wiki.archlinux.org/index.php/Altera_Design_Software
sed -i 's,linux_rh60,linux,g' "${_alteradir}/modelsim_ase/vco"

# Suppress spurious warning about linux-gate.so.1
sed -i '/msg_system/a suppress = 3116' "${_alteradir}/modelsim_ase/modelsim.ini"

# Install integration files
install -D -m755 /shared/quartus-free/quartus.sh "/etc/profile.d/quartus.sh"
install -D -m644 /shared/quartus-free/quartus.desktop "/usr/share/applications/quartus.desktop"
install -D -m644 /shared/quartus-free/51-usbblaster.rules "/etc/udev/rules.d/51-usbblaster.rules"
install -D -m755 /shared/quartus-free/modelsim-ase.sh "/etc/profile.d/modelsim-ase.sh"
install -D -m644 /shared/quartus-free/modelsim-ase.desktop "/usr/share/applications/modelsim-ase.desktop"



echo "Finished Installing Quartus"