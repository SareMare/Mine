program Matrixes;

const
  n = 3;

type
  matrix = array[1..n, 1..n] of integer;

var
  c, a, b: matrix;
  i, j, k: integer;

begin
  writeln('Введите матрицу А');
  for i := 1 to n do
    for j := 1 to n do
      readln(a[i, j]);
  writeln('Введите матрицу В');
  for i := 1 to n do
    for j := 1 to n do
      readln(b[i, j]);
  writeln('Матрица A:');
  for i := 1 to n do
  begin
    for j := 1 to n do
      write(a[i, j]:4);
    writeln
  end;
  writeln('Матрица B:');
  for i := 1 to n do
  begin
    for j := 1 to n do
      write(b[i, j]:4);
    writeln
  end;
  for i := 1 to n do
    for j := 1 to n do
    begin
      c[i, j] := 0;
      for k := 1 to n do
        c[i, j] := c[i, j] + a[i, k] * b[k, j];
    end;
  writeln('Матрица С=A*B:');
  for i := 1 to n do
  begin
    for j := 1 to n do
      write(c[i, j]:4);
    writeln;
  end;
end.