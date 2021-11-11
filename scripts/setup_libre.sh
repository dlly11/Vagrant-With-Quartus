#!/bin/bash
set -x

   # ------------------------------------------------------------------------------
   # LibreOffice Extensions - bundle install (for all users) just by unzipping!!!
   # ------------------------------------------------------------------------------

sudo apt install -y libreoffice

if [ -d /shared/tmp ]
then
    echo "/shared/tmp exists"
else
    echo "/shared/tmp does not exist: creating..."
    mkdir /shared/tmp
fi

wget https://extensions.libreoffice.org/assets/downloads/41/1635502221/dict-en-20211101.oxt -P /shared/tmp

MY_EXTENSIONS_TO_INSTALL_DIR=/shared/tmp
LO_EXTENSION_DIR=/usr/lib/libreoffice/share/extensions
if [ -x "${LO_EXTENSION_DIR}/" ]; then
    for EXT_FILE in "${MY_EXTENSIONS_TO_INSTALL_DIR}/"*.oxt ; do
    if [ -f "${EXT_FILE}" ]; then
        LO_EXTENSION=$(basename --suffix=.oxt ${EXT_FILE})
        if [ -e "${LO_EXTENSION_DIR}/${LO_EXTENSION}" ]; then
        echo "  Replacing ${LO_EXTENSION} extension"
        rm -rf "${LO_EXTENSION_DIR}/${LO_EXTENSION}"
        else
        echo "  Adding ${LO_EXTENSION} extension"
        fi
        unzip -q -d "${LO_EXTENSION_DIR}/${LO_EXTENSION}" \
                    "${MY_EXTENSIONS_TO_INSTALL_DIR}/${LO_EXTENSION}.oxt"
    else
        [ "$DEBUG" ] && echo "DEBUG: no .oxt files to install"
    fi
    done
else
    echo "WARNING: could not find LibreOffice install..."
fi

rm -r /shared/tmp
