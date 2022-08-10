Program listas;
Type
  Lista= ^Nodo;
  Nodo= Record
    datos: integer;
    sig: Lista;
  End;
Var
 L: Lista;
 n: integer;

Procedure AgregarAdelante (var L:lista; num:integer);
Var nue:Lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=L;
    L:=nue;
  End;


Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end;

Function Minimo(l:lista ; min: integer):integer;
begin
  if(l = nil)then
    Minimo := min
  else begin
    if(l^.datos < min)then
      min:= l^.datos;
    Minimo := Minimo(l^.sig, min)
  end;
end;

Procedure Imprimir2(l:lista);
begin
  if(l <> nil)then begin
    write(l^.datos, ' ');
    Imprimir2(l^.sig);
  end;
end;

var
  min: integer;
begin
  randomize;
  L:=nil;
  min := 9999;
  n := random (10);
  While (n<>0) do Begin
    AgregarAdelante (L, n);
    n := random (10);
  End;
  writeln ('Lista generada: ');
  imprimir (L);
  writeln('minimo: ', Minimo(l, min));
  writeln('-----------------------------------------');
  Imprimir2(l);
end.
