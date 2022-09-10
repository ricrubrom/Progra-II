package Rome.Ej4;

import java.util.Scanner;

public class Ejercicio4 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Partido[] v = new Partido[3];
        int i, golL, golV;
        String Local, Visitante;
        for (i = 0; i < 3; i++) {
            System.out.print("Inserte el Nombre Del Equipo local para el partido " + (i + 1) + ": ");
            Local = in.nextLine();
            System.out.print("Inserte el Nombre del Equipo Visitante para el partido " + (i + 1) + ": ");
            Visitante = in.nextLine();
            System.out.print("Inserte la Cantidad de goles del local del partido " + (i + 1) + ": ");
            golL = in.nextInt();
            System.out.print("Inserte la Cantidad de goles del visitante del partido " + (i + 1) + ": ");
            golV = in.nextInt();
            v[i] = new Partido(Local, Visitante, golL, golV);
            System.out.println();
            in.nextLine();
        }
        in.close();
        int empate = 0, golesBoca = 0, ganoRiver = 0;
        for (i = 0; i < 3; i++) {
            if (v[i].getGanador().equals("River")) {
                ganoRiver++;
            }
            if (v[i].getLocal().equals("Boca"))
                golesBoca += v[i].getGolesLocal();
            if (v[i].hayEmpate())
                empate++;
        }
        System.out.println("La cantidad de partidos que gano river fueron: " + ganoRiver);
        System.out.println("La cantidad de goles de Boca siendo local fueron: " + golesBoca);
        System.out.println("El porcentaje de los partidos que terminaron en empate es: " + ((empate * 100) / 3));
    }
}
