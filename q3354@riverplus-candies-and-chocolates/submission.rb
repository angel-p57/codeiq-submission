n,k=gets.split.map &:to_i
b=[2]*n
2.upto(k){|i|i.upto(n-k){|j|b[j]+=b[j-i]}}
p b[n-k]
