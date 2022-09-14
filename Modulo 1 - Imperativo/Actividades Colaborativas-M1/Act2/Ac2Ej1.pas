
Program Ac2Ej1;

Const 
  fin = 1850;
  sup = 1800;
  inf = 1900;

Type 

  cadena30 = string[30];

  InfoArbol = Record
    Code: integer;
    Nom : cadena30;
    cant: Integer;
  End;

  arbol = ^NodoA;

  NodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;



Procedure insertarArbol(Var a:arbol; R:InfoArbol);
Begin
  If a = Nil Then
    Begin
      new (a);
      a^.datos := R;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If a^.datos.code>R.code Then insertarArbol (a^.HI, R)
  Else If a^.datos.code<R.code Then insertarArbol (a^.HD, R)
  Else a^.datos.cant := a^.datos.cant + 1;
End;


Procedure CargarArbol(Var a: arbol);
Procedure CargarRegistro(Var R:InfoArbol);
Begin
  R.code := random(200)+1750;
  If (R.code <> fin)Then
    Begin
      writeln('Inserte Nombre de Ciudad: ');
      readln(R.nom);
      R.cant := 1;
    End;
End;

Var 
  R: InfoArbol;
Begin
  CargarRegistro(R);
  While (R.code <> fin) Do
    Begin
      InsertarArbol(a, R);
      CargarRegistro(R);
    End;
End;


Procedure VerValoresEnRango(a: arbol; inf, sup: integer);

Procedure ImprimirReg (n:InfoArbol);
Begin
  WriteLn('Codigo Postal: ', n.Code);
  WriteLn('Nombre: ', n.Nom);
  WriteLn('Cantidad: ', n.Cant);
  writeln()
End;

Begin
  If (a <> Nil)Then
    Begin
      If (a^.datos.code >= inf)And(a^.datos.code <= sup)Then
        Begin
          ImprimirReg(a^.datos);
          VerValoresEnRango(a^.HI, sup, inf);
          VerValoresEnRango(a^.HD, sup, inf);
        End;
      If (a^.datos.code < inf)Then
        VerValoresEnRango(a^.HD, sup, inf);
      If (a^.datos.code > sup)Then
        VerValoresEnRango(a^.HI, sup, inf);
    End;
End;



Var 
  a: arbol;
Begin
  randomize;
  CargarArbol(a);
  VerValoresEnRango(a,inf,sup);
End.
