
import java.util.Scanner;

public class Ejercicio5 {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            double[] v = new double[15];
            int j;
            double promedio = 0;
            int cant = 0;
            for (j = 0; j < 15; j++) {
                System.out.println("Inserte la altura del jugador " + (j + 1));
                v[j] = in.nextDouble();
            }
            in.close();
            for (j = 0; j < 15; j++)
                promedio = promedio + v[j];
            promedio = promedio / 15;
            System.out.println("La altura promedio de los jugadores es: " + promedio);

            for (j = 0; j < 15; j++)
                if (v[j] > promedio)
                    cant = cant + 1;

            System.out.println("La cantidad de jugadores con altura mayor al promedio son: " + cant);
        }
        System.out.println("Programa Finalizado.");
    }
}
