# その階層の開始番号
fstart=->t{
  (12<<t)-t*12-10
}
# その階層の1辺の大きさ ( 片方の端除く )
fsize=->t{
  (3<<t)-3
}
# 数字→階層,オフセットのペア
# ※階層の最初の数字はオフセット1、最後の数字がオフセット0
fn2c=->n{
  b=(n+10)/12
  t=(b+b.bit_length).bit_length-1
  l=fsize[t]
  [t,(n-fstart[t]+1)%(l*4)]
}
# 階層,オフセットのペア→数字、オフセットは mod で扱う
fc2n=->t,i{
  t<1 ? 1 : fstart[t]+(i-1)%(fsize[t]*4)
}
puts->n{
  return "2,3,5,6,8,9,11,12" if n<2
  t,i=fn2c[n]
  # 同一階層
  ret=[-1,1].map{|d| fc2n[t,i+d] }
  a,j=i.divmod(fsize[t])
  # 外層 ( 共通 )
  ret.push(*[0,1].map{|d| fc2n[t+1,i*2+a*3+d+1] })
  # もう1組の外層 ( 角の場合 )、或いは内装
  ret.push(*j==0 ? [0,1].map{|d| fc2n[t+1,i*2+a*3+d-2] } : fc2n[t-1,(i-a*3-1)/2])
  ret.sort*?,
}[gets.to_i]
