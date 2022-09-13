package Pruebas.Ej2C3;

import java.util.Scanner;
public class Ejercicio2C3 {
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        double precio=0;

        System.out.println("Iniciando compra...");
        Balanza compra = new Balanza();
        compra.iniciarCompra();
        System.out.println();

        System.out.println("Ingrese peso del item comprado: ");
        double peso = in.nextDouble();
        if(peso != 0){
            System.out.println("Ingrese precio por Kilogramo: ");
            precio = in.nextDouble();
        }

        while(peso != 0){
            compra.registrarProducto(peso, precio);
            System.out.println();
            System.out.println("Ingrese peso del item comprado: ");
            peso = in.nextDouble();
            if (peso != 0) {
                System.out.println("Ingrese precio por Kilogramo: ");
                precio = in.nextDouble();
            }
        }
        in.close();
        System.out.println(compra.devolverResumenDeCompra());

    }
}
