#l!/bin/bash
cd /fiche/images
pn="ls -tr"
echo $($pn)

#*.{jpg,png,gif,jpeg}
function check {
#export	count=$($pn |wc -l)

count=$($pn|wc -l)
sleep 10
old_count=$count

count=$($pn |wc -l)
if [[ "$old_count" != "$count" ]];
	then ((c=$count-$old_count))
		arr=$($pn |tail -$c)
		for r in ${arr[@]}
		do
			echo $r
			e=$(echo "${r#*.}")
				if [[ "$e" == "jpg" || "$e" == "png" || "$e" == "gif" ]]
				then
					already=''
					mv {/fiche/images,/tmp}/$r

					echo "/opt/resmushit-cli.sh --preserve-exif -notime -q 50 -o /fiche/images --preserve-filename /tmp/$r" 
					/opt/resmushit-cli.sh -q 50 -o /fiche/images --preserve-filename /tmp/$r 
						if [[ -f "/fiche/images/$r" ]]
						then
							echo $r
						else
							mv {/tmp,/fiche/images}/$r
						fi
					fi
				done
				check
			else 
				check
		fi
	}

check

