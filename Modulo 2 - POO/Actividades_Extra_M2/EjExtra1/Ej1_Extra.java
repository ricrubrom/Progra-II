package Actividades_Extra_M2;

import java.util.Scanner;

public class Ej1_Extra{
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);

        System.out.println("Ingrese cantidad de productos a ingresar: ");
        int cant = in.nextInt();
        if(cant >= 1){
            String nombre, descripcion, marca;
            int code, stock;
            Productos[] v = new Productos[cant];
            for(int i=0; i<cant; i++){
                System.out.println("Ingrese codigo del producto " + (i + 1) + ": ");
                code = in.nextInt();
                System.out.println("Ingrese nombre del producto " + (i + 1) + ": ");
                nombre = in.next();
                System.out.println("Ingrese descripcion del producto " + (i + 1) + ": ");
                descripcion = in.nextLine();
                System.out.println("Ingrese la marca del producto " + (i + 1) + ": ");
                marca = in.nextLine();
                System.out.println("Ingrese la cantidad de unidades disponibles del producto " + (i + 1) + ": ");
                stock = in.nextInt();
                System.out.println();
                v[i] = new Productos(code, nombre, descripcion, marca, stock);
                System.out.println(v[i].toString());
                System.out.println();
            }
            System.out.println("Ingrese el codigo del producto a modificar su stock: ");
            code = in.nextInt();
            int j = 0;
            while((j < cant)&&(v[j].getCode != code))
                j++;
            if(v[j].getCode = code){
                System.out.println("Ingrese cantidad a incorporar: ");
                int cant2 = in.nextInt();
                v[j].setStock((v[j].getStock + cant2));
            }
            else System.out.println("El producto no se encuentra en la lista.");
        }
        else 
            System.out.println("Cantidad incorrecta.");
        
        in.close();
        System.out.println("Programa finalizado.");
    }

}