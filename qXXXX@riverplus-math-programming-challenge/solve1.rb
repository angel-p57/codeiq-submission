# 1/(w+h)Cw・Σ[i=1,h] (m-1+i-1)C(m-1)・(w-m+1+h-i)C(w-m+1)
# = w!h!/(w+h)!・Σ[i=1,h] (m-1+i-1)!/(i-1)!(m-1)!・(w-m+1+h-i)!/(h-i)!(w-m+1)!
# = w!h!/(w+h)!(m-1)!(w-m+1)!・Σ[i=1,h] (m-1+i-1)!/(i-1)!・(w-m+1+h-i)!/(h-i)!
# = w!h!/(w+h)!m'!(w-m')!・Σ[j=0,h'] (m'+j)Pm'・(w-m'+h'-j)P(w-m')
m,g=[1],->k{m[k]||=g[k-1]*k}
f=->w,h,m{
  d=g[w+h]/(g[w]*g[h])*g[m-=1]*g[w-m]
  (1..h-=1).reduce((t1=g[m])*(t2=g[w-m+h]/g[h])){|s,j|
    s+(t1=t1*(m+j)/j)*(t2=t2*(h-j+1)/(w-m+h-j+1))
  }.to_f/d
}
puts "%.7f"%f[10,10,3]
