 #!/bin/bash
set -x

script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

touch /etc/sddm.conf
echo "[General]" >> /etc/sddm.conf
echo "InputMethod=" >> /etc/sddm.conf
echo "[Users]" >> /etc/sddm.conf
echo "RememberLastUser=false"  >> /etc/sddm.conf
echo "HideUsers=ubuntu" >> /etc/sddm.conf
