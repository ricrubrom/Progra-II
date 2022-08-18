
Program Enunciado2_1;

Const 
  fin = 0;
  kilos = 10;

Type 
  meses = 1..12;

  arbol = ^nodoA;

  InfoArbol = Record
    code: integer;
    cant: integer;
  End;

  nodoA = Record
    datos: InfoArbol;
    HI: arbol;
    HD: arbol;
  End;


  //Insertar un registro ya leido al arbol
Procedure Insertar(Var a:arbol; n:InfoArbol);
Begin
  If (a = Nil) Then
    Begin
      new (a);
      a^.datos := n;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If (a^.datos.code > n.code) Then Insertar(a^.HI,n)
  Else If (a^.datos.code < n.code) Then Insertar(a^.HD,n)
End;



//Carga un registro para luego insertar en el arbol
Procedure CargarRegistro(Var Info: InfoArbol);
Begin
  writeln('Inserte codigo de pasta: ');
  Readln(Info.code);
  If (Info.code <> fin)Then
    Begin
      //writeln('Inserte cantidad de pasta vendida durante el mes ', mes,': ' );
      Info.cant := Random(500);
    End;
End;

//Lee datos y los insera en el arbol hasta que aparezca el codigo de pasta 0
Procedure CargarArbol(Var a: arbol);

Var 
  Info: InfoArbol;
  //mes: meses;
Begin
  //writeln('Inserte mes actual: ');
  //Readln(mes);
  CargarRegistro(Info);
  While (Info.code <> fin) Do
    Begin
      Insertar(a, Info);
      CargarRegistro(Info);
    End;
  writeln('Carga Finzalizada ');

End;

//Recorrido EnOrden mientras imprime los datos de TODO el arbol
Procedure Imprimir(a:arbol);
Begin
  If a<>Nil Then
    Begin
      Imprimir (a^.HI);
      writeln('codigo de pasta: ', a^.datos.code);
      writeln('kilos vendidos: ', a^.datos.cant);
      writeln();
      Imprimir (a^.HD)
    End;
End;

//Recorrido EnOrden mientras se queda con el codigo de la pasta menos vendida
Procedure Minimo (a:arbol; min: integer; Var minCode: integer);
Begin
  If a<>Nil Then
    Begin
      Minimo (a^.HI, min, minCode);
      If (a^.datos.cant < min)Then
        Begin
          min := a^.datos.cant;
          minCode := a^.datos.code;
        End;
      Minimo (a^.HD, min, minCode)
    End;
End;

//Recorrido EnOrden mientras imprime los codigos de pasta con mas de 10 kg vendidos
Procedure Menos10(a:arbol);
Begin
  If a<>Nil Then
    Begin
      Menos10 (a^.HI);
      If (a^.datos.cant > kilos)Then
        write (' ', a^.datos.code);
      Menos10 (a^.HD)
    End;
End;

//Menu de Opciones para el usuario
Procedure Menu();
Procedure  Opciones(Var n: integer);
Begin
  writeln('Ingrese un numero del 1 al 5 (cualquier numero superior finaliza la carga): ');
  writeln('1 = Inicializar');
  writeln('2 = Incorporar Venta');
  writeln('3 = Imprimir Arbol');
  writeln('4 = Buscar Pasta menos vendida e Imprimir');
  writeln('5 = Informar Pastas con mas de 10 kg vendidos');
  ReadLn (n);
  If n>=6 Then writeln('Programa Finalizado');
End;

Var 
  n: integer;
  a: arbol;
  //mes: meses;
  minCode: integer;
  Info: InfoArbol;
Begin
  Opciones(n);
  While (n < 6) Do
    Begin
      Case n Of 
        1:
           Begin
             a := Nil;
             CargarArbol(a);
           End;
        2:
           Begin
             //writeln('Inserte mes actual: ');
             //Readln(mes);
             CargarRegistro(Info);
             Insertar(a, Info);
           End;
        3: Imprimir(a);
        4:
           Begin
             Minimo(a, 9999, minCode);
             If (a <> Nil)Then
               writeln('El codigo de pasta menos vendido es ', minCode);
           End;
        5:
           Begin
             writeln('Los codigos de pasta con menos de 10 kg vendidos son: ');
             Menos10(a);
             writeln();
           End;
      End;
      Opciones(n);
    End;
End;


Begin
  Randomize;
  Menu();
End.
