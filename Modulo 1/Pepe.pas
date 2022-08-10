Program pepe;
Procedure imprimir(Var n:integer;m:integer);
Begin
  If (m>0)Then
    Begin
      n := n-1;
      m := m - 1;
      imprimir(n,m);
      writeln(n);
      writeln(m);
    End;
End;

Var 
  n, m: integer;
Begin
  n := 3;
  m := 3;
  imprimir(n,m);
  writeln(n);
  writeln(m);
End.