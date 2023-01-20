program Exchange_sorting;

var
  s:string;
  j,i: integer;
  p:char;

begin
  writeln('Введите строку');
  read(s);
  for i:=1 to length(s) do
    for j := length(s) downto 1+i Do
    begin
        p := s[j];
        s[j] := s[j - 1];
        s[j - 1] := p
    end;
  write('Обратная строка: ');
    write(s);
end.