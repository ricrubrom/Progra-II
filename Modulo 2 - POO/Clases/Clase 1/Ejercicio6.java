import java.util.Scanner;

public class Ejercicio6 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int[][] m = new int[10][10];
        int[] v = new int[10];
        int i, j, n, tot = 0;
        for (i = 0; i < 10; i++) {
            for (j = 0; j < 10; j++)
                m[i][j] = i * 20 + j * 2;

        }
        for (i = 0; i < 10; i++) {
            System.out.print("I=" + i + "  ");
            for (j = 0; j < 10; j++)
                System.out.print(m[i][j] + "  ");
            System.out.println();
        }

        for (i = 2; i < 10; i++) {
            for (j = 0; j < 4; j++)
                tot = tot + m[i][j];
        }
        System.out.println("La suma de los datos almacenados en [2,9]x[0,3] es: " + tot);

        for (i = 0; i < 10; i++) {
            v[i] = 0;
        }

        for (i = 0; i < 10; i++) {
            for (j = 0; j < 10; j++)
                v[i] = v[i] + m[i][j];
        }
        System.out.println("La suma de los elementos por columna: ");
        for (i = 0; i < 10; i++) {
            System.out.println("Columna " + i + "  " + v[i]);
        }
        i = 0;
        j = 0;
        System.out.println("Ingrese valor a buscar: ");
        n = in.nextInt();
        while ((i < 10) && (n != m[i][j])) {
            while ((j < 9) && (n != m[i][j]))
                j++;
            if (n != m[i][j]) {
                j = 0;
                i++;
            }
        }
        if (n == m[i][j]) {
            System.out.println("El valor se encuentra en la posicion: [" + i + "," + j + "]");
        } else {
            System.out.println("No se encontro el elemento");
        }
        in.close();
    }
}
