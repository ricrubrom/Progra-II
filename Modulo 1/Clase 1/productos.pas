Program productos;
Uses
     sysutils;
Type
     producto = record
       codigo: integer;
	  nombre: string;
	  marca: string;
	  anio: 2000..2022;
	  precio: real;
     end;

     listaProductos = ^nodoLista;
     nodoLista = record
       dato: producto;
       sig: listaProductos;
     end;



Procedure agregarAdelante(var l: listaProductos; p: producto);
var
   aux: listaProductos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;



{crearLista - Genera una lista con productos aleatorios}
procedure crearLista(var l: listaProductos);
var
   i,j:integer;
   p: producto;
   
   v : array [1..10] of string;
begin
     v[1]:= 'Abercom';
     v[2]:= 'Aluminium';
     v[3]:= 'ClearWindows';
     v[4]:= 'IndArg';
     v[5]:= 'La Foret';
     v[6]:= 'Open';
     v[7]:= 'Portal';
     v[8]:= 'Puertamania';
     v[9]:= 'PVCPremium';
     v[10]:= 'Ventalum';

	 for i:=random(10) downto 1 do {for de marca}
	 begin
	     p.marca:= v[i];
		 for j:=random(5) downto 1 do {for de anio}
	     begin
		 	p.anio:= 2016+j;
			p.codigo:= random(10);
			while (p.codigo <> 0) do Begin
				p.nombre:= Concat('Producto-', IntToStr(random (200)));
				p.precio := random(1000000);
				agregarAdelante(l, p);
                p.codigo:= random(10);
		   end;
		 end;
	 end;
end;


{imprimir - Muestra en pantalla el producto}
procedure imprimir(p: producto);
begin
     with (p) do begin
          writeln('Producto', nombre, ' con codigo ',codigo, ': ', marca, ' Anio:', anio, ' Precio: ', precio:2:2);
     end;
end;


{imprimirLista - Muestra en pantalla la lista l}
procedure imprimirLista(l: listaProductos);
begin
     while (l <> nil) do begin
          if(l^.dato.marca = 'Abercom')and((l^.dato.anio >= 2018) and (l^.dato.anio <= 2020))and(l^.dato.precio > 100000)then
            imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

Procedure Reporte(l:listaProductos);
var
  marcaAct:string;
  anioAct: integer;
  TotAnio, TotMarca: real;
begin
  while(l<>nil)do 
    begin
      TotMarca:= 0;
      marcaAct:=l^.dato.marca;
      writeln('Marca: ', l^.dato.marca);
      while(l<>nil)and(marcaAct = l^.dato.marca)do 
        begin
          TotAnio:= 0;
          anioAct:= l^.dato.anio;
          writeln('Anio: ', l^.dato.anio);
          while(l<>nil)and(marcaAct = l^.dato.marca)and(anioAct = l^.dato.anio)do 
            begin
              writeln(l^.dato.codigo, ' ', l^.dato.nombre, ' ', l^.dato.precio:2:2);
              TotAnio:= TotAnio + 1;
              l:=l^.sig;
            end;
          TotMarca:= TotMarca + TotAnio;
          writeln('Total productos anio ', anioAct,': ', TotAnio:2:2);
        end;
      writeln('Total productos ', marcaAct,': ', TotMarca:2:2);
    end;
end;
var
   l: listaProductos;
begin
     Randomize;
     l:= nil;
     crearLista(l);
     writeln ('Lista generada: ');
     imprimirLista(l);
     writeln('-------------------------------');
     Reporte(l);
end.