
Program Ac2Ej1_2;

Const 
  fin = 0;
  sup = 1900;
  inf = 1800;

Type 

  cadena30 = string[30];

  //datos Arbol Ej 1
  InfoArbol = Record
    Code: integer;
    Nom: cadena30;
    Cant: integer;
  End;

  //arbol 1
  arbol = ^nodoA;
  nodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;

  //Repetidos Arbol2
  listaArbol = ^nodo;
  nodo = Record
    datos: integer;
    sig: listaArbol;
  End;

  //datos arbolEj2
  InfoArbol2 = Record
    Code: integer;
    Nom : cadena30;
    l: listaArbol;
  End;

  //Arbol 2
  arbol2 = ^NodoA2;

  //Nodo Arbol2
  NodoA2 = Record
    datos: InfoArbol2;
    HI: arbol2;
    HD: arbol2;
  End;

  //Nodo para la carga
  NodoExtra = Record
    Code: integer;
    Nom : cadena30;
    DNI: integer;
    cant: integer;
  End;



  //Ej1
Procedure insertarArbol1(Var a:arbol; code:integer; nom:cadena30; cant: integer);
Begin
  If a = Nil Then
    Begin
      new (a);
      a^.datos.Code := code;
      a^.datos.Nom := nom;
      a^.datos.Cant := cant;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If a^.datos.code>code Then insertarArbol1 (a^.HI, code, nom, cant)
  Else If a^.datos.code<code Then insertarArbol1(a^.HD, code, nom, cant)
  Else a^.datos.cant := a^.datos.cant + 1;
End;


//Ej2
Procedure InicializarNodo (a:arbol2; code: integer; nom: cadena30; DNI: integer);
Begin
  a^.datos.nom := nom;
  a^.datos.code := code;
  new (a^.datos.l);
  a^.datos.l^.datos := DNI;
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

Procedure InsertarArbol2(Var a2:arbol2; code: Integer; nom: cadena30; DNI:integer);
Begin
  If (a2 = Nil) Then
    Begin
      new (a2);
      InicializarNodo (a2, code, nom, dni);
      a2^.HI := Nil;
      a2^.HD := Nil;
    End
  Else If (a2^.datos.Code>code) Then InsertarArbol2(a2^.HI, code, nom, DNI)
  Else If (a2^.datos.Code<code) Then InsertarArbol2(a2^.HD, code, nom, DNI)
  Else InsertarDNI(a2^.datos.l, DNI);
End;



Procedure VerValoresEnRango1(a: arbol; sup, inf: integer);

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
          VerValoresEnRango1(a^.HI, sup, inf);
          VerValoresEnRango1(a^.HD, sup, inf);
        End;
      If (a^.datos.code < inf)Then
        VerValoresEnRango1(a^.HD, sup, inf);
      If (a^.datos.code > sup)Then
        VerValoresEnRango1(a^.HI, sup, inf);
    End;
End;



Procedure VerValoresEnRango2(a: arbol2; sup, inf: integer);

Procedure ImprimirReg (n:InfoArbol2);
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
          VerValoresEnRango2(a^.HI, sup, inf);
          VerValoresEnRango2(a^.HD, sup, inf);
        End;
      If (a^.datos.code < inf)Then
        VerValoresEnRango2(a^.HD, sup, inf);
      If (a^.datos.code > sup)Then
        VerValoresEnRango2(a^.HI, sup, inf);
    End;
End;



Procedure CargarArboles(Var a: arbol; Var a2: arbol2);
Procedure CargarRegistro(Var R:NodoExtra);
Begin
  R.code := random(2000);
  If (R.code <> fin)Then
    Begin
      writeln('Inserte Nombre de Ciudad: ');
      readln(R.nom);
      R.cant := 1;
      R.DNI := random(5000);
    End;
End;

Var 
  R: NodoExtra;
Begin
  CargarRegistro(R);
  While (R.code <> fin) Do
    Begin
      InsertarArbol1(a, R.Code, R.Nom, R.Cant);
      InsertarArbol2(a2, R.Code, R.Nom, R.DNI);
      CargarRegistro(R);
    End;
End;



Var 
  a: arbol;
  a2: arbol2;
Begin
  randomize;
  CargarArboles(a, a2);
  VerValoresEnRango1(a,sup,inf);
  VerValoresEnRango2(a2,sup,inf)
End.
