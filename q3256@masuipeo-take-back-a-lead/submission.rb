fc=->n,m{(1..m).reduce(1){|s,i|s*(n-i+1)/i}}
ff=->a,b{b>a+2 ? 0 : 2**a}
p ->n,a,b{
  a,b=[a,b].sort
  b<n ? fc[a+b,a] : a<n-1 ? b>n+1 ? 0 : fc[a+n-1,a] : fc[n*2-2,n-1]*ff[a-n+1,b-n+1]
}[*gets.split.map(&:to_i)]
