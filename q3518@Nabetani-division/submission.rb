require'prime'
puts (x=(r=gets.to_r).denominator.prime_division.map{|a,b|10%a<1?b:break})?(x=x.max)?sprintf("%2$d.%03$*1$d",x,*(r*x=10**x).to_i.divmod(x)):r.to_i: r
