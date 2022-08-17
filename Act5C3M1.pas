program Act5C3M1;
type
  lista = ^nodo;
  nodo = record 
    datos: integer;
    sig: lista;
  end;

  arbol = ^nodoA;
  nodoA = record
    datos: integer;
    HI: arbol;
    HD: arbol;
  end;

  direccion = ^nodo;

procedure AgregarAlFinal(var l: lista; num:integer);
var act, nue : lista;
begin
  new (nue);
  nue^.datos:= num;
  nue^.sig := NIL;
  if l <> Nil then 
    begin
      act := l ;
      while (act^.sig <> NIL ) do 
        act := act^.sig ;
      act^.sig := nue ;
    end
  else
    l:= nue;
end;

procedure AgregarAlFinal2(var l, ult: lista; num:integer);
var nue : lista;
begin
  new (nue);
  nue^.datos:= num;
  nue^.sig := NIL;
  if l <> Nil then
    ult^.sig := nue
  else
    l := nue;
  ult := nue;
end;

Procedure CargarLista(var l:lista);
var 
  num:integer;
  ult: lista;
begin
  ult := nil;
  writeln('Insertar valores en la lista: ');
  readln(num);
  while(num <> 0)do begin
    AgregarAlFinal2(l, ult, num);
    readln(num);
  end;
end;


Procedure InsertarEnArbol(l:lista; var a:arbol);
  Procedure Insertar(var a:arbol; n: integer);
  begin
    if(a = nil)then begin
      new(a);
      a^.datos := n;
      a^.HI := nil;
      a^.HD := nil;
    end
    else begin
      if(a^.datos > n)then
        Insertar(a^.HI, n)
      else 
        if(a^.datos < n)then
        Insertar(a^.HD, n);
    end;
  end;
begin
  while(l <> nil)do begin
    Insertar(a, l^.datos);
    l := l^.sig;
  end;
end;

Procedure ImprimirLista(l:lista);
begin
  while(l <> nil)do begin
    write(l^.datos, ' | ');
    l := l^.sig;
  end;
  writeln();
end;

Function VerMin(a:arbol; min: integer):integer;
begin
  if(a <> nil)then begin
    min := a^.datos;
    VerMin := VerMin(a^.HI, min)
  end
  else VerMin := min;
end;

Function VerMax(a:arbol; max: integer):integer;
begin
  if(a <> nil)then begin
    max := a^.datos;
    VerMax := VerMax(a^.HD, max)
  end
  else VerMax := max;
end;

var
  l: lista;
  a: arbol;
  num: integer;
  direc: direccion;
begin
  l := nil; a := nil;
  CargarLista(l);
  ImprimirLista(l);
  InsertarEnArbol(l, a);
  writeln(VerMin(a, -1));
  writeln(VerMax(a, -1));
end.