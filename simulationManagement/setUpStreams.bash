# 
# setUpStreams.bash                                                               
# 
# D. Clarke 
# 
# This is to automate setting up multiple streams/series/whatever your collaboration
# likes to call them. We assume the following setup:
#
# 1. Every stream is going to use the same seed configuration. It may have some
#    auxiliary files depending on your format. They are kept together in seedFold.
#    You can specify the list of auxiliary files below.
# 2. Every stream calls an executable that takes some parameter file paramFile
#    as input. This paramFile will have everything set correctly except the seed
#    ahead of time. This script will modify the seed. 
#

source "${bashToolsPath}/bashTools.bash"


streamPrefix=stream
streamStartNo=4
streamEndNo=20
streamStartDemarc=s
streamEndDemarc=.
paramFile=in.param
seedFold=seedFold
seedPrefix=l3216f3b6050m00394m1064_s0.
seedConf=l3216f3b6050m00394m1064_s0.0
seedCheck=l3216f3b6050m00394m1064_s0.0.check
checkFile=true
seedRandTag=rand_seed
inConfTag=conf_file

auxiliaryFiles=(${paramFile} rand0)

streams=($(seq ${streamStartNo} ${streamEndNo}))

for i in "${streams[@]}"; do

   # Create stream folder
   streamFold=${streamPrefix}${i}
   mkdir -p ${streamFold}

   # Put in the first configuration and label it accordingly
   firstConf=${seedConf/${streamStartDemarc}[^.]*${streamEndDemarc}/${streamStartDemarc}${i}${streamEndDemarc}}
   cp ${seedFold}/${seedConf} ${streamFold}/${firstConf}

   # Put in the check file, if there is one
   if [ "$checkFile" = true ]; then
     firstCheck=${seedCheck/${streamStartDemarc}[^.]*${streamEndDemarc}/${streamStartDemarc}${i}${streamEndDemarc}}
     cp ${seedFold}/${seedCheck} ${streamFold}/${firstCheck}
   fi

   # Put in any auxiliary files
   for aux in "${auxiliaryFiles[@]}"; do
     cp ${seedFold}/${aux} ${streamFold}/.
   done

   # Update the parameter file with the seed and conf name
   newSeed=$((BASHTOOLSSEED+$i))
   newPrefix=${seedPrefix/${streamStartDemarc}[^.]*${streamEndDemarc}/${streamStartDemarc}${i}${streamEndDemarc}}
   echo $newPrefix
   sed -i -e "s/${seedRandTag} *= *[0-9]*/${seedRandTag} = ${newSeed}/g" "${streamFold}/${paramFile}"
   sed -i -e "s/${inConfTag}.*/${inConfTag} = ${newPrefix}/g" "${streamFold}/${paramFile}"

done

