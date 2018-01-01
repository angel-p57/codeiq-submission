# the code generator of "another.bf"
f=->c,g{
  s=[24,18,28,22][c.ord-97]
  hnodes="08DFGLOPSW".chars
  vnodes="13568CFKLPRS".chars
  doors=[[1,?7],[0,?E],[1,?G],[0,?A]]
  doors.delete_at(c.ord-97)
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
  q=[[s,[],nil]]
  c=0
  until q.empty?
    v,x,b=q.shift
    return x if v==g
    4.times{|d|
      next if b&&(d-b).abs==2||walls[v][d]>0
      q.push([v+[1,6,-1,-6][d],x.dup.push(d),d])
    }
  end
}
part="abcd".each_char.with_object({}){|c,h|
  s=(0..35).map{|i|
    path=f[c,35-i]
    t=path.reduce("->> *#{(35-i).to_s(36).upcase}:#{path*''}* "){|a,j|
      a+?+*j+">>>"
    }+?-+?<*(path.size*3)
    i==0 ? "    > "+t+" <<" : "  <]>["+t+" <<]"
  }*?\n
  h[c]=<<_EOS_+s+<<_EOS_
 * sliding loop ( 2 times )
 >>,<++[-
  * parse one char and convert to a path expression of the node
  >>++++++[-<-------->]+<[-[-[-[-[-[-[-[-[-[--------[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-[-
_EOS_

 <<[->+<]>>,<]<<
_EOS_
}
puts <<_EOS_
* detect the opened gate and switch
,[>[->>]<[>+++>]<<-]+>[-[-[-
 * gate "a" is open
 <->
#{part["a"]}]<[->
 * gate "b" is open
#{part["b"]}<]>]<[->
 * gate "c" is open
#{part["c"]}<]>]<[->
 * gate "d" is open
#{part["d"]}<]
* clear a newline or eof
>>>>+[-]
* loop for searching a forked point or an end of the paths
+[
 >+>+[
  * not the end in the path of the goal node
  <[
   * not the end in the path of the start node
   [->-<]
   >[
    * detect a forked point ( stop this loop )
    ++++<+<-
   ]
   <<[-
    * not a forked point ( slide and continue this loop )
    >>>+<<
   ]
  ]
  >[<<-<]
 ]
 <<[-<<<]
>>>]
* count the distance between the forked point and the end of the path of the goal node
>->[>>>+]<<<[[-]>[-<<<+>>>]<<<+<]
* count and add the distance between the forked point and the end of the path of start node
>>+[[-]<[->>>+<<<]>>>+>+]
* print as decimal
<+[>[+>>>]<[>--------->+>]<<<-]
->+++++++++>-[>]
<+[-
 >++++++[-<++++++++>]
 <.[-]
<+]
* print a newline
++++++++++.
_EOS_
