
Program Recursion;

Var 
  num, maximo: integer;

Procedure digitoMaximo(n: integer; max: integer);

Var 
  dig: integer;
Begin
  dig := n Mod 10;
  If ( dig > max ) Then
    max := dig;
  n := n Div 10;
  If (n <> 0) Then
    digitoMaximo(n, max);
  writeln('max: ', max);
End;

Function digitoMaximo2(n: integer; max: integer): real;

Var 
  dig: integer;
Begin
  dig := n Mod 10;
  If ( dig > max ) Then
    max := dig;
  n := n Div 10;
  If (n <> 0) Then
    digitoMaximo2 := digitoMaximo2(n, max)
  Else
    digitoMaximo2 := max;
  writeln('max: ', max);
End;

Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  //digitoMaximo (num, maximo);
  //writeln ( 'El digito maximo del numero ', num, ' es: ', maximo);
  writeln ( 'El digito maximo del numero ', num, ' es: ', digitoMaximo2(num, maximo): 2: 2);
End.
