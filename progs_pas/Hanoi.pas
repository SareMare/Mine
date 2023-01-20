program Hanoi_Towers;

procedure move(a{колво дисков}, i1{откуда}, i2{куда}: integer);
begin
  if a <> 1 then move(a - 1, i1, 6 - i1 - i2);
  Writeln('Диск ', a, ' перенести с оси ', i1, ' на ось ', i2);
  if a <> 1 then move(a - 1, 6 - i1 - i2, i2);
end;

var
  n: integer;

begin
  readln(n);
  move(n, 1, 3)
end.