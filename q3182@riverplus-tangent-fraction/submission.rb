p ->n{
  (f=->x,y,t{
    s,d=(n-x)/y,x*2-y
    s+=f[x,t,y] until n<(x+=y)+t+=d+=y*2
    s
  })[0,1,1]
}[(1.0/Math.tan(gets.to_f)).floor]
