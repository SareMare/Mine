program idz_3;

const
  max = 16;

var
  tabl: array [1..max, 1..max] of byte;
  nom: array[1..max] of byte;
  n, m, i, j, k, pb, pr: byte;
  f: boolean;

begin
  repeat
    write('Введите число команд не более ', max, ' n=');
    readln(n);
  until n in [1..max];
  randomize;
  for i := 1 to n do
    for j := 1 to n do
      if j > i then tabl[i, j] := random(3);
  for i := 1 to n do
    for j := 1 to n do
    begin
      if j < i then tabl[i, j] := 2 - tabl[j, i];
      if i = j then tabl[i, j] := 0;
    end;
  Writeln('Таблица:');
  k := 0;
  m := 0;
  f := false;
  for i := 1 to n do
  begin
    pb := 0; pr := 0;
    for j := 1 to n do
    begin
      if tabl[i, j] = 2 then pb := pb + 1;
      if (tabl[i, j] = 0) and (i <> j) then pr := pr + 1;
      if j <> i then write(tabl[i, j]:4)
      else write(#178:4);
    end;
    if pb > pr then k := k + 1;
    if pr = 0 then
    begin
      m := m + 1;
      nom[m] := i;
    end;
    if pb > (n - 1) div 2 then f := true;
    write('  поб=', pb, ' пор.=', pr);
    writeln;
  end;
  writeln;
  writeln('Количество команд, у которых побед больше чем поражений=', k);
  writeln;
  writeln('Номера команд без поражений:');
  if m = 0 then writeln('Таких команд нет')
  else
    for i := 1 to m do
      write(nom[i], ' ');
  writeln;
  if f then write('Имеются команды, выигравшие более половины игр')
  else write('Команд, выигравших более половины игр нет');
end.