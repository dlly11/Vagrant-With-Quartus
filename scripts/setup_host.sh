 #!/bin/bash
set -x

script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

source /shared/scripts/setup_dependencies.sh
source /shared/scripts/setup_quartus.sh
source /shared/scripts/setup_extras.sh