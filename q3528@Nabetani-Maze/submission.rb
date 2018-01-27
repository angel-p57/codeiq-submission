p->input{
  hnodes="08DFGLOPSW".chars
  vnodes="13568CFKLPRS".chars
  doors=[[1,?7],[0,?E],[1,?G],[0,?A]]
  doors.delete_at(input.ord-97)
  doors.each{|i,c| [hnodes,vnodes][i].push(c) }
  walls=->{
    masks=[0]*36
    (hnodes.map{|s|s.to_i(36)}+(0..6).map{|i|i*6-1}).each{|i|
      masks[i]|=1 if i>=0
      masks[i+1]|=4 if i+1<36
    }
    (vnodes.map{|s|s.to_i(36)}+[*-6..-1,*30..35]).each{|i|
      masks[i]|=2 if i>=0
      masks[i+6]|=8 if i+6<36
    }
    masks
  }[]
  s,g=[1,2].map{|i|input[i].to_i(36)}
  q=[[s,0,nil]]
  c=0
  until q.empty?
    v,x,b=q.shift
    return x if v==g
    4.times{|d|
      next if b&&(d-b).abs==2||walls[v][d]>0
      q.push([v+[1,6,-1,-6][d],x+1,d])
    }
  end
}[gets.chomp]
