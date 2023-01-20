program idz11;

type
  storage = record
    name: string;
    weight: real;
    amount: integer;
    ordered: boolean;
  end;
  Details = array of storage;


procedure InputElements(var ar: Details);
var
  i, n: integer;
begin
  repeat
    write('Кол-во разных деталей(n>0): ');
    readln(n);
  until (n > 0);
  SetLength(ar, n);
  for i := 0 to n - 1 do
    with ar[i] do
    begin
      WriteLn;
      Write('Название(Буквы и цифры): '); ReadLn(name);
      while((name = '') or (name = ' ')) do
      begin
        Write('Неверное имя, введите снова: '); ReadLn(name);
      end;
      Write('Вес(Вещественное число): '); ReadLn(weight);
      while(weight <= 0) do
      begin
        Write('Отрицательный или нулевой вес, введите снова: '); ReadLn(weight);
      end;
      Write('Кол-во(Целое число): '); ReadLn(amount);
      while(amount < 0) do
      begin
        Write('Количество отрицательное, введите снова: '); ReadLn(amount);
      end;
      Write('Статус заказа(True - да/False - нет): '); ReadLn(ordered); 
    end;
end;


function GetRequiringAmount(const ar: Details): integer;
var
  Res: integer;
  i: integer;
begin
  Res := 0;
  for i := 0 to Length(ar) - 1 do
  begin
    if((ar[i].weight >= 10) and (ar[i].weight <= 50)) then
      Inc(Res, ar[i].amount);
  end;
  GetRequiringAmount := Res;
end;


procedure PrintMissing(const ar: Details);
var
  i: integer;
begin
  WriteLn; 
  WriteLn('Список отсутствующих деталей: ');
  for i := 0 to Length(ar) - 1 do
    with ar[i] do
      if (amount = 0) then
        WriteLn('Название: ', name,'; Вес: ', weight);
  WriteLn; WriteLn;
end;

var
  a: Details;

begin
  InputElements(a);
  WriteLn;
  WriteLn('Кол-во деталей весом от 10 до 50 кг: ', GetRequiringAmount(a));
  PrintMissing(a);
end.