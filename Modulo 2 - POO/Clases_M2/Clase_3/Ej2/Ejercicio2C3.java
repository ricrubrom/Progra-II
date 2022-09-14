package Ej2;

import java.util.Scanner;

public class Ejercicio2C3 {
    public static void main(String[] args) {
        double peso, precio;
        Scanner in = new Scanner(System.in);
        Balanza b = new Balanza();
        b.iniciarCompra();
        System.out.println("Leer el peso en kg: ");
        peso = in.nextDouble();
        while (peso != 0) {
            System.out.println("Ingrese precio por kilogramo: ");
            precio = in.nextDouble();
            b.registrarProducto(peso, precio);
            System.out.println("Leer el peso en kg: ");
            peso = in.nextDouble();
        }
        in.close();
        System.out.println(b.devolverResumenDeCompra());
        System.out.println("El programa finalizo.");
    }
}
