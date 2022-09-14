import java.util.Scanner;

public class Ejercicio1 {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    System.out.println("Ingrese el primer lado del triangulo: ");
    double a = in.nextDouble();
    System.out.println("Ingrese el segundo lado del triangulo: ");
    double b = in.nextDouble();
    System.out.println("Ingrese el tercero lado del triangulo: ");
    double c = in.nextDouble();

    if ((a < (b + c)) && (b < (a + c)) && (c < (a + b))) {
      System.out.println("El perimetro del triangulo es " + (a + b + c));
    } else
      System.out.println("El triangulo es invalido");

    in.close();
    System.out.println("Fin del programa.");
  }
}