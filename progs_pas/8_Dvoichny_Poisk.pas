program dvoivhny;

const
  n = 4;

var
  a: array[1..n] of integer;
  p, l, m, i: integer;
  r: 0..n;

begin
  for i := 1 to n do
    read(a[i]);
  writeln;
  read(p);
  
  l := 1;
  r := n;
  while l <= r do
  begin
    m := l + (r - l) div 2;
    if p < a[m] then r := m - 1
    else if p > a[m] then l := m + 1 else
    begin
      writeln('Номер элемента: ', m);
      exit;
    end;
  end;
  writeln('Элемент не найден')
end.