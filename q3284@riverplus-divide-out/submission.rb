n,p=gets.split.map &:to_i
f=->x,y=1{a=x<1?1:f[x/p,-y];1.upto(x%p){|j|a=a*j*y%p};a}
p f[n]
