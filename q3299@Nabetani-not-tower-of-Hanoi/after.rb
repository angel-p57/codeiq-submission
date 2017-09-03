p ->s{
  d=s.size
  m={}
  perm=[*0..2].permutation(2).to_a
  q=[ [2,s,"",""] ]
  (1..1.0/0).find{|step|
    qc,q=q,[]
    !qc.each{|r|
      perm.each{|i,j|
        next if i==r[0]
        next if r[i+1]==""
        sp=r[i+1][0]+r[j+1]
        next if sp.bytes.each_with_object([0,0]).any?{|c,mins|
          next true if c<mins[0]
          mins[0]=c
          mins.sort!
          false
        }
        break if j!=0&&sp.size==d
        rn=(0..2).map{|k| k==i ? r[k+1][1..-1] : k==j ? sp : r[k+1]}
        mk=[rn[0],*rn[1,2].sort]*?,
        next if m[mk]
        m[mk]=step
        q.push(rn.unshift(j))
      } or break
    }
  }
}[gets.chomp]
