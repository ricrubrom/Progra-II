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

  InfoNivel = record
    num: integer;
    lvl: integer;
  end;
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

Procedure EnOrden (a:arbol);
Begin
  If a<>Nil Then
    Begin
      EnOrden (a^.HI);
      write (' ', a^.datos);
      EnOrden (a^.HD)
    End;
End;

Procedure VerValoresEnRango(a: arbol; sup, inf: integer);
begin
  if(a <> nil)then
    begin
      if(a^.datos >= inf)and(a^.datos <= sup)then begin
        write(a^.datos, ' | ');
        VerValoresEnRango(a^.HI, sup, inf);
        VerValoresEnRango(a^.HD, sup, inf);
      end;
      if(a^.datos < inf)then 
        VerValoresEnRango(a^.HD, sup, inf);
      If (a^.datos > sup)Then
        VerValoresEnRango(a^.HI, sup, inf);
    end;
end;

Var 
  l: lista;
  a: arbol;
  inf, sup: integer;
Begin
  Randomize;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  cargaarbol(a, l);
  writeln();
  //imprimirpornivel(a);
  EnOrden(a);
  writeln();
  writeln('Ingrese valor inferior del rango: '); readln(inf);
  writeln('Ingrese valor superior del rango: '); readln(sup);
  write('Valores dentro del rango: ');
  VerValoresEnRango(a, sup, inf);
End.
