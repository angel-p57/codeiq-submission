n,k=gets.split.map &:to_i;p (1000000<<k)*(f=->x{(1..x).reduce 1,&:*})[n]**3/f[k]/f[n-k>>1]**2/f[n*2]
