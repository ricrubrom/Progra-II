program VectorOrdenado;

const
    dimF = 8;  {Dimensi�n f�sica del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

Function Busqueda(v:vector; num, pri, ult: integer; dimL: dim):boolean;
var
  mid: integer;
begin
  if(dimL = 0)then
    Busqueda := false
  else begin
    mid := (pri + ult) div 2;
    if(v[mid] = num)then
      Busqueda := true
    else 
      if(pri = ult)then
        Busqueda := false
      else
        if(v[mid] > num)then 
          Busqueda:= Busqueda(v, num, pri, mid - 1, dimL div 2)
        else
          Busqueda := Busqueda(v, num, mid + 1, ult, dimL div 2);
  end; 
end;








{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
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
   num: integer;
begin

     cargarVectorOrdenado(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('Ingrese un numero: '); readln(num);
     writeln(Busqueda(v, num, 1, dimL, dimL));
end.
