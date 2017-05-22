n=gets.to_i
cs=[t=1,*(1..(n-1)/2).map{|e|t=t*(n-e)/e}]
minv=(0..(n-1)/2).reduce(0){|s,i|s+(n*2-i*4-1)*cs[i]}
maxv=3**(n-1)
p [cs,minv,maxv]
f=->i,s,b,ls,rs,mask{
  i==0 ?
    (1...s).any?{|lv|
      next if lv==rv=s-lv
      outer=[lt=lv,rt=rv]
      ls.each{|e|outer.push(lt+=e)}
      rs.each{|e|outer.push(rt+=e)}
      outer.sort.chunk(&:to_i).all?{|r|r[1].size==1&&!mask[r[0]]}&&p([lv,*b,rv])
    }
    :
    (3..s/cs[i]).any?{|sp|
      (1..sp-1).any?{|lv|
        next if (lv==rv=sp-lv)||rv<lv&&b.size<2
        next if mask[lv]||mask[rv]
        maskn=mask.dup
        maskn[lv]=maskn[rv]=1
        lsn,rsn=[[lv,ls],[rv,rs]].map{|xv,xs|
          xs.each_with_object([t=xv]){|e,xsn|
            break if maskn[t+=e]
            maskn[t]=1
            xsn.push(t)
          }
        }
        next if !lsn||!rsn
        top=lsn[-1]+rsn[-1]
        lsn.push(top)
        rsn.push(top)
        maskn[top]=1
        f[i-1,s-sp*cs[i],[lv,*b,rv],lsn,rsn,maskn]
      }
    }
}
p (minv...maxv).find{|s|
  if n.even?
    f[n/2-1,s,[],[],[],{}]
  else
    1.upto(s/cs[-1]).any?{|c|
      f[n/2-1,s-c*cs[-1],[c],[c],[c],{c=>1}]
    }
  end
}||maxv
