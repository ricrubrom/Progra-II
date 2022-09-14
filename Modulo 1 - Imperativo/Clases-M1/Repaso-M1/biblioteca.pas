
Program biblioteca;

Const fin = '0';

Type 
  //datos arbol
  InfoArbol = Record
    Titulo: string;
    ISBN: string;
    clas: string;
    tot: integer;
  End;

  arbol = ^NodoA;

  //Nodo Arbol
  NodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;


  //Inciso A= carga arbol
Procedure CargarArbol (Var a:arbol);
Procedure CargarNodo(Var a:arbol; n:InfoArbol);
Begin
  new (a);
  a^.datos.Titulo := n.Titulo;
  a^.datos.ISBN := n.ISBN;
  a^.datos.clas := n.clas;
  a^.datos.Tot := 1;
End;
Procedure Insertar (Var a:arbol; n:InfoArbol);
Begin
  If (a = Nil) Then
    Begin
      CargarNodo(a, n);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If (a^.datos.ISBN > n.ISBN) Then Insertar(a^.HI, n)
  Else If (a^.datos.ISBN < n.ISBN) Then Insertar(a^.HD, n)
  Else a^.datos.Tot := a^.datos.Tot + 1;
End;

Procedure CargarRegistro(Var n: InfoArbol);
Begin
  writeln('Inserte ISBN: ');
  readln(n.ISBN);
  If n.ISBN <> fin Then
    Begin
      writeln('Inserte Titulo: ');
      readln(n.Titulo);
      writeln('Inserte Clasificador Bibliografico: ');
      readln(n.Clas);
    End;
End;


Var n: InfoArbol;
Begin
  write('Inserte ISBN (0 Finaliza la carga): ');
  CargarRegistro(n);
  While n.ISBN <> fin Do
    Begin
      Insertar (a,n);
      CargarRegistro(n);
    End;
End;

//Inciso B: Busqueda con ISBN
Function Busqueda(a:arbol; n:String): Boolean;
Begin
  If (a=Nil) Then
    busqueda := False
  Else
    If (a^.datos.ISBN > n) Then
      busqueda := busqueda (a^.HI, n)
  Else If (a^.datos.ISBN < n) Then
         Busqueda := Busqueda (a^.HD, n)
  Else
    Busqueda := true
End;


//Inciso C: Contar Codigos
Procedure Contar (a:arbol;Code:String;Var cant:integer);
Begin
  If a<>Nil Then
    Begin
      If (a^.datos.clas=code) Then cant := cant+1;
      contar (a^.HI, Code,cant);
      contar (a^.HD, Code,cant);
    End
End;

//Inciso D: Busqueda con Titulo
Function Busqueda2(a: arbol; T:String): Boolean;
Begin
  If (a<>Nil) Then
    Begin
      If (a^.datos.Titulo = T)Then
        Busqueda2 := true
      Else
        Busqueda2 :=  Busqueda2 (a^.HD, T) Or Busqueda2 (a^.HI, T);
    End
  Else Busqueda2 := false;
End;

Var 
  a: arbol;
  code: string;
  cant: integer;
Begin
  CargarArbol (a); {Inciso A}
  writeln();
  Write('Inserte ISBN a buscar: ');
  readln(code); {Inciso B}
  If busqueda (a, code) Then
    writeln('El libro se encuentra en la Biblioteca')
  Else writeln('El libro no se encuentra en la Biblioteca');
  writeln();

  cant := 0;
  Write('Inserte Codigo Clasificador a buscar: '); {Inciso C}
  readln(code);
  contar(a,code,cant);
  writeln ('Hay ', cant, ' Libros de este tipo');

  Write('Inserte Titulo a buscar: ');
  readln(code); {Inciso D}
  If busqueda2 (a, code) Then
    writeln('El libro se encuentra en la Biblioteca')
  Else writeln('El libro no se encuentra en la Biblioteca');

  writeln();
End.
