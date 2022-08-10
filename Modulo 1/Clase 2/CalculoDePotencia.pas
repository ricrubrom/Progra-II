program CalculoDePotencia;

Function potencia2(x, n:integer):real;
begin
  if(n = 0)then
    potencia2 := 1
  else
    potencia2 := x * potencia2(x, n-1);
end;

{PROGRAMA PRINCIPAL}
var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
     writeln(potencia2(x, n):2:2);
end.