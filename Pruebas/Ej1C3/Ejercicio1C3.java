package Pruebas.Ej1C3;
import java.util.Scanner;

public class Ejercicio1C3 {
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);

        System.out.println("Ingrese el primer lado del triangulo: ");
        double l1 = in.nextInt();
        System.out.println("Ingrese el segundo lado del triangulo: ");
        double l2 = in.nextInt();
        System.out.println("Ingrese el tercer lado del triangulo: ");
        double l3 = in.nextInt();
        System.out.println("Ingrese el color de relleno del triangulo: ");
        String relleno = in.next();
        System.out.println("Ingrese el color de la linea del triangulo: ");
        String linea = in.next();

        Triangulo t = new Triangulo();
        t.crear(l1, l2, l3, relleno, linea);

        System.out.println("El perimetro del triangulo es: " + t.calcularPerimetro());
        System.out.println("El Area del triangulo es: " + t.calcularArea());



    }
    
}
