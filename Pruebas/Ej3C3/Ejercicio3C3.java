package Pruebas.Ej3C3;

import java.util.Scanner;

public class Ejercicio3C3 {
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);

        System.out.println("Ingrese nombre del entrenador: ");
        String nombre = in.next();
        System.out.println("Ingrese sueldo basico: ");
        double sueldo = in.nextDouble();
        System.out.println("Ingrese Campeonatos ganados: ");
        int cant = in.nextInt();

        Entrenadores DT = new Entrenadores(nombre, sueldo, cant);

        System.out.println(DT.calcularSueldoACobrar());
    }


    
}
