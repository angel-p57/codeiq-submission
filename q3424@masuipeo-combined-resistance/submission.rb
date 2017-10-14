ms,mp,msa,mpa,fs,fp,fsa,fpa={},{},{2=>{2r=>1}},{2=>{1r/2=>1}},
  ->n,m{
    memo=(ms[n]||={})[m] and return memo
    addparts=fpa[m].keys
    ms[n][m] = n==m ?
      addparts.each_with_object({}){|k,obj| obj[k]=0 } :
      [m..(n-m)/2,n-m..n-m].each_with_object({}){|range,obj|
        range.each{|k|
          fs[n-m,k].each_key{|r1|
            addparts.each{|r2|
              obj[r1+r2]=1
            }
          }
        }
      }
  },
  ->n,m{
    memo=(mp[n]||={})[m] and return memo
    addparts=fsa[m].keys.map{|r|1/r}
    mp[n][m] = n==m ?
      addparts.each_with_object({}){|k,obj| obj[k]=0 } :
      [m..(n-m)/2,n-m..n-m].each_with_object({}){|range,obj|
        range.each{|k|
          fp[n-m,k].each_key{|r1|
            addparts.each{|r2|
              obj[r1+r2]=1
            }
          }
        }
      }
  },
  ->n{
    memo=msa[n] and return memo
    msa[n]||=(0..n-2).each_with_object({1r*n=>1}){|s,obj|
      (2..(n-s)/2).each{|m|
        fs[n-s,m].each_key{|k|
          obj[k+s]=1
        }
      }
      fs[n-s,n-s].each_key{|k|
        obj[k+s]=1
      } if s>0
    }
  },
  ->n{
    memo=mpa[n] and return memo
    mpa[n]||=(0..n-2).each_with_object({1r/n=>1}){|s,obj|
      (2..(n-s)/2).each{|m|
        fp[n-s,m].each_key{|k|
          obj[1/(k+s)]=1
        }
      }
      fp[n-s,n-s].each_key{|k|
        obj[1/(k+s)]=1
      } if s>0
    }
  }
p ->n{
  (2..n).each_with_object({1r*n=>1}){|i,obj|
    [2..i/2,i..i].each{|range|
      range.each{|j|
        fs[i,j].each_key{|k|
          obj[k+n-i]=1
        }
      }
    }
  }.keys.size
}[gets.to_i]
