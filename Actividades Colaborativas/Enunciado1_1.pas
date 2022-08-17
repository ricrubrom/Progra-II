
Program Enunciado1_1;

Const 
  fin = 'pepe';

Type 

  arbol = ^nodoA;
  InfoArbol = Record
    nom: string[30];
    distancia: real;
    cant: integer;
  End;
  nodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;


Procedure Insertar (Var a:arbol; info:InfoArbol);
Begin
  If (a = Nil) Then
    Begin
      new (a);
      a^.datos := info;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If (a^.datos>n) Then Insertar(a^.HI,n)
  Else If (a^.datos<n) Then Insertar(a^.HD,n)
End;


Procedure CargarRegistro(info: InfoArbol);
Begin
  writeln('Ingrese Destino: ');
  readln(info.nom);
  If (info.nom <> fin)Then
    Begin
      info.distancia := random(6000);
      info.cant := random(100);
    End;
End;

Procedure CargarArbol (Var a:arbol);

Var info: InfoArbol;
Begin
  writeln('Cargando Arbol: ');
  CargarRegistro(info);
  While (info.nom <> fin) Do
    Begin
      Insertar (a, info);
      CargarRegistro(info);
    End;
End;

Var 
  a: arbol;
Begin
  Randomize;
  a := Nil;
  CargarArbol(a);

End.
