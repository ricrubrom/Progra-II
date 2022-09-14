package ./;
import java.util.Scanner;

public class Ejercicio1 {
    public static void main(String[] args) {

        Scanner in = new Scanner(System.in);

        System.out.println("Inserte Lado 1 del triangulo: ");
        double lado1 = in.nextDouble();
        System.out.println("Inserte lado 2 del triangulo: ");
        double lado2 = in.nextDouble();
        System.out.println("Inserte lado 3 del triangulo: ");
        double lado3 = in.nextDouble();
        System.out.println("Inserte color del relleno: ");
        String relleno = in.next();
        System.out.println("Inserte color de linea: ");
        String linea = in.next();

        in.close();

        Triangulo t = new Triangulo(lado1, lado2, lado3, relleno, linea);

        System.out.println("Perimetro: " + t.calcularPerimetro());
        System.out.println("El area del triangulo es: " + t.calcularArea());

        System.out.println("Programa finalizado.");
    }
}
