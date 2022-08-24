
Program Ac1Ej1;

Type 
  cadena30 = String[30];

  arbol = ^nodoA;
  InfoArbol = Record
    nom: cadena30;
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
  Else If (a^.datos.nom>info.nom) Then Insertar(a^.HI,info)
  Else If (a^.datos.nom<info.nom) Then Insertar(a^.HD,info)
End;


Procedure CargarRegistro(Var info: InfoArbol);
Begin
  writeln('Ingrese Destino: ');
  readln(info.nom);
  If (info.nom <> '1')Then
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
  While (info.nom <> '1') Do
    Begin
      Insertar (a, info);
      CargarRegistro(info);
    End;
End;

Procedure ImprimirRegistro (info:InfoArbol);
Begin
  writeln ('Nombre: ', info.nom);
  writeln ('Ditancia: ', info.distancia:2:2);
  writeln ('Pasajes vendidos: ', info.cant);
  WriteLn();
  WriteLn();
End;

Procedure ImprimirArbol (a:arbol);
Begin
  If a<>Nil Then
    Begin
      ImprimirArbol (a^.HI);
      ImprimirRegistro(a^.datos);
      ImprimirArbol (a^.HD)
    End;
End;

Procedure Busqueda (n:cadena30;a:arbol);
Begin
  If (a=Nil) Then
    WriteLn ('El dato indicado no se encuentra en el arbol')
  Else
    If (a^.datos.nom>n) Then
      Begin
        a := a^.HI;
        Busqueda (n, a)
      End
  Else If a^.datos.nom<n Then
         Begin
           a := a^.HD;
           Busqueda (n,a)
         End
  Else
    ImprimirRegistro(a^.datos);
End;

Procedure MinDistancia (a:arbol);

Procedure EnOrden (a:arbol;Var min:InfoArbol);
Begin
  If a<>Nil Then
    Begin
      EnOrden (a^.HI,min);
      If min.distancia>a^.datos.distancia Then
        min := a^.datos;
      EnOrden (a^.HD,min)
    End;
End;

Var min: InfoArbol;

Begin
  min.distancia := 9999;
  EnOrden(a,min);
  If a<>Nil Then ImprimirRegistro(min)
End;


Procedure Aniadir (a:arbol);

Procedure Busqueda2 (n:cadena30;Var pos:arbol);
Begin
  If (pos=Nil) Then
    WriteLn ('El dato indicado no se encuentra en el arbol')
  Else
    If (pos^.datos.nom>n) Then
      Begin
        pos := pos^.HI;
        Busqueda2 (n, pos)
      End
  Else If pos^.datos.nom<n Then
         Begin
           pos := pos^.HD;
           Busqueda2 (n,pos)
         End;
End;


Var 
  n: Integer;
  nom: cadena30;
  pos: arbol;
Begin
  write ('Inserte destino: ');
  readln(nom);
  write ('Inserte pasajes a añadir: ');
  readln(n);
  pos := a;
  Busqueda2(nom,pos);
  If pos<>Nil Then pos^.datos.cant := pos^.datos.cant+n
End;

Procedure Opciones (Var n:Integer);
Begin
  writeln('Ingrese un numero del 1 al 6 (cualquier numero superior finaliza la carga): ');
  writeln('1 = Inicializar');
  writeln('2 = Insertar Destino');
  writeln('3 = Imprimir Arbol');
  writeln('4 = Buscar Destino e Imprimir');
  writeln('5 = Informar Destino mas cercano');
  writeln('6 = Sumar cantidad de pasajes a un destino');
  ReadLn (n);
  If n>=7 Then writeln('Finalizado');
End;

Procedure Menu (Var a:arbol);

Var 
  n: Integer;
  info: InfoArbol;
  nom: cadena30;
Begin
  Opciones (n);
  While n<7 Do
    Begin
      Case n Of 
        1: CargarArbol(a);
        2:
           Begin
             writeln ('Insertando: ');
             CargarRegistro(info);
             Insertar(a,info);
           End;
        3: ImprimirArbol(a);
        4:
           Begin
             Write ('Inserte nombre de destino a buscar: ');
             ReadLn(nom);
             Busqueda (nom,a)
           End;
        5: MinDistancia(a);
        6: aniadir(a);
      End;
      opciones (n);
    End;
End;

Var 
  a: arbol;
  info: InfoArbol;
Begin
  Randomize;
  a := Nil;
  Menu (a);
End.
