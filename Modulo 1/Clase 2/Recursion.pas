program Recursion;

var 
  num, maximo: integer;

procedure digitoMaximo(n: integer; max: integer);
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo(n, max);
  writeln('max: ', max);
end;

Function digitoMaximo2(n: integer; max: integer):real;
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then
    digitoMaximo2 := digitoMaximo2(n, max)
  else
    digitoMaximo2 := max;
  writeln('max: ', max);
end;

Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  //digitoMaximo (num, maximo);
  //writeln ( 'El digito maximo del numero ', num, ' es: ', maximo);
  writeln ( 'El digito maximo del numero ', num, ' es: ', digitoMaximo2(num, maximo):2:2);
End.

