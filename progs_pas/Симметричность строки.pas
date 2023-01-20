program n12_10;
function sum(s:string;i,j:integer):boolean;
begin
  if (i=j)or(i+1=j) then
    if (s[i]=s[j]) then
      sum:=true
    else if (s[i]=s[j]) then
      sum:=sum(s,i+1,j-1)
    else sum:=false;
end;
begin
  var
    s:string;
    read(s);
  writeln(sum(s,1,5));
end.