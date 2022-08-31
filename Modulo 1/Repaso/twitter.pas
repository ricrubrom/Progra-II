
Program twitter;

Uses 
sysutils;

Const inf = 0;
  sup = 10;

Type 
  tweet = Record
    codigoUsuario: integer;
    nombreUsuario: string;
    mensaje: string;
    esRetweet: boolean;
  End;

  listaTweets = ^nodoLista;
  nodoLista = Record
    dato: tweet;
    sig: listaTweets;
  End;


     {Completar agregando aquí las estructuras de datos necesarias en el ejercicio}

  //datos arbol
  InfoArbol = Record
    code: integer;
    NomAp: string;
    Cant: integer;
  End;

  arbol = ^NodoA;

  //Nodo Arbol
  NodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;



{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Fin~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

{agregarAdelante - Agrega nro adelante de l}
Procedure agregarAdelante(Var l: listaTweets; t: tweet);

Var 
  aux: listaTweets;
Begin
  new(aux);
  aux^.dato := t;
  aux^.sig := l;
  l := aux;
End;


{crearLista - Genera una lista con tweets aleatorios}
Procedure crearLista(Var l: listaTweets);

Var 
  t: tweet;
  texto: string;
Begin
  t.codigoUsuario := random(10);
  While (t.codigoUsuario <> 0) Do
    Begin
      texto := Concat(IntToStr(t.codigoUsuario), '-mensaje-', IntToStr(random (200)));
      t.nombreUsuario := Concat('Usuario-',IntToStr(t.codigoUsuario));
      t.mensaje := texto;
      t.esRetweet := (random(2)=0);
      agregarAdelante(l, t);
      t.codigoUsuario := random(10);
    End;
End;


{imprimir - Muestra en pantalla el tweet}
Procedure imprimir(t: tweet);
Begin
  With (t) Do
    Begin
      write('Tweet del usuario @', nombreUsuario, ' con codigo ',codigoUsuario, ': ', mensaje, ' RT:');
      If (esRetweet)Then
        writeln(' Si')
      Else
        writeln('No ');
    End;
End;


{imprimirLista - Muestra en pantalla la lista l}
Procedure imprimirLista(l: listaTweets);
Begin
  While (l <> Nil) Do
    Begin
      imprimir(l^.dato);
      l := l^.sig;
    End;
End;

Procedure CargarArbol (Var a:arbol; l:listaTweets);
Procedure CargarNodo(Var a:arbol; n:tweet);
Begin
  new (a);
  a^.datos.code := n.codigoUsuario;
  a^.datos.NomAp := n.nombreUsuario;
  a^.datos.Cant := 1;
End;
Procedure Insertar (Var a:arbol; n:tweet);
Begin
  If (a = Nil) Then
    Begin
      CargarNodo(a, l^.dato);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If (a^.datos.code > n.codigoUsuario) Then Insertar(a^.HI, l^.dato)
  Else If (a^.datos.code < n.codigoUsuario) Then Insertar(a^.HD, l^.dato)
  Else a^.datos.Cant := a^.datos.Cant + 1;
End;

Begin
  While (l<>Nil) Do
    Begin
      insertar (a,l^.dato);
      l := l^.sig;
    End;
End;


Procedure VerValoresEnRango(a: arbol);
Begin
  If (a <> Nil)Then
    Begin
      If (a^.datos.code >= inf)And(a^.datos.code <= sup)Then
        Begin
          writeln('Codigo de usuario: ', a^.datos.code);
          writeln('Cantidad Tweets: ', a^.datos.Cant);
          writeln('---------------------------------');
          VerValoresEnRango(a^.HI);
          VerValoresEnRango(a^.HD);
        End;
      If (a^.datos.code < inf)Then
        VerValoresEnRango(a^.HD);
      If (a^.datos.code > sup)Then
        VerValoresEnRango(a^.HI);
    End;
End;

Procedure BuscarMax (a:arbol; Var MaxNom: String;Var max: integer);
Begin
  If a<>Nil Then
    Begin
      BuscarMax (a^.HI, MaxNom, max);
      If (a^.datos.Cant > max)Then
        Begin
          max := a^.datos.Cant;
          MaxNom := a^.datos.NomAp;
        End;
      BuscarMax (a^.HD, MaxNom, max)
    End;
End;













Var 
  l: listaTweets;
  a: arbol;
  MaxNom: string;
  max: integer;
Begin
  Randomize;

  l := Nil;
  crearLista(l);
  writeln ('Lista generada: ');
  imprimirLista(l);
  writeln('Loco ya te imprimi la lista mostro');

  CargarArbol(a, l); {Inciso A}
  writeln('Loco ya te cree el arbol mostro');


  VerValoresEnRango(a); {Inciso B}
  max := 0;
  BuscarMax(a, MaxNom, max);
  writeln('El usuario con la mayor cantidad de tweets fue: ', MaxNom); {Inciso C mentiroso}


  writeln('Fin del programa');
End.
