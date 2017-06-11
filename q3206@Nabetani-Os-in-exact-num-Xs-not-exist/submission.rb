# yhpg E02 の最大のみバージョン、串+尺取り法によるΟ(N^3)
#  see: http://ange1.hateblo.jp/entry/2016/03/06/100805
n,*c=gets.split
puts ->n,w,h,co,cx{
  # o,xに重みを設定し、統一的に扱う ( oは重み1、xは重み沢山 )。oの個数は重みで判定
  # xs: o,xのx座標一覧(端の0,w+1もダミーとして含む)
  # vc: y座標でクラス分けした座標+重みの一覧(下端のh+1分もダミーとして含む、x座標でもソート)
  xs,vc=->{
    k,v={},[]
    [co,cx].zip([1,n+1]).each{|cs,m|
      cs.each{|x,y|
        k[x]=1
        v.push([x,y,m])
      }
    }
    [
      [0,*k.keys.sort,w+1],
      [ *v.sort_by{|r|r[0]+r[1]*w}.chunk{|r|r.delete_at(1)}, [h+1,[]] ]
    ]
  }[]
  Enumerator.new{|y|
    # x座標の左端,右端(共に含まず)のペア毎に条件に適する長方形の探索
    xs.combination(2).each{|xl,xr|
      next if 1>xd=xr-xl-1
      # m: 累積の重み(oの個数に相当)、buf: y座標とxl～xrに収まる重み合計
      m,i,*buf=0,-1,[0,0]
      # 尺取り法
      loop{
        if m>n
          buf.shift
          m-=buf[0][1]
        else
          y<<xd*(buf[-1][0]-buf[0][0]-1) if m==n
          t=vc[i+=1] or break
          m+=buf[-1][1]
          buf.push([t[0],t[1].reduce(0){|s,r|break s if r[0]>=xr;r[0]>xl ? s+r[1] : s}])
        end
      }
    }
  }.max
}[n.to_i,26,26,*c.map{|t|t.split(?,).map{|s|s.bytes.map{|b|b%32}}}]||?-
