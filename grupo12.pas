
Program grupo12;
//Uses
// sysutils;

Const 
  inf = 28000000;
  sup = 32000000;
  maxequipos = 20;
  Buscado = 34807474;

Type 
  str70 = string[70];

  jugador = Record
    DNI: longint;
    nombre_apellido: str70;
    equipo: str70;
    goles: integer;
  End;

  lista = ^nodoLista;
  nodoLista = Record
    dato: jugador;
    sig: lista;
  End;

  fecha = Record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  End;

  partido = Record
    identificador: longint;
    local: str70;
    visitante: str70;
    fecha_partido: fecha;
    estadio: str70;
    goleadores: lista;
  End;

  listaPartidos = ^nodoPartidos;
  nodoPartidos = Record
    dato: partido;
    sig: listaPartidos;
  End;

  nombres = array [1..20] Of str70;

     {Completar con los tipos de datos necesarios}
  NodoL = Record
    fechas: fecha;
    Cant: integer;
  End;
  //lista arbol repe
  listaArbol = ^NodoLA;
  NodoLA = Record
    datos: NodoL;
    sig: listaArbol;
  End;



  //Datos arbol
  InfoArbol = Record
    DNI: longint;
    nombre_apellido: str70;
    equipo: str70;
    L: listaArbol
  End;

  arbol = ^NodoA;

  //Nodo Arbol
  NodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;

  //Maximos
  Max = Record
    EquipoMax: str70;
    Cant: Integer
  End;

  //tipos

  InfoNivel = Record
    DNI: LongInt;
    lvl: integer;
  End;
  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = Record
    datos: InfoNivel;
    sig: listaNivel;
  End;



Procedure cargarFecha(Var f: fecha);
Begin
  f.dia := random(30)+1;
  f.mes := random(12)+1;
  If (f.mes = 2) And (f.dia > 28)Then
    f.dia := 28
  Else
    If ((f.mes = 4) Or (f.mes = 6) Or (f.mes =9) Or (f.mes = 11)) And (f.dia = 31)Then
      f.dia := 30;
  f.anio := 2022;
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

Procedure cargarEquipos(Var v:nombres );
Begin
  v[1] := 'Atletico Tucuman';
  v[2] := 'Huracan';
  v[3] := 'Gimnasia LP';
  v[4] := 'Godoy Cruz';
  v[5] := 'Argentino Juniors';
  v[6] := 'River';
  v[7] := 'Boca';
  v[8] := 'Racing';
  v[9] := 'Platense';
  v[10] := 'San Lorenzo';
  v[11] := 'Patronato';
  v[12] := 'Estudiantes';
  v[13] := 'Union';
  v[14] := 'Newells';
  v[15] := 'Barracas';
  v[16] := 'Tigre';
  v[17] := 'Arsenal';
  v[18] := 'Sarmiento';
  v[19] := 'Central';
  v[20] := 'Colon';
End;

Procedure cargarJugadores(Var l: lista; local, visitante:str70);

Var 
  j: jugador;
  cant, i, pos, loc_vis: integer;
  v: nombres;
Begin
  cant := random(2);
  v[1] := 'Lionel Perez';
  v[2] := 'Martin Fernandez';
  v[3] := 'Mariano Gomez';
  v[4] := 'Alejandro Gonzalez';
  v[5] := 'Fermin Martinez';
  v[6] := 'Nicolas Castro';
  v[7] := 'Gonzalo Villareal';
  v[8] := 'Tadeo Parodi';
  v[9] := 'Juan Pablo Silvestre';
  v[10] := 'Mariano Sanchez';
  v[11] := 'Alejo Monden';
  v[12] := 'Agustin Paz';
  v[13] := 'Juan Salto';
  v[14] := 'Matias Pidone';
  v[15] := 'Luis Hernandez';
  v[16] := 'Cristian Herrera';
  v[17] := 'Santiago Manzur';
  v[18] := 'Julian Darino';
  v[19] := 'Victor Abila';
  v[20] := 'Luciano Segura';
  If ((local='Colon')Or(visitante='Colon'))Then
    Begin
      With (j) Do
        Begin
          DNI := 34807474;
          nombre_apellido := 'Leandro Romanut';
          equipo := 'Colon';
          goles := random(3)+1;
        End;
      agregarJugador(l, j);
    End;
  For i:=1 To cant Do
    Begin
      With (j) Do
        Begin
          DNI := random(18000000)+20000000;;
          pos := random(20)+1;
          nombre_apellido := v[pos];
          loc_vis := random(2)+1;
          If (loc_vis=1)Then
            equipo := local
          Else
            equipo := visitante;
          goles := random(3)+1;
        End;
      agregarJugador(l, j);
    End;
End;

Procedure crearLista(Var l: listaPartidos);

Var 
  p: partido;
  cant,i,pos,loc,vis: integer;
  v,v2: nombres;
Begin
  cant := random(20)+1;
  v[1] := 'Antonio Vespucio Liberti';
  v[2] := 'Mario Alberto Kempes';
  v[3] := 'Alberto Armando';
  v[4] := 'Ciudad de La Plata';
  v[5] := 'Presidente Peron';
  v[6] := 'Jose Amalfitani';
  v[7] := 'Tomas Adolfo Duco';
  v[8] := 'Libertadores de America';
  v[9] := 'Pedro Bidegain';
  v[10] := 'Nestor Diaz Perez';
  v[11] := 'Marcelo Bielsa';
  v[12] := 'Gigante de Arroyito';
  v[13] := 'Malvinas Argentinas';
  v[14] := 'Brigadier General Estanislao Lopez';
  v[15] := 'Eduardo Gallardon';
  v[16] := 'Jose Maria Minella';
  v[17] := 'Florencio Sola';
  v[18] := 'Monumental Jose Fierro';
  v[19] := 'Nueva Espa�a';
  v[20] := 'Nuevo Francisco Urbano';
  cargarEquipos(v2);
  For i:=1 To cant Do
    Begin
      With (p) Do
        Begin
          identificador := random (100000)+1;
          pos := random(20)+1;
          estadio := v[pos];
          loc := random(20)+1;
          local := v2[loc];
          vis := random(20)+1;
          visitante := v2[vis];
          While (local=visitante) Do
            Begin
              vis := random(20)+1;
              visitante := v2[vis];
            End;
          cargarFecha(fecha_partido);
          goleadores := Nil;
          cargarJugadores(goleadores, local, visitante);
        End;
      agregar(l, p);
    End;
End;


Procedure imprimirJugador(j: jugador);
Begin
  With (j) Do
    Begin
      writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | EQUIPO: ', equipo, ' | GOLES: ', goles);
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
      writeln('PARTIDO: ', identificador, ' | EQ. LOCAL: ',local, ' | EQ. VISITANTE: ', visitante, ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ', estadio);
      imprimirJugadores(goleadores);
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

Procedure cargaarbol (Var a:arbol; l:listaPartidos);

Procedure InsertarLista(Var L: listaArbol; X: partido; N:jugador);

Var nue: listaArbol;
Begin
  new(nue);
  nue^.datos.fechas := X.fecha_partido;
  nue^.datos.cant := N.goles;
  nue^.sig := L;
  L := nue;
End;

Procedure cargarNodo (Var a:arbol; X:partido; L:jugador);
Begin
  new (a);
  a^.datos.DNI := L.DNI;
  a^.datos.nombre_apellido := L.nombre_apellido;
  a^.datos.equipo := L.equipo;
  a^.datos.l := Nil;
  InsertarLista(a^.datos.L, X, L);
  a^.HI := Nil;
  a^.HD := Nil;
End;

Procedure insertar (Var a:arbol; X:partido; L:jugador);
Begin
  If (a = Nil) Then
    cargarNodo(a, X, L)
  Else If (a^.datos.DNI > L.DNI) Then insertar (a^.HI, X, L)
  Else If (a^.datos.DNI < L.DNI) Then insertar (a^.HD, X, L)
  Else InsertarLista(a^.datos.l, X, L)
End;

Var 
  aux: lista;
Begin
  While (l<>Nil) Do
    Begin
      aux := l^.dato.goleadores;
      While aux<>Nil Do
        Begin
          insertar (a, l^.dato, aux^.dato);
          aux := aux^.sig;
        End;
      l := l^.sig;
    End;
End;




Procedure VerMaximo (a:arbol; Var maximo:max);
Function Contargol (L:listaArbol): Integer;

Var cant: Integer;
Begin
  cant := 0;
  While l<>Nil Do
    Begin
      cant := cant+ l^.datos.Cant;
      l := l^.sig;
    End;
  Contargol := cant;
End;

Var cant: Integer;
Begin
  If a<>Nil Then
    Begin
      VerMaximo (a^.HI, maximo);
      cant := Contargol(a^.datos.L);
      If Maximo.cant<cant Then
        Begin
          maximo.cant := cant;
          maximo.EquipoMax := a^.datos.equipo;
        End;;
      VerMaximo (a^.HD, maximo)
    End;
End;


Procedure BusquedaAcotada (a:arbol);
Procedure ImprimirDatos (X:InfoArbol);
Begin
  Writeln('DNI:', X.DNI);
  Writeln('Nombre Y apellido:', X.nombre_apellido);
  WriteLn('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

End;
Begin


  If (a <> Nil)Then
    Begin
      If (a^.datos.DNI >= inf)And(a^.datos.DNI <= sup)Then
        Begin
          imprimirDatos(a^.datos);
          BusquedaAcotada(a^.HI);
          BusquedaAcotada(a^.HD);
        End;
      If (a^.datos.DNI > sup)Then
        BusquedaAcotada(a^.HI);
      If (a^.datos.DNI < inf)Then
        BusquedaAcotada(a^.HD);
    End;
End;


Procedure BorrarElemento(Var a:arbol; X:LongInt);
Procedure VerMin(a:arbol;Var min: InfoArbol);
Begin
  If (a^.HI = Nil)Then
    Begin
      min.DNI := a^.datos.DNI;
      min.nombre_apellido := a^.datos.nombre_apellido;
      min.equipo := a^.datos.equipo;
      min.L := a^.datos.L;
    End
  Else VerMin(a^.HI, min);
End;

Var aux: arbol;
  min: InfoArbol;
Begin
  If (a = Nil)Then
    writeln('No se encontro el dato a eliminar')
  Else
    If (a^.datos.DNI > X)Then
      BorrarElemento(a^.HI, X)
  Else
    If (a^.datos.DNI < X)Then
      BorrarElemento(a^.HD, X)
  Else
    Begin
      If (a^.HI = Nil)Then //si solo tiene hijo derecho
        Begin
          aux := a;
          a := a^.HD;
          dispose(aux)
        End
      Else
        Begin
          If (a^.HD = Nil)Then //si solo tiene hijo izquierdo
            Begin
              aux := a;
              a := a^.HI;
              dispose(aux)
            End
          Else
            If (a^.HI <> Nil)And(a^.HD <> Nil)Then
              Begin
                VerMin(a^.HD, min);
                a^.datos := min;
                BorrarElemento(a^.HD, min.DNI);
              End;
        End;
    End;
End;

Procedure ImprimirPorNivel(a: arbol);
Procedure InsertarOrd(Var L:listaNivel; DNI:LongInt; lvl: integer);

Var nue, act, ant: listaNivel;
Begin
  new(nue);
  nue^.datos.DNI := DNI;
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
      InsertarOrd(L, a^.datos.DNI, lvl);
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
          write(L^.datos.DNI, '  ');
          aux := L;
          L := L^.sig;
          dispose(aux);
        End;
    End;
End;




Var 
  l: listaPartidos;
  a: arbol;
  Maximo: Max;
Begin
  Randomize;
  a := Nil;
  l := Nil;

  crearLista(l); {carga automatica de la estructura disponible}
  writeln ('LISTA GENERADA: ');
  imprimirLista(l);
  WriteLn();
  cargaarbol(a,l);
  WriteLn();
  VerMaximo(a,Maximo);
  WriteLn('El equipo con el mayor goleador es: ',Maximo.EquipoMax);
  BusquedaAcotada(a);
  WriteLn();
  ImprimirPorNivel(a);
  WriteLn();
  BorrarElemento(a,Buscado);
  WriteLn();
  ImprimirPorNivel(a);
  WriteLn();
  writeln('Fin del programa');
End.
