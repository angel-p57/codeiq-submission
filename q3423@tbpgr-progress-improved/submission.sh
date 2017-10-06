(((n=`cat`)%2))&&seq -f%${n}g $n|sed '2,$g;s/y.y/.y./;s/y.\(.*\).y/.y\1y./;s/ /y/;y/ 1/.y/;h'||echo invalid
