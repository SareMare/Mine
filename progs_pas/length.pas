program n_2;

const
  q = 8;

procedure strok(numb: string; s: string);
var
  i: integer;
begin
  for i := 3 to q do
  begin
    s := s + numb[i];
  end;
end;

var
  s, numb: string;

begin
  readln(numb);
  strok(numb, s);
  writeln(s);
end.
