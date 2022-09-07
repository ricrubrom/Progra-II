import java.util.Scanner;

public class Ejercicio3 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Inserte el numero del cual desea saber el factorial: ");
        int numero = in.nextInt();
        int factorial = 1;
        for (int i = numero; i > 0; i--) {
            factorial = factorial * i;
        }
        System.out.println(numero + "! =" + factorial);
        in.close();
    }

}
