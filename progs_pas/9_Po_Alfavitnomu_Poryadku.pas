program alfavit;

const
  N = 5;

var
  str: array[1..N] of string[20];
  s: string[20];
  i, j: integer;

begin
  writeln('Введите ', N, ' строк');
  for i := 1 to N do 
    readln(str[i]); 
  
  for i := 1 to N - 1 do
    for j := 1 to N - i do
      if str[j][1] > str[j + 1][1] then begin
        s := str[j];
        str[j] := str[j + 1];
        str[j + 1] := s;
      end;
  
  writeln;
  for i := 1 to N do 
    write(str[i], ' ');
  writeln;
end.