import java.util.Scanner;

public class Ejercicio8 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int[][] m = new int[5][4];
        int i, j;
        double tot = 0;
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 4; j++) {
                System.out.println("Inserte el puntaje de " + j + " : ");
                m[i][j] = in.nextInt();
            }
        }
        for (j = 0; j < 4; j++) {
            // System.out.println("El promedio del aspecto" + j + " es: "+);
            for (i = 0; i < 5; i++) {
                tot = tot + m[i][j];
            }
            System.out.println("El promedio del aspecto" + j + " es: " + tot / 5);
            tot = 0;
        }

    }
}
