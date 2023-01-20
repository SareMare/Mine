procedure sqeeze(s:string);
begin
  var
    s1:string;
    i,l,d,k:integer;
  k:=1;
  for i:=1 to length(s) do
  begin
    if s[i]=s[i+1] then
    begin
      k:=k+1;//кол-во одинаковых эл-ов
      l:=i;//последний элемент
    end;
  end;
 d:=l-k//первый элемент
 buff:=s[d+1];
 s[d+1]:='('+str(k)+')';
 for i:=1 to (length(s)-1) do
   if s[i]<>s[i+1] then
     s1:=s1+s[i];
  for i:=d+2 to (k-1) do
  begin
    last:=s[i];
    s[i]:=buff;
    buff:=last;
  end;
end;