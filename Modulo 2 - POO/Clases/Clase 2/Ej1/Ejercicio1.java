import java.util.Scanner;

public class Ejercicio1 {
    public static void main(String[] args) {

        Scanner in = new Scanner(System.in);

        System.out.println(" Ingrese Nombre de la persona: ");
        String nom = in.next();
        System.out.println(" Ingrese DNI de la persona: ");
        int DNI = in.nextInt();
        System.out.println(" Ingrese Edad de la persona: ");
        int Edad = in.nextInt();

        in.close();
        Persona p = new Persona(nom, DNI, Edad);

        System.out.println(p.toString());

    }
}