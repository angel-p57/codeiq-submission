p ->n{
  (1..n).reduce(0){|s,i|
    b=i*i+1
    s+(1..i).count{|j|b%j==0}
  }
}[gets.to_i]
#}[(1.0/Math.tan(gets.to_f)).floor]
