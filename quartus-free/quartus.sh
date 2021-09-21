export PATH=$PATH:/workspace/intelFPGA/20.1/quartus/bin:/workspace/intelFPGA/20.1/quartus/sopc_builder/bin

# Detect if a 64bit machine and activate quartus
# depending on it.
if [ `uname -m` = "x86_64" ] ; then
  QUARTUS_64BIT='1'
else
  QUARTUS_64BIT='0'
fi
export QUARTUS_64BIT
