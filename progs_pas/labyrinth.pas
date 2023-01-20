program Labyrinth;
const n = 6;
type charMatrix = array [1..n,1..n] of char;
     intintArr = array of array [1..2] of integer;
var labirint: charMatrix;
    i, j: integer;
    mestaGdeEstHodi: intintArr;
    ch: char;

function solve(labirint:charMatrix; n,i,j:integer; mestaGdeEstHodi:intintArr) : charMatrix;

var vverh, vniz, vlevo, vpravo: boolean;
    temp: intintArr;
    counter, k, len, z,l: integer;
    
begin
  labirint[i][j] := '-';
  for z:= 1 to n do begin
    for l := 1 to n do begin
      write(labirint[z][l]);
    end;
    writeln();
  end;
  writeln();
  counter := 0;
  vverh := False;
  vniz := False;
  vlevo := False;
  vpravo := False;
  
  if mestaGdeEstHodi.Length <> 0 then begin
    if i <> 1 then begin
      if (labirint[i-1][j] <> '#') and (labirint[i-1][j] <> '-')then begin
        counter := counter + 1;
        vverh := True;
      end;
    end;
    if i <> n then begin
      if (labirint[i+1][j] <> '#') and (labirint[i+1][j] <> '-') then begin
        counter := counter + 1;
        vniz := True;
      end;
    end;
    if j <> 1 then begin
      if (labirint [i][j-1] <> '#') and (labirint[i][j-1] <> '-') then begin
        counter := counter + 1;
        vlevo := True;
      end;
    end;
    if j <> n then begin
      if (labirint[i][j+1] <> '#') and (labirint[i][j+1] <> '-') then begin
        counter := counter + 1;
        vpravo := True
      end;
    end;
    if counter > 1 then begin
      temp := copy(mestaGdeEstHodi);
      len := mestaGdeEstHodi.Length;
      mestaGdeEstHodi := nil;
      SetLength(mestaGdeEstHodi,len+1);
      for k := 0 to len-1 do
        mestaGdeEstHodi[k]:=temp[k];
      temp := nil;
      
      if vverh then begin
        i := i - 1;
        mestaGdeEstHodi[len][1] := i;
        mestaGdeEstHodi[len][2] := j;
        solve := solve(labirint, n,i,j,mestaGdeEstHodi); 
      end
      else if vniz then begin
        i := i + 1;
        mestaGdeEstHodi[len][1] := i;
        mestaGdeEstHodi[len][2] := j;
        solve := solve(labirint, n,i,j,mestaGdeEstHodi);
      end
      else if vlevo then begin
        j := j - 1;
        mestaGdeEstHodi[len][1] := i;
        mestaGdeEstHodi[len][2] := j;
        solve := solve(labirint, n,i,j,mestaGdeEstHodi);
      end
      else if vpravo then begin
        j := j + 1;
        mestaGdeEstHodi[len][1] := i;
        mestaGdeEstHodi[len][2] := j;
        solve := solve(labirint, n,i,j,mestaGdeEstHodi);
      end;
  end;
  
  if counter = 1 then begin
    len := mestaGdeEstHodi.Length;
    if vverh then begin
      i := i - 1;
      mestaGdeEstHodi[len-1][1] := i;
      mestaGdeEstHodi[len-1][2] := j;
      solve := solve(labirint, n, i, j, mestaGdeEstHodi);
    end
    else if vniz then begin
      i := i + 1;
      mestaGdeEstHodi[len-1][1] := i;
      mestaGdeEstHodi[len-1][2] := j;
      solve := solve(labirint, n, i, j, mestaGdeEstHodi);
    end
    else if vlevo then begin
      j := j - 1;
      mestaGdeEstHodi[len-1][1] := i;
      mestaGdeEstHodi[len-1][2] := j;
      solve := solve(labirint, n,i,j,mestaGdeEstHodi);
    end
    else if vpravo then begin
      j := j + 1;
      mestaGdeEstHodi[len-1][1] := i;
      mestaGdeEstHodi[len-1][2] := j;
      solve := solve(labirint, n,i,j,mestaGdeEstHodi);
    end;
  end;
  
  if counter = 0 then begin
    solve := labirint;
    if mestaGdeEstHodi.Length <= 1 then begin
      mestaGdeEstHodi := nil;
      solve := labirint;  
      end
    else begin
      temp := copy(mestaGdeEstHodi);
      len := mestaGdeEstHodi.Length;
      mestaGdeEstHodi := nil;
      SetLength(mestaGdeEstHodi, len-1);
      for z := 0 to len-1-1 do begin
        mestaGdeEstHodi[z] := temp[z];
      end;
      temp := nil;
      for k := 0 to mestaGdeEstHodi.Length-1 do begin
        i := mestaGdeEstHodi[k][1];
        j := mestaGdeEstHodi[k][2];
        solve := solve(labirint, n,i,j,mestaGdeEstHodi);
      end;
    end;
  end;
end
else begin
  labirint[i][j] := '-';
  mestaGdeEstHodi := nil;
  solve := labirint;
  end;
end;

begin
  {labirint := [ ['#', '#', '#', '#', '#', '#'],
                [' ', ' ', '#', ' ', ' ', '#'],
                ['#', ' ', ' ', ' ', '#', '#'],
                ['#', ' ', '#', ' ', ' ', '#'],
                ['#', ' ', ' ', '#', ' ', '#'],
                [' ', '#', ' ', '#', '#', '#']];
                
                
               [ [#   # #]
                 [#     #]
                  # #    ]
                  # # # #]
                }
  for i:= 1 to n do begin
    for j := 1 to n do begin
      readln(labirint[i][j]);
    end;
  end;

  for i:= 1 to n do begin
    for j := 1 to n do begin
      write(labirint[i][j]);
    end;
    writeln();
  end;
  writeln();
  i := 2;
  j := 1;
  SetLength(mestaGdeEstHodi, 1);
  mestaGdeEstHodi[0][1] := i;
  mestaGdeEstHodi[0][2] := j;
  

  labirint := solve(labirint, n, i, j, mestaGdeEstHodi);
end.