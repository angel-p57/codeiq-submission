$,=$/;print 1&($n=<>)?map{$x=~s/((y).(.*)|y)(.y)/$4$3$2./;$x//=("."x$n)=~s/^.|.$/y/gr}1..$n:invalid
