program Bi_quadrat;

var
  x1, x2, x3, x4, d, a, b, c, t1, t2: real;

begin
  writeln('Введите числа a,b,c для уравнения вида ax^4+bx^2+c=0');
  readln(a, b, c);
  if a <> 0 then
  begin
    d := b * b - 4 * a * c;
    if d < 0 then
      writeln('Дискриминант меньше 0 => нет действительных корней');
    if d = 0 then
    begin
      t1 := -b / (2 * a);
      if t1 < 0 then
        writeln('Нет действительных корней')
      else
      begin
        x1 := sqrt(t1);
        x2 := -sqrt(t1);
      end;
      writeln('Действительные корни: ', x1, ' ', x2);
    end;
    if d > 0 then
    begin
      t1 := (-b + sqrt(d)) / (2 * a);
      t2 := (-b - sqrt(d)) / (2 * a);
      if (t1 < 0) and (t2 < 0) then
        writeln('Нет действительных корней');
      if (t1 > 0) and (t2 < 0) then
      begin
        x1 := sqrt(t1);
        x2 := -sqrt(t1);
        writeln('Действительные корни: ', x1, ' ', x2);
      end;
      if (t1 < 0) and (t2 > 0) then
      begin
        x1 := sqrt(t2);
        x2 := -sqrt(t2);
        writeln('Действительные корни: ', ' ', x1, ' ', x2);
      end;
      if (t1 > 0) and (t2 > 0) then
      begin
        x1 := sqrt(t1);
        x2 := -sqrt(t1);
        x3 := sqrt(t2);
        x4 := -sqrt(t2);
        writeln('Действительные корни: ', x1, ' ', x2, ' ', x3, ' ', x4);
      end;
    end;
  end
  else
    writeln('Невозможно решить, т.к. a=0');
end.