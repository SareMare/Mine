program nod_;
type
natur=1..maxint;
procedure NOD(n,m:natur;var r:natur);
begin
  if n=m then
    r:=n
  else if n>m then
    NOD(n-m,m,r)
  else NOD(m-n,n,r);
end;
var
  a,b,nd:natur;
begin
  repeat
  writeln('Введите 2 натуральных числа');
  readln(a,b);
  until (a>0) and (b>0);
  NOD(a,b,nd);
  write('НОД=',nd);
end.