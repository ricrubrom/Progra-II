
Program ejercicio3;

Uses 
sysutils;


Const 
  inf = 5;
  sup = 10;


Type 
  pedido = Record
    codSeg: Integer;
    fechaYhora: string;
    dni: longint;
    codArea: Integer;
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
    datos: LongInt;
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


  //Min
  Min = Record
    valor: Integer;
    code: Integer;
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
  cant := random(100); {genera hasta 100 elementos}
  cod := 1;
  While (cant <> 0) Do
    Begin
      p.codSeg := cod;  {codigo de seguimiento}
      p.fechaYhora := cargarFecha();
      p.dni := random(300);  {dni}
      p.codArea := (random(15)); {codigo de área}
      p.domicilio := Concat('Domicilio', IntToStr(cod)); {domicilio}
      p.tel := IntToStr(random(99)+400); {telefono}
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
  Else
    Begin
      InsertarLista(a^.datos.l, n.dni);
      a^.datos.Tot := a^.datos.Tot + 1;
    End;
End;

Begin
  While (l<>Nil) Do
    Begin
      insertar (a,l^.dato);
      l := l^.sig;
    End;
End;


Procedure ImprimirLista2(l:ListaArbol);
Begin
  While (l<>Nil) Do
    Begin
      write(l^.datos, ' ');
      l := l^.sig;
    End;
  writeln('');
End;

Procedure VerValoresEnRango(a: arbol);
Begin
  If (a <> Nil)Then
    Begin
      If (a^.datos.code < inf)Then
        VerValoresEnRango(a^.HD)
      Else
        If (a^.datos.code >= inf)And(a^.datos.code <= sup)Then
          Begin
            ImprimirLista2(a^.datos.l);
            VerValoresEnRango(a^.HI);
            VerValoresEnRango(a^.HD);
          End;
      If (a^.datos.code > sup)Then
        VerValoresEnRango(a^.HI);
    End;
End;



//Recorro e imprimo los datos en orden (de menor a mayor)
Procedure Recorrido (a:arbol);
Procedure ImprimirDatos(n: InfoArbol);
Begin
  writeln('_______________________________________________');
  writeln('Codigo de area: ', n.code);
  writeln('Total de pedidos: ', n.Tot);
  writeln('DNIS: ');
  ImprimirLista2(n.l);
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


Function MenorPedido (a:arbol; Var minimo: min): integer;
Begin
  If a<>Nil Then
    Begin
      If (a^.datos.Tot< minimo.valor)Then
        Begin
          minimo.valor := a^.datos.Tot;
          Minimo.code := a^.datos.code
        End;
      MenorPedido := MenorPedido (a^.HI,minimo);
      MenorPedido := MenorPedido (a^.HD,minimo);
    End;
  MenorPedido := minimo.code
End;






Procedure ImprimirCodigo (a: arbol; code:Integer);
Begin
  If (a=Nil) Then
    WriteLn ('El dato indicado no se encuentra en el arbol')
  Else
    If (a^.datos.code>code) Then
      ImprimirCodigo (a^.HI, code)
  Else
    If (a^.datos.code<code) Then
      ImprimirCodigo (a^.HD, code)
  Else
    Begin
      writeln('DNIS: ');
      imprimirLista2(a^.datos.l);
    End;
End;



Var 
  l_inicial: listaPedidos;
  a: arbol;
  code: integer;
  minimo: min;
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
  writeln();
  minimo.valor := 10000;
  minimo.code := 1;
  writeln('El codigo de area con menor cantidad de pedidos es ', MenorPedido(a, minimo)); {inciso B}
  WriteLn();
  writeln('Los DNIS con codigo de area entre 5 y 10 son: ');
  VerValoresEnRango(a); {inciso C}
  writeln();
  writeln('Ingrese codigo de area a revisar: ');
  readln(code);
  ImprimirCodigo(a, code); {Inciso D}
  writeln();
  writeln('Fin de mi vida');
End.
