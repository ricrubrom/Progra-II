
Program ActC4Ex;

Const 
  fin = 'zzz';

Type 
  cadena30 = string[30];
  InfoArbol = Record
    nom: cadena30;
    ap: cadena30;
    dni: integer;
  End;

  arbol = ^nodoA;

  nodoA = Record
    datos: InfoArbol;
    HD: arbol;
    HI: arbol;
  End;
  listaNivel = ^nodoN;

  InfoNivel = Record
    datos: InfoArbol;
    lvl: integer;
  End;

  nodoN = Record
    data: InfoNivel;
    sig: listaNivel;
  End;



Procedure CargarArbol (Var a:arbol);
Procedure Insertar (Var a:arbol; n:InfoArbol);
Begin
  If (a = Nil) Then
    Begin
      new (a);
      a^.datos := n;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If (a^.datos.dni>n.dni) Then Insertar(a^.HI,n)
  Else If (a^.datos.dni<n.dni) Then Insertar(a^.HD,n)
End;
Procedure CargaReg (Var n:InfoArbol);
Begin
  writeln('Inserte nombre (ZZZ Finaliza la carga): ');
  readln(n.nom);
  If (n.nom <> fin)Then
    Begin
      write('Inserte Apellido: ');
      readln(n.ap);
      n.dni := random(1000);
    End;
End;

Var n: InfoArbol;
Begin
  CargaReg(n);
  While n.nom <> fin Do
    Begin
      Insertar (a,n);
      CargaReg(n);
    End;
End;


Procedure ImprimirPorNivel(a: arbol);
Procedure InsertarOrd(Var L:listaNivel;Info: InfoArbol; lvl: integer);

Var nue, act, ant: listaNivel;
Begin
  new(nue);
  nue^.data.datos := Info;
  nue^.data.lvl := lvl;
  act := L;
  ant := L;
  While (act <> Nil)And(nue^.data.lvl > act^.data.lvl) Do
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
      lvlAct := L^.data.lvl;
      write('Nivel ', L^.data.lvl,': ');
      While (L<>Nil) And (lvlAct = L^.data.lvl) Do
        Begin
          write(L^.data.datos.dni , '  ');
          aux := L;
          L := L^.sig;
          dispose(aux);
        End;
    End;
End;

Procedure ImprimirDatos(n: InfoArbol);
Begin
  writeln ('Nombre: ',n.nom);
  writeln ('Apellido: ',n.ap);
  writeln ('DNI: ', n.dni);
  Writeln('')
End;


Procedure Busqueda (a:arbol; n:integer);
Begin
  If (a=Nil) Then
    WriteLn ('El dato indicado no se encuentra en el arbol')
  Else
    If (a^.datos.dni>n) Then
      Busqueda (a^.HI, n)
  Else
    If a^.datos.dni<n Then
      Busqueda (a^.HD, n)
  Else
    ImprimirDatos(a^.datos);
End;

Procedure ImprimirApellido (a:arbol;apellido:cadena30);
Begin
  If a<>Nil Then
    Begin
      ImprimirApellido (a^.HI, apellido);
      If a^.datos.ap=apellido Then
        ImprimirDatos(a^.datos);
      ImprimirApellido (a^.HD, apellido)
    End;
End;



Var 
  a: arbol;
  n: integer;
  apellido: cadena30;
Begin
  Randomize;
  a := Nil;
  CargarArbol(a);
  ImprimirPorNivel(a);
  writeln();
  writeln('Ingrese DNI a buscar: ');
  readln(n);
  Busqueda(a, n);
  writeln('Ingrese Apellido a imprimir: ');
  ReadLn(apellido);
  ImprimirApellido(a,apellido)
End.
