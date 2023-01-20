program s;

type
  mas = array[1..100, 1.. 100] of integer;

var
  a: mas;
  i, j, n, m: integer;

begin
  writeln('Введите размеры матрицы n*m: ');
  read(n, m);
  for i := 1 to n do
  begin
    for j := 1 to m do
    begin
      if i mod 2 = 1 then
        a[i, j] := (i - 1) * m + j
      else a[i, j] := i * m - j + 1;
      write(a[i, j]:4);
    end;
    writeln();
  end;
  readln();
end.