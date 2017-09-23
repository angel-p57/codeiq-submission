p ->n{
  (f=->t,r,d{
    return t<1 ? 3 : (r<t*4 ? r : r-1)/t if d<1
    b,u=10**(d-1),t*10+d
    c,s=case x=r/b
    when 0...u*3
      [x/u,0]
    when 0...u*4+10
      t+=1
      [3,0]
    else
      [(x-10)/u,10]
    end
    c*b*10+f[t,r-(s+c*u)*b,d-1]
  })[0,n-1,Math.log10(n).ceil]
}[gets.to_i]
