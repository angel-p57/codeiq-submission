require 'prime'
p->n,k{
  a,*t=n*(n+1)/2,[n,1]
  k.prime_division.each{|q,r|
    t.size.times{|i|
      m,c=t[i]
      c*=1-q
      r.times{
        t.push([m/=q,c])
        a+=m*(m+1)/2*c
      }
    }
  }
  a
}[*gets.split.map(&:to_i)]
