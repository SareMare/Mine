﻿Program OPZ;
const
oper1=['+','-'];
oper2=['*','/'];
symbol=['a'..'z','A'..'Z','0'..'9','.'];
var
sym :char;
so,si :string;
p :word;
procedure getsym;
begin
while (p<=length(si))and(si[p] in [#32, #9]) do
inc(p);
if p>length(si) then
sym:=#0
else
begin
sym:=si[p];
inc(p)
end;
end;
procedure expression;
forward;
procedure get_var;
begin
so:=so+#32;
while sym in symbol do
begin
so:=so+sym;
getsym
end
end;
procedure term;
var a:char;
begin
if sym='(' then
begin
getsym;
expression;
getsym
end
else
get_var;
while sym in oper2 do
begin
a:=sym;
getsym;
term;
so:=so+a
end
end;
procedure expression;
var a:char;
begin
if sym='+' then
getsym
else if sym='-' then
begin
a:='-';getsym
end
else
a:=#32;
term;
if a='-' then so:=so+' (-)';
while sym in oper1 do
begin
a:=sym;
getsym;
term;
so:=so+a
end
end;
begin
readln(si);
so:=#32;
p:=1;
getsym;
expression;
writeln(so);
readln;
end.