#!/bin/bash

currentDirectory=$(pwd)
bashrcFile=${HOME}/.bashrc

echo "" >> ${bashrcFile}
echo "# bashTools" >> ${bashrcFile}
echo "export bashToolsPath='${currentDirectory}'" >> ${bashrcFile}
echo "alias whatsInQueue=\"\${bashToolsPath}/slurm/whatsInQueue.bash\"" >> ${bashrcFile}
echo "alias nodeList=\"\${bashToolsPath}/slurm/nodeList.bash\"" >> ${bashrcFile}



source ${bashrcFile}

echo "bashTools installed."
