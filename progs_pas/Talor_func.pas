program Talor_func;
type func=function(t:real):real;
var
  t,e:real;
function f1(t:real):real;
begin
  f1:=-sqr(sqr(cos(t)))/4;
end;
function f2(t:real):real;
begin
  f2:=arctan(t)/2;
end;
function f3(t:real):real;
begin
  f3:=-(2+sqr(t))/(3+sqr(t))
end;
function talor(x:func;a:real;e:real;t:real):real;
var
  i:integer;
s,y:real;
begin
  s:=1;
  i:=1;
  y:=a*x(t)/i;
  while abs(y)>e do
  begin
    s:=s+y;
    i:=i+1;
    y:=y*x(t)*(a-i-1)/i;
  end;    
end;
begin
  writeln('Введите е и t');
  read(e,t);
  if(e>0)and(e<1) then
    writeln(talor(f1,0.25,e,t)+talor(f2,0.2,e,t)*talor(f3,0.11,e,t))
end.