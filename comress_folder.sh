#!/bin/bash
cd `dirname $0`
h=`pwd`
echo $bash
export f="$h/"

h_len=$(echo `expr "$h" : '.*'`)

function check {
tmp=tmp
mkdir -p $tmp
		for r in $(find $f|grep jpg);
		do
			echo $r
			e=$(echo "${r##*.}")
			n=`basename -- "$r"`
			echo $e
				if [[ "$e" == "jpg" || "$e" == "png" || "$e" == "gif" ]]
				then
				fp=$(echo "$r"|awk -F "$n" {'print $1'})
				pa=${r:$h_len}
				r_len=$(echo `expr "$r" : '.*'`) #длина пути полного
				n_len=$(echo `expr "$n" : '.*'`) #длина имени 
				pa_len=$(echo `expr "$pa" : '.*'`)
				len_np=$(expr $pa_len-$n_len)
				np=${pa:0:$len_np}
				./resmushit -q 50 "$r"  --preserve-exif --preserve-filename -o tmp/$np
				if [ $? != 0 ] 
				then 
					./resmushit -q 50 "$r"  --preserve-exif --preserve-filename -o tmp/$np
				fi
			fi
		done
	}
check
