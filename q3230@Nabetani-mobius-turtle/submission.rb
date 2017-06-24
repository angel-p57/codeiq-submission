puts "%d%c"%gets.chars.each_with_object([1i,2]){|c,r|
  case c
  when /\d/; r[0]+=r[1]*c.to_i
  when ?R; r[1]*=-1i
  when ?L; r[1]*=1i
  when ?B; r.map!(&:conj)
  end
}[0].rect.tap{|y,x|break [y%64/2+1,((x+y[6]*10)%20/2-5)%37+65]}
