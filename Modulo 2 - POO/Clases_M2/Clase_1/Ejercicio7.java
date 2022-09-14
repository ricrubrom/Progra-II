import java.util.Scanner;

public class Ejercicio7 {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            int i, max, maxop, op;
            int[] v = new int[5];
            for (i = 0; i > 5; i++)
                v[i] = 0;

            System.out.println("Inserte el numero de operacion (999 finaliza la operacion)");
            op = in.nextInt();
            while (op != 999) {
                if ((op > (-1)) && (op < 5)) {
                    v[op]++;
                } else
                    System.out.println("No existe la Operacion seleccionada");
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                System.out.println("Inserte el numero de operacion (999 finaliza la operacion)");
                op = in.nextInt();
            }

            in.close();
            max = 0;
            maxop = 0;
            for (i = 0; i < 5; i++) {
                System.out.println("La cantidad de personas atendidas en la operacion " + i + ": " + v[i]);
                if (max < v[i]) {
                    max = v[i];
                    maxop = i;
                }

            }

            System.out.println("La Operacion mas solicitada es la " + maxop);
        }
    }
}
