#l!/bin/bash
cd `dirname $0`
h=`pwd`
echo $bash
export folder=$h/folder
#cd /fiche/images
##pn="ls"
#echo $($pn)
#export folder=$1
if [ ! -z $1 ]
then exit 1
fi
#*.{jpg,png,gif,jpeg}
function check {
#export	count=$($pn |wc -l)

#count=$($pn|wc -l)
#sleep 10
#old_count=$count

#count=$($pn |wc -l)
#if [[ "$old_count" != "$count" ]];
#	then ((c=$count-$old_count))
	
		for r in $(find $folder|grep jpg)
		do
			echo $r
			e=$(echo "${r##*.}")
			filename=`basename -- "$r"`
			echo $e
				if [[ "$e" == "jpg" || "$e" == "png" || "$e" == "gif" ]]
				then
				fullpath=$(echo "$r"|awk -F "$filename" {'print $1'})
				echo $fullpath

					#echo "/opt/resmushit-cli.sh --preserve-exif -notime -q 50 -o /fiche/images --preserve-filename /tmp/$r" 
					./resmushit -q 50 "$r" --preserve-filename -o $fullpath/ --preserve-exif --notime
#						if [[ -f "/fiche/images/$r" ]]
#						then
##						else
#							mv {/tmp,/fiche/images}/$r
#						fi
					fi
				done
				
			#else 
				#check
#		fi
	}

check

