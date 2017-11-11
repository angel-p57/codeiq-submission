m,n=gets.split.map &:to_i
t=m<<m*2-n
2.upto(n){|k|t=t*(m-=1)/k}
s=t
1.upto(n/2){|k|s+=t=t*n*(1+n-=2)/k/k/4}
p s
