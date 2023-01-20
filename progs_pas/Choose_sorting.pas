program Choose_sorting;

const
  nmax = 99;

type
  mass = array[1..nmax] of integer;

var
  a: mass;    
  i, j, n, nmin, buf: integer;

begin
  writeln('Введите количество чисел в массиве');
  readln(n);
  writeln('Введите ', n, ' элементов массива');    
  for i := 1 to n do read(a[i]);   
  for i := 1 to n - 1 do
  begin
    nmin := i;        
    for j := i + 1 to n do                       
      if a[j] < a[nmin] then nmin := j;            
    buf := a[i];                              
    a[i] := a[nmin];                        
    a[nmin] := buf;                   
  end;        
  write('Отсортированный массив чисел: ');        
  for i := 1 to n do
    write(a[i], ' ');
end.