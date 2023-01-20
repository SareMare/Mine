program n_4;

const
  N = 10;

type
  arr = array[1..N] of integer;

var
  a: arr;
  i: integer;

function max(a: arr; n: integer): integer;
var
  m: integer;
begin
  if n = 1 then 
    max := a[1] 
  else if a[n] > max(a, n - 1) then
    max := a[n] 
  else max := max(a, n - 1);
end;

begin
  randomize;
  for i := 1 to 10 do
  begin
    a[i] := random(100);
    write(a[i]:4);
  end;
  writeln;
  writeln('MAX = ', max(a, N));
  readln;
end.