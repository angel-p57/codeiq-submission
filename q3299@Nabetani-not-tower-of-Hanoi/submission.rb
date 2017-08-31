p ->s{
  (f=->a{
    t=a.size
    return t if t<=2
    if a[1]>=a[0]
      x=a.index{|e|e<a[0]} or return t
    else
      y=(2...t).find{|i|a[i]!=a[1]} or return t
      x=a[y]>a[1] ? y+1 : (y+1...t).find{|i|a[i]>a[1]} ? 1 : y
    end
    x + f[a[x...t]]*2
  })[s.bytes.reverse]
}[gets.chomp]
