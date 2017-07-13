p ->n{
  t=[[s=1]]
  1.upto(n){|i|
    s,*r=0
    ((Math.sqrt(i*8+1)-1)/2).floor.downto(1){|j|
      r.unshift(s+=t[i-j][j-1])
    }
    t.push(r.unshift(s))
  }
  s
}[gets.to_i]
