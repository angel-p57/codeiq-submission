p ->n{
  a=0
  (all=[*0..9]).combination(4){|c3|
    d10p=c3.reduce(&:+)*7
    w1=c3.permutation.with_object([0]*11){|p3,obj|obj[(p3[0]*3+p3[1]*5+p3[2]*7+p3[3]*9)%11]+=1}
    r=all-c3
    r.combination(4){|c1|
      d10=(d10p-c1.reduce(&:+))%10
      next if d10!=n
      w2=c1.permutation.with_object([0]*11){|p1,obj|obj[(p1[0]*2+p1[1]*4+p1[2]*6+p1[3]*8)%11]+=1}
      11.times{|i| a+=w1[i]*w2[(n-4-i)%11] }
    }
  }
  a
}[gets.to_i]
