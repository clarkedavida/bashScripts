#!/bin/bash

currentDirectory=$(pwd)
bashrcFile=${HOME}/.bashrc

echo "" >> ${bashrcFile}
echo "# bashTools" >> ${bashrcFile}
echo "export bashToolsPath='${currentDirectory}'" >> ${bashrcFile}
echo "alias whatsInQueue=\"\${bashToolsPath}/slurm/whatsInQueue.bash\"" >> ${bashrcFile}
echo "alias nodeList=\"\${bashToolsPath}/slurm/nodeList.bash\"" >> ${bashrcFile}
echo "alias buildQUDA=\"\${bashToolsPath}/MILC/build_quda.bash\"" >> ${bashrcFile}
echo "alias buildMILC=\"\${bashToolsPath}/MILC/build_milc_quda.bash\"" >> ${bashrcFile}



source ${bashrcFile}

echo "bashTools installed."
