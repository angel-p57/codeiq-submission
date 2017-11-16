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
__END__

0+0i 0
1+0i 1
2+0i 2
2+1i 3
2+2i 4
1+2i 5 2
0+2i 6 4
0+1i 7 6

x+y+(x<y?

re
6,7,0: 0  0,1,2:0
1,5  : 1  3,7  :1
2,3,4: 2  4,5,6:2

(d+1&7)/3-1[d-5]

im
0,1,2: 0
3,7  : 1
4,5,6: 2

e/3+e/4-e/7

1,2,3: 0
4,8  : 1
5,6,7: 2

e/4+e/5-e/8



