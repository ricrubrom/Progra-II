
Program Act1C4M1;

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

  InfoNivel = Record
    num: integer;
    lvl: integer;
  End;
  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = Record
    datos: InfoNivel;
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
IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles }

Procedure ImprimirPorNivel(a: arbol);
Procedure InsertarOrd(Var L:listaNivel; num, lvl: integer);

Var nue, act, ant: listaNivel;
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

Procedure PreOrden(a:arbol; Var L:listaNivel; lvl: integer);
Begin
  If (a <> Nil)Then
    Begin
      InsertarOrd(L, a^.datos, lvl);
      PreOrden(a^.HD, L, lvl + 1);
      PreOrden(a^.HI, L, lvl + 1);
    End;
End;

Var 
  L, aux: listaNivel;
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


Procedure BorrarElemento(Var a:arbol; num: integer; Var encontre: boolean);
Function VerMin(a:arbol; min: integer): integer;
Begin
  If (a <> Nil)Then
    Begin
      min := a^.datos;
      VerMin := VerMin(a^.HI, min)
    End
  Else VerMin := min;
End;

Begin
  If (a = Nil)Then
    encontre := false
  Else
    If (a^.datos > num)Then
      BorrarElemento(a^.HI, num, encontre)
  Else
    If (a^.datos < num)Then
      BorrarElemento(a^.HD, num, encontre)
  Else
    Begin
      encontre := true;
      If (a^.HI = Nil)And(a^.HD <> Nil)Then  //si solo tiene hijo derecho
        Begin
          a^.datos := 
          a^.HD := Nil;
        End
      Else
        Begin
          If (a^.HD = Nil)And(a^.HI <> Nil)Then //si solo tiene hijo izquierdo
            Begin
              a^.datos := 
              a^.HD := Nil;
            End
          Else 
            if(a^.HI <> Nil)and(a^.HD <> Nil)then
            Begin 
              minDer := VerMin(a.HD, 9999);
              a^.datos := minDer;
              BorrarElemento(a^.HD, minDer, resultado);
            End
            else dispose(a);
        End;
    End;

  Var 
    l: lista;
    a: arbol;
    num: integer;
    encontre: boolean;
  Begin
    Randomize;
    crearLista(l);
    writeln ('Lista generada: ');
    imprimirLista(l);
    cargaarbol(a, l);
    writeln();
    imprimirpornivel(a);
    writeln('Inserte valor a borrar: ');
    readln(num);
    BorrarElemento(a, num, encontre);
  End.
