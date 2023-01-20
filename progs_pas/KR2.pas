program n_2;
const
n=100;
type
mass=array[1..n] of char;
var
  s:mass;
  r,i,max,min:integer;
begin
  min:=1000;
  writeln('Введите кол-во символов');
  readln(r);
  writeln('Введите строку');
  for i:=1 to r do
    read(s[i]);
  for i:=1 to r do
  begin
    if s[i] = ',' then
    begin
      max:=i;
      if i<min then
        min:=i;
    end;
   end;
   writeln('Первое вхождение запятой - ',min,', Последнее вхождение запятой - ',max);
end.