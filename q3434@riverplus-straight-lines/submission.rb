p ->n{
  return 6 if n==2
  a=1
  1.upto(n-2){|i|
    (i+1).upto(n-1){|j|
      next if i.gcd(j)>1
      a+=
        j*2>=n ? (n-i)*(n-j) :
        j*3>=n ? i*(n*2-j*4)+(n-i)*(j*3-n) :
                i*j*2
    }
  }
  a*4
}[gets.to_i]
