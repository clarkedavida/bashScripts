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
echo "alias whatsMyOS=\"\${bashToolsPath}/general/whatsMyOS.bash\"" >> ${bashrcFile}
echo "alias untgz=\"\${bashToolsPath}/general/untgz.bash\"" >> ${bashrcFile}
echo "alias tgz=\"\${bashToolsPath}/general/tgz.bash\"" >> ${bashrcFile}
echo "alias archive=\"\${bashToolsPath}/general/tar.bash\"" >> ${bashrcFile}
echo "alias unarchive=\"\${bashToolsPath}/general/untar.bash\"" >> ${bashrcFile}
echo "alias comments=\"\${bashToolsPath}/general/comments.bash\"" >> ${bashrcFile}
echo "alias concatenateFiles=\"\${bashToolsPath}/general/concatenateFiles.bash\"" >> ${bashrcFile}
echo "alias countFiles=\"\${bashToolsPath}/general/countFiles.bash\"" >> ${bashrcFile}
echo "alias totalFiles=\"\${bashToolsPath}/general/countHomeFiles.bash\"" >> ${bashrcFile}

source ${bashrcFile}

echo "bashTools installed."
