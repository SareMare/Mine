program rimskiye;

function RomanToInteger(R: String): Integer;
const
  sRoman  = 'IVXLCDM';
  iDigits: array [1..7] of Integer = (1, 5, 10, 50, 100, 500, 1000);
var
  Ri, i, iPred: Byte;
  Res: Integer;
begin
  Res := 0;
  
  Ri := Length(R);
  iPred := 0;
  while Ri > 0 do
  begin
    i := Pos(R[Ri], sRoman);
    if i < iPred then
      Dec(Res, iDigits[i])
    else
      Inc(Res, iDigits[i]);
    iPred := i;
    
    Ri -= 1;
  end;
  
  RomanToInteger := Res;
end;

function IntegerToRoman(N: Integer): String;
type
  tDigit = record
    R: String[10];
    S: Integer;
  end;
const
  Digits: array [1..28] of tDigit = ((R: 'I'; S: 1), (R: 'II'; S: 2),
    (R: 'III'; S: 3), (R: 'IV'; S: 4), (R: 'V'; S: 5), (R: 'VI'; S: 6),
    (R: 'VII'; S: 7), (R: 'VIII'; S: 8), (R: 'IX'; S: 9), (R: 'X'; S: 10),
    (R: 'XX'; S: 20), (R: 'XXX'; S: 30), (R: 'XL'; S: 40), (R: 'L'; S: 50),
    (R: 'LX'; S: 60), (R: 'LXX'; S: 70), (R: 'LXXX'; S: 80), (R: 'XC'; S: 90),
    (R: 'C'; S: 100), (R: 'CC'; S: 200), (R: 'CCC'; S: 300), (R: 'CD'; S: 400),
    (R: 'D'; S: 500), (R: 'DC'; S: 600), (R: 'DCC'; S: 700), (R: 'DCCC'; S: 800),
    (R: 'CM'; S: 900), (R: 'M'; S: 1000));
var
  i: Integer;
  Res: String;
begin
  Res := '';
  i := 28;
  while N > 0 do
  begin
    if N >= Digits[i].S then
    begin
      Dec(N, Digits[i].S);
      Res := Res + Digits[i].R;
    end
    else
      i -= 1;
  end;
  
  IntegerToRoman := Res;
end;

var
  S: String;

begin
  readln(s);
  WriteLn(S);
  WriteLn(RomanToInteger(S));
  WriteLn(IntegerToRoman(RomanToInteger(S)));
  if S <> IntegerToRoman(RomanToInteger(S)) then
    Write('Не ');
  WriteLn('правильная запись');
end.