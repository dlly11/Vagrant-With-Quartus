 #!/bin/bash
set -x

script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

cd ~/
git clone https://github.com/dlly11/DESim.git
cd DESim/
git checkout Linux
cd Build/
./build_all.sh 
