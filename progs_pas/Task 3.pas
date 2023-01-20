program n3;

var
  e, s, z: real;
  i: integer;

begin
  readln(e);
  if (e > 0) and (e < 1) then begin
    s := 1;
    i := 0;
    z := 1;
    while abs(z) > e do
    begin
      z := z * (-1) * 2 / (i * (i + 1));
      i := i + 1;
      s := s + z;
    end;
    writeln(s);
  end
  else writeln('Wrong E');
end.