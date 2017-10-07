(((n=`cat`)%2))&&seq -f%${n}g $n|sed -E '2,$g;s/((y).(.*)|y)(.y)/\4\3\2./;s/ /y/;y/ 1/.y/;h'||echo invalid
