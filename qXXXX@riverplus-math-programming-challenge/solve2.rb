p->n{
  s=m=(n+1)/2
  2.step{|u|
    return s if u**2>m
    ((u-1)%2).step(u,2){|d|
      next if u.gcd(d)>1
      t=m/(u*u+d*d)
      break if t<1
      s+=t*2
    }
  }
}[10**7]
