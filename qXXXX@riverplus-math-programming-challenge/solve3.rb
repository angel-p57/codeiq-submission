require 'matrix'
M=10**8
f1=->k,n{
  fp=->m,r{ r<2 ? m : (t=fp[(m*m).map{|e|e%M},r/2];r.odd? ? t*m : t).map{|e|e%M} }
  n<0 ? 0 : n<1 ? 1 : fp[Matrix[[*1..k].reverse,*(0..k-2).map{|i|t=[0]*k;t[i]=1;t}],n][0,0]
}
f2=->k,n{
  case n
  when 0; 1
  when 1; k
  else
    if n<0
      0
    else
      w=[*[0]*(k-1),1,k,k*k+k-1]
      (n-2).times{ w.push(((k+2)*(w[-1]-w[-2])+w[-k-2])%M) }
      w[-1]
    end
  end
}
p (f1[10,10**10]+f2[10**4,10**6])%M
