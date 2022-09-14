
Program Actividad2;

Const 
  fin = 0;

Type 
  lista = ^nodo;
  nodo = Record
    datos: integer;
    sig: lista;
  End;

  arbol = ^nodoA;
  nodoA = Record
    datos: integer;
    HI: arbol;
    HD: arbol;
  End;

  datosLista2 = Record
    num: integer;
    lvl: integer;
  End;

  lista2 = ^nodo2;
  nodo2 = Record
    datos: datosLista2;
    sig: lista2;
  End;


Procedure InsertarOrd(Var L:lista; num: integer);

Var nue, act, ant: lista;
Begin
  new(nue);
  nue^.datos := num;
  act := L;
  ant := L;
  While (act <> Nil)And(nue^.datos > act^.datos) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (ant = act)Then L := nue
  Else ant^.sig := nue;
  nue^.sig := act;
End;

Procedure CargarLista(Var l:lista);

Var n: integer;
Begin
  writeln('Inserte numero (la carga finaliza con -1): ');
  n := Random(20);
  While (n <> fin) Do
    Begin
      InsertarOrd(l, n);
      n := Random(20);
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

Procedure ImprimirPorNivel(a: arbol);
Procedure InsertarOrd(Var L:lista2; num, lvl: integer);

Var nue, act, ant: lista2;
Begin
  new(nue);
  nue^.datos.num := num;
  nue^.datos.lvl := lvl;
  act := L;
  ant := L;
  While (act <> Nil)And(nue^.datos.lvl > act^.datos.lvl) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (ant = act)Then L := nue
  Else ant^.sig := nue;
  nue^.sig := act;
End;
Procedure PreOrden(a:arbol; Var L:lista2; lvl: integer);
Begin
  If (a <> Nil)Then
    Begin
      InsertarOrd(L, a^.datos, lvl);
      PreOrden(a^.HD, L, lvl + 1);
      PreOrden(a^.HI, L, lvl + 1);
    End;
End;

Var 
  L, aux: lista2;
  lvlAct: integer;
Begin
  L := Nil;
  PreOrden(a, L, 1);
  While (L <> Nil) Do
    Begin
      writeln();
      lvlAct := L^.datos.lvl;
      write('Nivel ', L^.datos.lvl,': ');
      While (L<>Nil) And (lvlAct = L^.datos.lvl) Do
        Begin
          write(L^.datos.num, '  ');
          aux := L;
          L := L^.sig;
          dispose(aux);
        End;
    End;
End;


Procedure imprimirLista(l: Lista);
Begin
  While (l <> Nil) Do
    Begin
      write(l^.datos, ' - ');
      l := l^.sig;
    End;
End;



Var 
  a: arbol;
  l: lista;

Begin
  Randomize;
  l := Nil;
  CargarLista(l);
  imprimirLista(l);
  cargaarbol(a, l);
  imprimirpornivel(a);
End.
