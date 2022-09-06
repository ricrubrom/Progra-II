program Arreglos;

const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;

Function Maximo(v:vector; max: integer; dimL:dim):integer;
begin
  if(dimL = 0)then
    Maximo := max
  else begin
    if(v[dimL] > max)then
      max:= v[dimL];
    Maximo := Maximo(v, max, dimL - 1)
  end;
end;

Function Suma(v:vector; dimL:dim):integer;
begin
  if(dimL = 0)then
    Suma := 0
  else 
    Suma := v[dimL] + Suma(v, dimL - 1)
end;






{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }
Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   max: integer;
begin
    max := -9000;
    cargarVector(v,dimL);
    writeln('Nros almacenados: ');
    imprimirVector(v, dimL);
    writeln('max: ', Maximo(v, max, dimL));
    writeln('suma: ', Suma(v, dimL));
end.
