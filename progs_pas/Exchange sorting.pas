program Exchange_sorting;

const
  Nmax = 99;

type
  mass = array[1..Nmax] of integer;

var
  a: mass;
  n, i, j, p: integer;

begin
  writeln('Введите количество чисел в массиве');
  readln(n);
  writeln('Введите ',n,' элементов массива');
  for j := 1 To n Do
    read(a[j]);
  for i := 1 To n Do
    for j := 1 To n - i Do
      if a[j] > a[j + 1] then
      begin
        p := a[j];
        a[j] := a[j + 1];
        a[j + 1] := p
      end;
  write('Отсортированный массив чисел: ');
  for j := 1 to n do
    write(a[j], ' ');
end.