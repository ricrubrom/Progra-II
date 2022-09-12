import java.util.Scanner;

public class Ejercicio5 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String[] v = new String[10];
        for (int i = 0; i < 10; i++) {
            System.out.println("Ingrese palabra: ");
            v[i] = in.next();

        }
        in.close();
        for (int i = 0; i < 10; i++) {
            System.out.print(v[i].charAt(0));
        }
    }
}
