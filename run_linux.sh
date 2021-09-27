 #!/bin/bash
set -x

script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

vagrant up
vagrant reload
