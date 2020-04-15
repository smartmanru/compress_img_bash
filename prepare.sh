#!/usr/bin/env bash
if [[ -n $1 ]];then
export count=$1
else 
export count=0
fi
export ptp=$(pwd)
subfo=($(ls -d ${ptp}*/*/))
# folders=()
for ((i=0;i<${#subfo[@]};i++)); do

    d=${subfo[$i]}
    cd $d
    f=$(basename $PWD)
    cd -
    mkdir -p $count 
    find $f |sed -e "s/\(.\+\)$f\(.3d.[0-9]\+.[0-9]\+\.jpg\)/mv & \1$count\2 ; /g"|grep mv  | source /dev/stdin ##+++++
    find $f -mindepth 1 -maxdepth 2 -type d|tac|grep 3d |sed -e "s/$f\/3д\/$f.3d/mv & $count\/$count.3d/g"| source /dev/stdin
    mv $f/3д/$f.html $count/$count.html
    mv $f/3д/$f.jpg $count/$count.jpg
    mv $f/3д/photo3d-html-files $count/photo3d-html-files
    find $f|head -1|tail -1|sed -e "s/$f\/3д/$count/g" | source /dev/stdin

    let count="$count+1"
done

