package Ej4;

import java.util.Scanner;

public class Ejercicio4 {
    public static void main(String[] args) {

        Scanner in = new Scanner(System.in);
        Partido[] v = new Partido[3];
        int golesL, golesV;
        String Loc, Vis;
        for (int i = 0; i < 3; i++) {
            System.out.println("Ingrese equipo Local del partido " + (i + 1) + ": ");
            Loc = in.next();
            System.out.println("Ingrese equipo Visitante " + (i + 1) + ": ");
            Vis = in.next();
            System.out.println("Ingrese goles del Local " + (i + 1) + ": ");
            golesL = in.nextInt();
            System.out.println("Ingrese goles del Visitante " + (i + 1) + ": ");
            golesV = in.nextInt();
            v[i] = new Partido(Loc, Vis, golesL, golesV);
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

        }
        int riverWins = 0, golesBoquita = 0, empates = 0;
        for (int i = 0; i < 3; i++) {
            if (v[i].getGanador().equals("river"))
                riverWins++;

            if (v[i].getLocal().equals("boca")) {
                golesBoquita += v[i].getGolesLocal();

                if (v[i].hayEmpate()) {
                    empates++;
                }
            }
        }

        System.out.println("La cantidad de partidos ganados por los putos de riBer es " + riverWins);
        System.out.println("La cantidad de goles realizados por el club MAS GRANDE de America son: " + golesBoquita);
        System.out.println("El porcentaje de empates es: " + (empates * 100) / 3);

    }

}