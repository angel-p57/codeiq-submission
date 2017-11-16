n2z=->n{
  s=(n-1).to_s(8)
  f=->d{(d+=1)/4+d/5-d/8*2}
  Complex(*[2,0].map{|r|s.gsub(/./){|c|f[c.to_i+r&7]}.to_i(3)})
}
z2n=->z{
  xa,ya=z.rect.map{|e|return if e<0; e.to_s(3).chars.map(&:to_i)}
  (([0]*ya.size+xa).zip([0]*xa.size+ya).map{|x,y|return if x*y==1;x<y ? 8-x-y : x+y}*"").to_i(8)+1
}
puts ->n{
  z=n2z[n]
  (0..3).map{|r| z2n[z+1i**r] }.compact.sort*?,
}[gets.to_i]
