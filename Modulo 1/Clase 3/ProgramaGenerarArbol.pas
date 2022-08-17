
Program ProgramaGenerarArbol;

Type 
  // Lista de enteros
  lista = ^nodoL;
  nodoL = Record
    datos: integer;
    sig: lista;
  End;

  // Arbol de enteros
  arbol = ^nodoA;
  nodoA = Record
    datos: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = Record
    info: arbol;
    sig: listaNivel;
  End;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(Var l: Lista; nro: integer);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.datos := nro;
  aux^.sig := l;
  l := aux;
End;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con n�meros aleatorios }
Procedure crearLista(Var l: Lista);

Var 
  n: integer;
Begin
  l := Nil;
  n := random (20);
  While (n <> 0) Do
    Begin
      agregarAdelante(L, n);
      n := random (20);
    End;
End;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
Procedure imprimirLista(l: Lista);
Begin
  While (l <> Nil) Do
    Begin
      write(l^.datos, ' - ');
      l := l^.sig;
    End;
End;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

Function ContarElementos (l: listaNivel): integer;

Var c: integer;
Begin
  c := 0;
  While (l <> Nil) Do
    Begin
      c := c+1;
      l := l^.sig;
    End;
  contarElementos := c;
End;


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atr�s en l}

Procedure AgregarAtras (Var l, ult: listaNivel; a:arbol);

Var nue: listaNivel;

Begin
  new (nue);
  nue^.info := a;
  nue^.sig := Nil;
  If l= Nil Then l := nue
  Else ult^.sig := nue;
  ult := nue;
End;


{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles }

Procedure imprimirpornivel(a: arbol);

Var 
  l, aux, ult: listaNivel;
  nivel, cant, i: integer;
Begin
  l := Nil;
  If (a <> Nil)Then
    Begin
      nivel := 0;
      agregarAtras (l,ult,a);
      While (l<> Nil) Do
        Begin
          nivel := nivel + 1;
          cant := contarElementos(l);
          write ('Nivel ', nivel, ': ');
          For i:= 1 To cant Do
            Begin
              write (l^.info^.datos, ' - ');
              If (l^.info^.HI <> Nil) Then agregarAtras (l,ult,l^.info^.HI);
              If (l^.info^.HD <> Nil) Then agregarAtras (l,ult,l^.info^.HD);
              aux := l;
              l := l^.sig;
              dispose (aux);
            End;
          writeln;
        End;
    End;
End;

Procedure cargaarbol (Var a:arbol; l:lista);
Procedure insertar (Var a:arbol; n:integer);
Begin
  If a = Nil Then
    Begin
      new (a);
      a^.datos := n;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If a^.datos>n Then insertar (a^.HI,n)
  Else If a^.datos<n Then insertar (a^.HD,n)
End;

Var n: Integer;

Begin
  While (l<>Nil) Do
    Begin
      insertar (a,l^.datos);
      l := l^.sig;
    End;
End;

Var 
  l: lista;
  a: arbol;
Begin
  Randomize;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  cargaarbol(a, l);
  writeln();
  imprimirpornivel(a);
End.
