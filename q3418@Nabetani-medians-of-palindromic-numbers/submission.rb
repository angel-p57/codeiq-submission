n2pi=->n,upper=false{
  s=n.to_s
  d=s.size
  a=s[0,(d+1)/2]
  t=(a+a[0,d/2].reverse).to_i
  10**(d/2)+a.to_i-2+( n==t||upper^(t<n) ? 0 : upper ? 1 : -1 )
}
pi2ns=->i{
  dh=Math.log10((i+2)*10/11).floor
  a=(i+2-10**dh).to_s
  a+a[0,dh].reverse
}
puts ->x,y{
  xpi,ypi=n2pi[x,true],n2pi[y]
  return ?- if xpi>ypi
  (s=xpi+ypi).even? ? pi2ns[s/2] : (0..1).map{|i|pi2ns[s/2+i]}*?,
}[*gets.split(?,).map(&:to_i)]
