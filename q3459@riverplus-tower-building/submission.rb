p->n,a,b{
  f=->m{(1..m).reduce(1){|a,k|a*(n-m-k+1)/k}}
  ([n-a+1>>1,0].max..[n/2,b].min).reduce(0){|s,k|s+f[k]}
}[*gets.split.map(&:to_i)]%1000003
