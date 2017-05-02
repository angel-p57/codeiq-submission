require 'prime'
p ->m,n{
  fs=(0..9).map{|i|
    Fiber.new{
      Enumerator.new{|y|
        b=[]
        while r=Fiber.yield
          b.push(r)
          b.shift until r[0]-b[0][0]<140
          y<<r[1]-b[0][1]+i
        end
      }.max||0
    }.tap(&:resume)
  }
  j=s=0
  Prime.each(n){|q|
    q<m or Enumerator.new{|y|
      y<<(q,=q.divmod(10))[1] while q>0
    }.reverse_each{|e|
      fs[e].resume([j+=1,s+=e])
    }
  }
  fs.map(&:resume).max
}[*gets.split.map(&:to_i)]
