n,m=gets.split.map &:to_i
a=d=q=1
t=2-n*2;t+=n*=n
2.upto(m){|k|q*=n-=1;a=a*n+k*d*=t-=1}
p a*1000/q
