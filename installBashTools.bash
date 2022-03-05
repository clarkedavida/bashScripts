currentDirectory=$(pwd)
bashrcFile=${HOME}/.bashrc

echo "" >> ${bashrcFile}
echo "# Location of bashTools" >> ${bashrcFile}
echo "export bashToolsPath='${currentDirectory}'" >> ${bashrcFile}

source ${bashrcFile}

echo "bashTools installed."
