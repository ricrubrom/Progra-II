public class Ejercicio4 {
    public static void main(String[] arg) {
        int factorial;
        // Pares e Impares
        for (int n = 1; n < 10; n++) {
            factorial = 1;
            for (int i = n; i > 0; i--) {
                factorial = factorial * i;
            }
            System.out.println(n + "! =" + factorial);
        }
        // Solo Impares
        for (int n = 1; n < 10; n = n + 2) {
            factorial = 1;
            for (int i = n; i > 0; i--) {
                factorial = factorial * i;
            }
            System.out.println(n + "! =" + factorial);
        }
    }
}
