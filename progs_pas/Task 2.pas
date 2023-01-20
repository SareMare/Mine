program n2;

var
  x, s, z: real;
  i, fac: integer;

begin
  readln(x);
  fac := 1;
  s := x;
  z := x;
  for i := 3 to 11 do
  begin
    if i mod 2 = 1 then begin
      z := z * x * x * (-1) / ((i + 1) * (i + 2));
      s := s + z;
    end;
  end;
  writeln(s);
end.
