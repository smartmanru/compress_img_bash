#l!/bin/bash
cd `dirname $0`
h=`pwd`
echo $bash
export f=$h/folder

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in

  -f | --flag )
    flag=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi


#*.{jpg,png,gif,jpeg}
function check {
#export	count=$($pn |wc -l)

#count=$($pn|wc -l)
#sleep 10
#old_count=$count
tmp=tmp
mkdir -p $tmp
#count=$($pn |wc -l)
#if [[ "$old_count" != "$count" ]];
#	then ((c=$count-$old_count))
	
		for r in $(find $f|grep jpg);
		do
			echo $r
			e=$(echo "${r##*.}")
			n=`basename -- "$r"`
			echo $e
				if [[ "$e" == "jpg" || "$e" == "png" || "$e" == "gif" ]]
				then
				fp=$(echo "$r"|awk -F "$n" {'print $1'})
				echo "/$fp/$n"
				#echo "/opt/resmushit-cli.sh --preserve-exif -notime -q 50 -o /fiche/images --preserve-n /tmp/$r" 
				./resmushit -q 50 "$r"  --preserve-exif --preserve-n
				# if [[ ! -f "$fp/$r" ]]
				# then
				# 		mv {./$tmp,$fp}/$r
				# fi
				fi
				
		done

	}

check

