p ->n{
  maxv=3**(n-1)
  return maxv if n<3
  cs=[t=1,*(1..(n-1)/2).map{|e|t=t*(n-e)/e}]
  csa=((t=0)...n/2).map{|i|2*t+=cs[i]}
  csm=[t=1,*(1...(n-1)/2).map{|i|t+=2*csa[i]-cs[i]*3}]
  f=->i,s,b,ls,rs,minc,mask{
    if i==0
      return if maxv<=s+1
      lmask=ls.reverse.reduce(0){|s,e|(s|1)<< e}|1
      rmask=rs.reverse.reduce(0){|s,e|(s|1)<< e}|1
      (1...maxv-s).each{|sa|
        lmt=lmask
        rmt=rmask<<sa
        0.upto(sa){|lv|
          if lmt&rmt==0 && lmt&mask==0 && rmt&mask==0
            maxv=s+sa
            return
          end
          lmt<<=1
          rmt>>=1
        }
      }
    else
      lmask=ls.reverse.reduce(0){|s,e|(s|1)<< e}|1
      rmask=rs.reverse.reduce(0){|s,e|(s|1)<< e}|1
      sa=0
      while maxv>s+csm[i-1]+cs[i]*sa+=1
        lmt=lmask
        rmt=rmask<<sa
        0.upto(b.size<2?sa/2:sa){|lv|
          if lmt&rmt==0 && lmt&mask==0 && rmt&mask==0
            lsn=[t=lv+minc,*ls.map{|e|t+=e}]
            rsn=[t=sa-lv+minc,*rs.map{|e|t+=e}]
            top=lsn[-1]+rsn[-1]
            lsn.push(top)
            rsn.push(top)
            maskn=mask|lmt|rmt|1<<(top-minc)
            mincn=minc
            off=0
            if maskn[0]>0
              off=(maskn^(maskn+1)).bit_length-1
              maskn>>=off
              mincn+=off
            end
            f[i-1,s+sa*cs[i]+csa[i-1]*off,[lv+minc,*b,sa-lv+minc],lsn,rsn,mincn,maskn]
            return if maxv<=s+csm[i-1]+cs[i]*sa
          end
          lmt<<=1
          rmt>>=1
        }
      end
    end
  }
  if n.even?
    f[n/2-1,2**(n-1),[],[],[],1,0]
  else
    f[n/2-1,2**n-cs[-1],[1],[1],[1],2,0]
    c=1
    while maxv>csm[-1]+t=2**(n-1)+cs[-1]*c
      c+=1
      f[n/2-1,t,[c],[c],[c],1,1<<c-1]
    end
  end
  maxv
}[gets.to_i]
