
Program ProgramaEncomiendas;

Type 

  encomienda = Record
    codigo: integer;
    peso: integer;
  End;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = Record
    dato: encomienda;
    sig: lista;
  End;

  listaArbol = ^nodo;
  nodo = Record
    datos: integer;
    sig: listaArbol;
  End;

  InfoArbol = Record
    peso: integer;
    l: listaArbol;
  End;
  arbol = ^NodoA;

  //Arbol de Listas de Encomiendas
  NodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;




{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
Procedure agregarAdelante(Var l: Lista; enc: encomienda);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l := aux;
End;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
Procedure crearLista(Var l: Lista);

Var 
  e: encomienda;
  i: integer;
Begin
  l := Nil;
  For i:= 1 To 20 Do
    Begin
      e.codigo := i;
      e.peso := random (10);
      While (e.peso = 0) Do
        e.peso := random (10);
      agregarAdelante(L, e);
    End;
End;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
Procedure imprimirLista(l: Lista);
Begin
  While (l <> Nil) Do
    Begin
      writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
      l := l^.sig;
    End;
End;




//Carga Arbol
Procedure cargaarbol (Var a:arbol; l:lista);

Procedure InsertarCodigo(Var L: listaArbol; code: Integer);

Var nue: listaArbol;
Begin
  new(nue);
  nue^.datos := code;
  nue^.sig := L;
  L := nue;
End;
Procedure insertar (Var a:arbol; n:encomienda);
Begin
  If a = Nil Then
    Begin
      new (a);
      a^.datos.peso := n.peso;
      new (a^.datos.l);
      a^.datos.l^.datos := n.codigo;
      a^.datos.l^.sig := Nil;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If a^.datos.peso>n.peso Then insertar (a^.HI,n)
  Else If a^.datos.peso<n.peso Then insertar (a^.HD,n)
  Else InsertarCodigo(a^.datos.l,n.codigo)
End;

Begin
  While (l<>Nil) Do
    Begin
      insertar (a,l^.dato);
      l := l^.sig;
    End;
End;

Procedure ImprimirArbol(a:arbol);
Procedure ImprimirLista(l:listaArbol);
Begin
  While l<>Nil Do
    Begin
      write(' ', l^.datos);
      l := l^.sig;
    End;
End;
Begin
  If a<>Nil Then
    Begin
      ImprimirArbol(a^.HI);
      Writeln();
      writeln('Peso de encomienda: ', a^.datos.peso);
      write('Codigos: ');
      ImprimirLista(a^.datos.l);
      ImprimirArbol(a^.HD)
    End;
End;




Var 

  l: lista;
  a: arbol;
Begin
  Randomize;
  crearLista(l);
  writeln ('Lista de encomiendas generada: ');
  imprimirLista(l);
  cargaarbol(a,l);
  writeln();
  ImprimirArbol(a);
  WriteLn();
  write('===')
End.
