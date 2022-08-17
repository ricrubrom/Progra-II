
Program ProgramaArboles;

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

Begin
  While (l<>Nil) Do
    Begin
      insertar (a,l^.datos);
      l := l^.sig;
    End;
End;

Procedure PreOrden(a:arbol);
Begin
  If a<>Nil Then
    Begin
      write (' ', a^.datos);
      PreOrden (a^.HI);
      PreOrden (a^.HD)
    End;
End;

Procedure EnOrden(a:arbol);
Begin
  If a<>Nil Then
    Begin
      enorden (a^.HI);
      write (' ', a^.datos);
      enorden (a^.HD)
    End;
End;

Procedure PostOrden(a:arbol);
Begin
  If a<>Nil Then
    Begin
      PostOrden(a^.HI);
      PostOrden(a^.HD);
      write (' ', a^.datos);
    End;
End;

Procedure busqueda (n:Integer;Var pos:arbol);
Begin
  If pos=Nil Then
    WriteLn ('El dato indicado no se encuentra en el arbol')
  Else
    If pos^.datos>n Then
      Begin
        pos := pos^.HI;
        busqueda (n, pos)
      End
  Else If pos^.datos<n Then
         Begin
           pos := pos^.HD;
           busqueda (n,pos)
         End;
End;



Var 
  l: lista;
  a: arbol;
  pos: arbol;
  num: Integer;
Begin
  Randomize;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  cargaarbol(a, l);
  writeln();
  //imprimirpornivel(a);
  writeln('PreOrden: ');
  PreOrden(a);
  writeln();
  writeln('EnOrden: ');
  EnOrden(a);
  writeln();
  writeln('PostOrden: ');
  PostOrden(a);
  pos := a;
  writeln();
  write('Ingrese numero: ');
  readln(num);
  busqueda(num, pos);
  If (pos <> Nil)Then
    writeln(pos^.datos)
End.
