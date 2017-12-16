p ->n,k{
  return 0 if (n-k).odd?
  f=->n{n<2?1:(1..n).reduce(&:*)}
  (1000000<<k)*f[n]**3/(f[k]*f[n-k>>1]**2*f[n*2])
}[*gets.split.map(&:to_i)]
