package Ej1;

import java.util.Scanner;

public class Ejercicio1 {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            System.out.println("Ingrese nombre del jugador:");
            String nombre = in.nextLine();
            System.out.println("Ingrese DNI del jugador:");
            int DNI = in.nextInt();
            System.out.println("Ingrese edad del jugador:");
            int edad = in.nextInt();
            System.out.println("Ingrese sueldo basico del jugador:");
            double sueldo = in.nextInt();
            System.out.println("Ingrese partidos jugados del jugador:");
            int partidos = in.nextInt();
            System.out.println("Ingrese goles del jugador:");
            int goles = in.nextInt();
            Empleado jugador = new Jugador(nombre, DNI, edad, sueldo, partidos, goles);

            in.nextLine();

            System.out.println("Ingrese nombre del entrenador:");
            nombre = in.nextLine();
            System.out.println("Ingrese DNI del entrenador:");
            DNI = in.nextInt();
            System.out.println("Ingrese edad del entrenador:");
            edad = in.nextInt();
            System.out.println("Ingrese sueldo basico del entrenador:");
            sueldo = in.nextInt();
            System.out.println("Ingrese campeonatos ganados del entrenador:");
            int campeonatos = in.nextInt();
            Empleado entrenador = new Entrenador(nombre, DNI, edad, sueldo, campeonatos);

            System.out.println(jugador.toString());
            System.out.println(entrenador.toString());

            System.out.println("El sueldo a cobrar del jugador es: " + jugador.calcularSueldoACobrar());
            System.out.println("El sueldo a cobrar del entrenador es " + entrenador.calcularSueldoACobrar());

        }
    }
}
