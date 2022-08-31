
Program ejercicio3;

Uses 
sysutils;

Type 
  pedido = Record
    codSeg: integer;
    fechaYhora: string;
    dni: integer;
    codArea: integer;
    domicilio: string;
    tel: string;
  End;

  listaPedidos = ^nodoLista;
  nodoLista = Record
    dato: pedido;
    sig: listaPedidos;
  End;


  //lista Duplicados
  listaArbol = ^nodo;
  nodo = Record
    datos: integer;
    sig: listaArbol;
  End;

  //datos arbol
  InfoArbol = Record
    code: integer;
    Tot: integer;
    l: listaArbol;
  End;

  arbol = ^NodoA;

  //Nodo Arbol
  NodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;


Procedure agregarLista(Var pri:listaPedidos; p:pedido);

Var 
  nuevo, anterior, actual: listaPedidos;
Begin
  new (nuevo);
  nuevo^.dato := p;
  nuevo^.sig := Nil;
  If (pri = Nil) Then
    pri := nuevo
  Else
    Begin
      actual := pri;
      anterior := pri;
      While (actual<>Nil) And (actual^.dato.dni < nuevo^.dato.dni) Do
        Begin
          anterior := actual;
          actual := actual^.sig;
        End;
      If (anterior = actual) Then
        pri := nuevo
      Else
        anterior^.sig := nuevo;
      nuevo^.sig := actual;
    End;
End;


Function cargarFecha(): string;{Genera una FECHA aleatoria}

Var 
  dia, mes, hora, seg: integer;
  s: string;
Begin
  dia := random(30)+1;
  mes := random(12)+1;
  s := Concat(IntToStr(dia),'/',IntToStr(mes),'/2020 - ');
  hora := random(24);
  seg := random(60);
  If (hora < 10)Then
    s := Concat(s, '0', IntToStr(hora))
  Else
    s := Concat(s, IntToStr(hora));
  If (seg < 10)Then
    s := Concat(s, ':0', IntToStr(seg))
  Else
    s := Concat(s,':', IntToStr(seg));
  cargarFecha := s;
End;

Procedure crearLista(Var l: listaPedidos);

Var 
  cant, cod: integer;
  p: pedido;
Begin
  cant := random(10); {genera hasta 100 elementos}
  cod := 1;
  While (cant <> 0) Do
    Begin
      p.codSeg := cod;  {codigo de seguimiento}
      p.fechaYhora := cargarFecha();
      p.dni := random(60000000);  {dni}
      p.codArea := (random(4000)); {codigo de área}
      p.domicilio := Concat('Domicilio', IntToStr(cod)); {domicilio}
      p.tel := IntToStr(random(999999)+4000000); {telefono}
      agregarLista(l, p);
      cant := cant-1;
      cod := cod+1;
    End;
End;

Procedure imprimirPedido(p:pedido);
Begin
  With (p) Do
    writeln('El pedido ',codSeg, ' del cliente ', dni, ' sera atendido en la fecha ', fechaYhora, ' en el codigo de area ', codArea, ' y domicilio ', domicilio, ' con tel. de contacto ', tel);
End;

Procedure imprimirLista(l:listaPedidos);
Begin
  While (l<>Nil) Do
    Begin
      imprimirPedido(l^.dato);
      l := l^.sig;
    End;
End;

//Inciso A, carga del arbol Totalizando y con duplicados en una lista de DNIS
Procedure CargarArbol (Var a:arbol; l:listaPedidos);

Procedure InsertarLista(Var L: listaArbol; DNI: Integer);
Var nue: listaArbol;
Begin
  new(nue);
  nue^.datos := DNI;
  nue^.sig := L;
  L := nue;
End;

Procedure insertar (Var a:arbol; n:pedido);

Procedure CargarNodo(Var a:arbol; n:pedido);
Begin
  new (a);
  a^.datos.code := n.codArea;
  a^.datos.Tot := 1;
  InsertarLista(a^.datos.l, n.dni);
  a^.HI := Nil;
  a^.HD := Nil;
End;

Begin
  If a = Nil Then
     CargarNodo(a, n)
  Else If a^.datos.code > n.codArea Then insertar (a^.HI, n)
  Else If a^.datos.code < n.codArea Then insertar (a^.HD, n)
  Else begin
    InsertarLista(a^.datos.l, n.dni);
    a^.datos.Tot := a^.datos.Tot + 1;
  end;
End;

Begin
  While (l<>Nil) Do
    Begin
      insertar (a,l^.dato);
      l := l^.sig;
    End;
End;

//Recorro e imprimo los datos en orden (de menor a mayor)
Procedure Recorrido (a:arbol);
Procedure ImprimirLista(l:ListaArbol);
Begin
  While (l<>Nil) Do
    Begin
      write(l^.datos, ' ');
      l := l^.sig;
    End;
  writeln('');
End;
Procedure ImprimirDatos(n: InfoArbol);
Begin
  writeln('_______________________________________________');
  writeln('Codigo de area: ', n.code);
  writeln('Total de pedidos: ', n.Tot);
  writeln('DNIS: ');
  ImprimirLista(n.l);
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


Procedure MenorPedido (a:arbol; var Min:integer):integer;
Begin
  If a<>Nil Then
    Begin
      MenorPedido := MenorPedido (a^.HI);
      if()then
        MenorPedido := 
      MenorPedido := MenorPedido (a^.HD);
    End;
End;











Var 
  l_inicial: listaPedidos;
  a: arbol;
Begin
  Randomize;
     {Se crea la estructura inicial}
  l_inicial := Nil;
  crearLista(l_inicial);
  writeln ('Lista: ');
  imprimirLista(l_inicial);

  a := Nil;
  CargarArbol(a, l_inicial); {Inciso A}
  Recorrido(a);

  writeln('El codigo de area con menor cantidad de pedidos es', MenorPedido(a, 0));


  writeln('Fin del programa');
  readln;
End.
