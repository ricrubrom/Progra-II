
Program Ejercicio2;

Const 
  inf = 40000000;
  sup = 50000000;
  fin = 'pepe';
  Ex = 100;
  Tur = 25;

Type 
  str10 = string[10];
  //~~~~~~~Arbol~~~~~~~//

  InfoLista = Record
    Code: LongInt;
    Millas: integer;
    clase: str10;
  End;

  ListaArbol = ^NodoLista;
  NodoLista = Record
    Datos: InfoLista;
    sig: ListaArbol
  End;

  InfoArbol = Record
    DNI: LongInt;
    NomAp: string;
    vuelo: ListaArbol;
  End;

  arbol = ^nodoA;
  nodoA = Record
    Datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;

  //~~~~~~~~Fin Arbol~~~~~~~~//

  NodoExtra = Record
    DNI: longint;
    NomAP: String;
    Code: LongInt;
    Millas: Integer;
    Clase: str10;
  End;

  maximo = Record
    maxs: LongInt;
    DNI: LongInt;
  End;











Procedure CargarArbol(Var a:arbol);



Procedure CargarRegistro(Var n:NodoExtra);

Var pos: integer;
Begin
  writeln('Inserte Nombre y Apellido: ');
  readln(n.NomAp);
  If (n.NomAp <> fin)Then
    Begin
      n.DNI := random(3600000) + 30000000;
      n.code := random(500);
      n.Millas := random(10000);
      pos := random(1)+1;
      Case pos Of 
        1: n.Clase := 'Ejecutiva';
        2: n.Clase := 'Turista';
      End;
    End;
End;

Procedure Insertar (Var a:arbol; n:NodoExtra);

Procedure InsertarVuelo(Var L: listaArbol; n:NodoExtra);

Var nue: listaArbol;
Begin
  new(nue);
  nue^.datos.Code := n.Code;
  nue^.datos.Millas := n.Millas;
  nue^.datos.Clase := n.Clase;
  nue^.sig := L;
  L := nue;
End;

Procedure CargaNodo(Var a: arbol; n:NodoExtra);
Begin
  new(a);
  a^.datos.DNI := n.DNI;
  a^.datos.NomAp := n.NomAp;
  InsertarVuelo(a^.datos.vuelo, n)
End;

Begin
  If a = Nil Then
    Begin
      CargaNodo(a, n);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If a^.datos.DNI > n.DNI Then insertar (a^.HI, n)
  Else If a^.datos.DNI < n.DNI Then insertar (a^.HD, n)
  Else InsertarVuelo(a^.datos.vuelo, n)
End;

Var 
  n: NodoExtra;
Begin
  CargarRegistro(n);
  While (n.NomAp <> fin) Do
    Begin
      Insertar(a, n);
      CargarRegistro(n);
    End;
End;


Procedure EncontrarMax (a:arbol; Var max:maximo);
Function Recorrerlista (l:ListaArbol): integer;

Var tot: Integer;
Begin
  tot := 0;
  While l<>Nil Do
    Begin
      If l^.Datos.clase='Ejecutiva' Then tot := tot+l^.Datos.Millas*Ex
      Else tot := tot+l^.Datos.Millas*Tur;
      l := l^.sig;
    End;
  Recorrerlista := tot;
End;
Begin
  If a<>Nil Then
    Begin
      EncontrarMax (a^.HI, max);
      If max.maxs<Recorrerlista (a^.Datos.vuelo) Then
        Begin
          max.maxs := Recorrerlista (a^.Datos.vuelo);
          max.DNI := a^.datos.DNI;
        End;
      EncontrarMax (a^.HD, max)
    End;
End;


Procedure Recorrido (a:arbol);
Procedure ImprimirLista(l:ListaArbol);
Begin
  While (l<>Nil) Do
    Begin
      writeln('Codigo de vuelo: ',l^.datos.code);
      writeln('Millas: ', l^.datos.Millas);
      writeln('Clase: ', l^.datos.clase);
      l := l^.sig;
    End;
End;
Procedure ImprimirDatos(n: InfoArbol);
Begin
  writeln('_______________________________________________');
  writeln('DNI: ', n.DNI);
  writeln('Nombre y Apellido: ', n.NomAp);
  writeln('Vuelos: ');
  writeln('_____VUELOS_____');
  ImprimirLista(n.vuelo);
  writeln('_______________________________________________');

End;

Begin
  If a<>Nil Then
    Begin
      Recorrido (a^.HI);
      ImprimirDatos(a^.datos);
      Recorrido (a^.HD)
    End;
End;


Procedure VerValoresEnRango(a: arbol;Var cant:Integer);

Begin
  If (a <> Nil)Then
    Begin
      If (a^.datos.DNI >= inf)And(a^.datos.DNI <= sup)Then
        Begin
          cant := cant+1;
          VerValoresEnRango(a^.HI, cant);
          VerValoresEnRango(a^.HD, cant);
        End;
      If (a^.datos.DNI < inf)Then
        VerValoresEnRango(a^.HD, cant);
      If (a^.datos.DNI > sup)Then
        VerValoresEnRango(a^.HI, cant);
    End;
End;




Var 
  a: arbol;
  max: maximo;
  cant: integer;
Begin
  CargarArbol(a);
  WriteLn();
  Recorrido(a);
  EncontrarMax(a,max);
  writeln ('El premio al mejor cliente se lo lleva el DNI ', max.dni, ' Con ', max.maxs, ' Puntos');
  WriteLn();
  VerValoresEnRango(a,Cant);
  writeln('Hay ', cant, ' Clientes e/40Mill y 50Mill');
  WriteLn();
End.
