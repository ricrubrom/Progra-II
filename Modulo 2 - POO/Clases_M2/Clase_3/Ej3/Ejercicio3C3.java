package Ej3;

import java.util.Scanner;

public class Ejercicio3C3 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese nombre del entrenador do fuchibol: ");
        String nombre = in.nextLine();
        System.out.println("Ingrese el sueldo basico: ");
        double sueldo = in.nextDouble();
        System.out.println("Ingrese campeonatos ganados: ");
        int camp = in.nextInt();
        Entrenadores dt = new Entrenadores(nombre, sueldo, camp);
        System.out.println(dt.toString());
        System.out.println("El sueldo neto a cobrar es: " + dt.calcularSueldoACobrar());
        in.close();
        System.out.println("Programa finalizado.");
    }
}
