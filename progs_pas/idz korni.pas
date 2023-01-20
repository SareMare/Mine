program e10_4;

var
  s, e: real;
  n: integer;

begin
  e := 1 / 10000;
  s := sqrt(6);
  n := 1;
  while (s > 3 + e) or (s < 3 - e) do
  begin
    s := sqrt(6 + s);
    n := n + 1;
  end;
  writeln(n);
end.