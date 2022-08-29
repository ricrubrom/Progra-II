
Program ejercicio1;

Uses sysutils;

Const 
  inf = 30000000;
  sup = 40000000;

Type 
  str10 = string[10];
  jugador = Record
    dni: longint;
    nombreApellido: string;
    posicion: str10;
    puntaje: integer;
  End;

  lista = ^nodoLista;
  nodoLista = Record
    dato: jugador;
    sig: lista;
  End;

  partido = Record
    estadio: string;
    equipoLocal: string;
    equipoVisitante: string;
    fecha: str10;
    jugadores: lista;
  End;

  listaPartidos = ^nodoPartido;
  nodoPartido = Record
    dato: partido;
    sig: listaPartidos;
  End;


  ListaArbol = ^nodoL;
  nodoL = Record
    fecha: str10;
    puntaje: integer;
    sig: ListaArbol;
  End;

  //Datos del arbol
  InfoArbol = Record
    DNI: LongInt;
    NomAp: string;
    Pos: str10;
    LA: ListaArbol;
  End;

  arbol = ^NodoA;

  //Nodo Arbol
  NodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;




Procedure cargarFecha(Var s: str10);

Var 
  dia, mes: integer;
Begin
  dia := random(30)+1;
  mes := random(12)+1;
  If (mes = 2) And (dia > 28)Then
    dia := 31;
  If ((mes = 4) Or (mes = 6) Or (mes =9) Or (mes = 11)) And (dia = 31)Then
    dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
End;

Procedure agregar(Var l: listaPartidos; p: partido);

Var 
  aux: listaPartidos;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;
End;

Procedure agregarJugador(Var l: lista; j: jugador);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := j;
  aux^.sig := l;
  l := aux;
End;

Procedure cargarJugadores(Var l: lista);

Var 
  j: jugador;
  cant, i, pos: integer;
Begin
  cant := random(10)+22;
  For i:=1 To cant Do
    Begin
      With (j) Do
        Begin
          dni := random(36000000)+20000000;
          nombreApellido := Concat('Jugador-', IntToStr(dni));
          pos := random(4)+1;
          Case pos Of 
            1: posicion := 'arquero';
            2: posicion := 'defensa';
            3: posicion := 'mediocampo';
            4: posicion := 'delantero';
          End;
          puntaje := random(10)+1;
        End;
      agregarJugador(l, j);
    End;
End;

Procedure crearLista(Var l: listaPartidos);

Var 
  p: partido;
  cant, i: integer;
Begin
  cant := random(10);
  For i:=1 To cant Do
    Begin
      With (p) Do
        Begin
          estadio := Concat('Estadio-', IntToStr(random (500)+1));
          equipoLocal := Concat('Equipo-', IntToStr(random (200)+1));
          equipoVisitante := Concat('Equipo-', IntToStr(random (200)+1));
          cargarFecha(fecha);
          jugadores := Nil;
          cargarJugadores(jugadores);
        End;
      agregar(l, p);
    End;
End;



Procedure imprimirJugador(j: jugador);
Begin
  With (j) Do
    Begin
      writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
    End;
End;

Procedure imprimirJugadores(l: lista);
Begin
  While (l <> Nil) Do
    Begin
      imprimirJugador(l^.dato);
      l := l^.sig;
    End;
End;

Procedure imprimir(p: partido);
Begin
  With (p) Do
    Begin
      writeln('');
      writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
      imprimirJugadores(jugadores);
    End;
End;

Procedure imprimirLista(l: listaPartidos);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;




Procedure cargarArbol (Var a:arbol; l:listaPartidos);

Procedure InsertarFecha(Var L: listaArbol; n:partido);

Var nue: listaArbol;
Begin
  new(nue);
  nue^.fecha := n.fecha;
  nue^.puntaje := n.jugadores^.dato.puntaje;
  nue^.sig := L;
  L := nue;
End;

Procedure insertar (Var a:arbol; n:partido; J:jugador);
Procedure CargaNodo(Var a: arbol; n:partido; J:jugador);
Begin
  new(a);
  a^.datos.DNI := J.DNI;
  a^.datos.NomAp := J.nombreApellido;
  a^.datos.Pos := J.posicion;
  InsertarFecha(a^.datos.LA,n)
End;
Begin
  If a = Nil Then
    Begin
      CargaNodo(a, n, J);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If a^.datos.DNI>j.DNI Then insertar (a^.HI, n, J)
  Else If a^.datos.DNI<j.DNI Then insertar (a^.HD, n, J)
  Else InsertarFecha(a^.datos.LA, n)
End;

Var 
  aux: lista;
Begin
  While (l<>Nil) Do
    Begin
      aux := l^.dato.jugadores;
      While (aux<>Nil) Do
        Begin
          insertar (a, l^.dato, aux^.dato);
          aux := aux^.sig;
        End;
      l := l^.sig;
    End;
End;

Procedure ImprimirDatos(n: InfoArbol);

Var 
  total: Integer;
Begin
  total := 0;
  writeln('_______________________________________________');
  writeln('DNI: ', n.DNI);
  writeln('Nombre y Apellido: ', n.NomAp);
  writeln('Juega de ', n.pos);
  While (n.LA <> Nil) Do
    Begin
      total := total + n.LA^.puntaje;
      n.LA := n.LA^.sig;
    End;
  writeln('El puntaje del jugador es: ', total);
  If (total = 0)Then
    writeln('ORSINI');
  writeln('_______________________________________________')
End;







Procedure Informar (a:arbol);
Begin
  If a<>Nil Then
    Begin
      Informar (a^.HD);
      ImprimirDatos(a^.datos);
      Informar (a^.HI)
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

Procedure Retornar(a:arbol; pos: str10; Var cant:Integer);
Begin
  If a<>Nil Then
    Begin
      Retornar (a^.HI,pos,cant);
      If pos = a^.datos.Pos Then
        cant := cant+1;
      Retornar (a^.HD,pos,cant)
    End

End;


Var 
  l: listaPartidos;
  a: arbol;
  pos: str10;
  cant: Integer;
Begin
  Randomize;
  l := Nil;
  crearLista(l); {carga automática de la estructura disponible}
  writeln ('Lista generada: ');
  imprimirLista(l);

  writeln();

  CargarArbol(a, l); {Inciso A};
  Informar(a); {Inciso B}
  cant := 0;
  VerValoresEnRango(a,cant); {Inciso C}
  WriteLn('La cantidad de Jugadores con DNI entre 30Mill y 40Mill son: ', cant);
  writeln();
  writeln('Inserte posicion a buscar: ');
  readln(pos);
  cant := 0;
  Retornar(a, pos, cant);
  writeln('La cantidad de jugadores que juegan en la posicion ', pos , ' son ', cant); {Inciso D}
  WriteLn();
  writeln('Fin del programa');
End.
