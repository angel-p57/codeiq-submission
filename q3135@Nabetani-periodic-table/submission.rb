puts ->y,x{
  x=x.to_i
  (b={?L=>56,?A=>88}[y])? x<16&&b+x :
  case y=y.to_i
  when 1; {1=>1,18=>2}[x]
  when 2,3; (t=[1,2].tap{|r|r[12,1]=[*3..8]}[x-1])&&t+y*8-14
  when 4,5; y*18+x-54
  when 6,7; (t=[1,2].tap{|r|r[3,1]=[*18..32]}[x-1])&&t+y*32-138||"LA"[y-6]
  else; x<3&&x+118
  end
}[*gets.split(?,)]||?-
