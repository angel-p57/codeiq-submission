f=->n{
  return n if n<=9
  n-=9
  dbase,hbase=[1],[1]
  g=->da,ha,d{
    if d==0
      r=ha/da
      x,y=(ha-r*da).divmod(r-1)
      return y==0&&x<=9&&(0==n-=1)&&da+x
    end
    !10.times{|t|
      dan=da+dbase[d]*t
      han=ha+hbase[d]*t
      ru=han/dan
      dmax=dan+dbase[d]-1
      hmax=han+(hbase[d]-1)*3/5
      next if hmax>dmax*ru
      ret=g[dan,han,d-1] and return ret
    }
  }
  1.step{|d|
    dbase.push(dbase[d-1]*10)
    hbase.push(hbase[d-1]*16)
    ru=hbase[d]/dbase[d]
    1.upto(9){|t|
      dmax=(t+1)*dbase[d]-1
      hmax=((t*5+3)*hbase[d]-3)/5
      break if hmax>dmax*ru
      ret=g[t*dbase[d],t*hbase[d],d-1] and return ret
    }
  }
}
p f[100]
