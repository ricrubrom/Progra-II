
Program Ac2Ej2;

Const 
  fin = 1750;
  sup = 1900;
  inf = 1800;

Type 

  cadena30 = string[30];

  //Repetidos Arbol2
  listaArbol = ^nodo;
  nodo = Record
    datos: integer;
    sig: listaArbol;
  End;

  //datos arbolEj2
  InfoArbol = Record
    Code: integer;
    Nom : cadena30;
    l: listaArbol;
  End;

  //Arbol 2
  arbol = ^NodoA;

  //Nodo Arbol2
  NodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;

  //Nodo para la carga
  NodoExtra = Record
    Code: integer;
    Nom : cadena30;
    DNI: integer;
  End;




  //Ej2

Procedure CargarRegistro(Var R:NodoExtra);
Begin
  R.code := random(200)+1750;
  If (R.code <> fin)Then
    Begin
      writeln('Inserte Nombre de Ciudad: ');
      readln(R.nom);
      R.DNI := random(5000);
    End;
End;



Procedure CargarArbol(Var a:arbol);

Procedure InicializarNodo (Var a:arbol; N:NodoExtra);
Begin
  a^.datos.nom := n.nom;
  a^.datos.code := n.code;
  new (a^.datos.l);
  a^.datos.l^.datos := n.DNI;
  a^.datos.l^.sig := Nil;
End;

Procedure InsertarDNI(Var L: listaArbol; DNI: Integer);

Var nue: listaArbol;
Begin
  new(nue);
  nue^.datos := DNI;
  nue^.sig := L;
  L := nue;
End;

Procedure InsertarArbol(Var a:arbol; n:NodoExtra);
Begin
  If (a = Nil) Then
    Begin
      new (a);
      InicializarNodo (a, n);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If (a^.datos.Code>n.code) Then InsertarArbol(a^.HI, n)
  Else If (a^.datos.Code<n.code) Then InsertarArbol(a^.HD, n)
  Else InsertarDNI(a^.datos.l, n.DNI);
End;

Var n: NodoExtra;
Begin
  CargarRegistro (n);
  While n.Code<>fin Do
    Begin
      InsertarArbol (a,n);
      CargarRegistro (n);
    End;
End;



Procedure VerValoresEnRango(a: arbol; sup, inf: integer);

Procedure ImprimirReg (n:InfoArbol);
Procedure imprimirLista (l:listaArbol);
Begin
  While l<>Nil Do
    Begin
      Write (l^.datos, ' ');
      l := l^.sig;
    End;
End;
Begin
  WriteLn('Codigo Postal: ', n.Code);
  WriteLn('Nombre: ', n.Nom);
  write ('DNIs: ');
  Imprimirlista(n.l);
  writeln()
End;
Begin
  If (a <> Nil)Then
    Begin
      If (a^.datos.Code >= inf)And(a^.datos.code <= sup)Then
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
  VerValoresEnRango(a,sup,inf);
End.
