p ->n{
  # 解
  a=0
  # 遷移前の数の候補数
  s=[0]*(n+1)
  # 遷移後の数のリスト
  d=(0..n).map{|i| j=4*i*(n-i)/n;s[j]+=1;j }
  # 各数の「重み」
  w=(0..n).each_with_object({}){|i,h|h[i]=1}
  # 遷移され得ない数のリスト
  q=(0..n).select{|i|s[i]==0}
  until q.empty?
    # 遷移され得ない数を削除していく
    q=q.each_with_object([]){|i,qn|
      j=d[i]
      # 削除されることで、遷移元がなくなった数は次のループの処理対象となる
      qn.push(j) if 0==s[j]-=1
      # 削除された分の「重み」の委譲
      t=w.delete(i)
      a+=t
      w[j]+=t
    } 
  end
  # この時点で残っている w のキーは全てループに絡むもの
  until w.empty?
    # 起点となるキーは何でも良い
    k,=w.take(1)[0]
    c=v=0
    # ループ検出と除去
    while w[k]
      v+=w.delete(k)
      c+=1
      k=d[k]
    end
    # 「重み」とループ長の積を解に加算
    a+=c*v
  end
  a
}[gets.to_i]
