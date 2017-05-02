require 'prime'
p ->m,n{
  j=s=a=0
  bs=(0..9).map{[]}
  Prime.each(n){|q|
    next if q<m
    q.to_s.chars{|c|
      b=bs[c=c.to_i]
      b.push([j+=1,s+=c])
      b.shift until j-b[0][0]<140
      a=[a,s-b[0][1]+c].max
    }
  }
  a
}[*gets.split.map(&:to_i)]
