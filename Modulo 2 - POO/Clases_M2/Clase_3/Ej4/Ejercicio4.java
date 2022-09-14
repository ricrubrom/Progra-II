package Ej4;

import java.util.Scanner;

public class Ejercicio4 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Jugadores[] j = new Jugadores[3];
        for (int i = 0; i < 3; i++) {
            System.out.println("Inserte el Nombre del jogador: ");
            String nombre = in.nextLine();
            System.out.println("Inserte el DNI del jogador: ");
            int DNI = in.nextInt();
            System.out.println("Inserte la Edad del jogador: ");
            int edad = in.nextInt();
            System.out.println("Inserte el Numero de Partidos jugados por el jogador: ");
            int partidos = in.nextInt();
            System.out.println("Inserte la cantidad de goles del jogador do fuchibol: ");
            int goles = in.nextInt();
            j[i] = new Jugadores(nombre, DNI, edad, partidos, goles);
            in.nextLine();
        }
        System.out.println("La cantidad de jugadores con mas de 100 partidos son: " + viejosputos(j));
        in.close();
        System.out.println("Fin del programa");
    }

    public static int viejosputos(Jugadores[] j) {
        int cant = 0, i;
        for (i = 0; i < 3; i++)
            if (j[i].getJugados() > 100)
                cant++;
        return cant;
    }
}
