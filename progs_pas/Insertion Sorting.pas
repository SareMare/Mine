program Insertion_sorting;

const
  nmax = 99;

type
  mass = array[1..nmax] of integer;

var
  i, j, k, b,n: integer;
  a: mass;

begin
  writeln('Введите количество чисел в массиве');
  readln(n);
  writeln('Введите ', n, ' элементов массива');
  for i := 1 to n do
    read(a[i]);  
  for i := 2 to n do
  begin
    b := a[i];
    j := 1;
    if b > a[j] then
      j := j + 1
    else
    begin
      for k := i - 1 downto j do
        a[k + 1] := a[k];
      a[j] := b;
    end;
  end; 
  for i := 1 to n do
    write(a[i], ' ');
end.