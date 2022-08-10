program CalculoDeFactorial;

Function factorial(num:integer):real;
begin
  if(num = 1)then
    factorial:=1
  else
    factorial := num * factorial(num - 1);
end;


{PROGRAMA PRINCIPAL}
var 
  num: integer;
Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num):2:2);
  readln;
End.