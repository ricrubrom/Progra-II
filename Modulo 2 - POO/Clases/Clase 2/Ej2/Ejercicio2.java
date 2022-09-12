package Ej2;

import java.util.Scanner;

public class Ejercicio2 {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            Persona[] v = new Persona[3];
            String n = new String();
            int e, i;
            int dni;
            for (i = 0; i < 3; i++) {
                System.out.print("Inserte el Nombre para la persona " + (i + 1) + ": ");
                n = in.nextLine();
                System.out.print("Inserte el DNI para la persona " + (i + 1) + ": ");
                dni = in.nextInt();
                System.out.print("Inserte la Edad para la persona " + (i + 1) + ": ");
                e = in.nextInt();
                v[i] = new Persona(n, dni, e);
                in.nextLine();
                System.out.println();
            }
            int cant = 0;
            int minDNI = 999999;
            String personamin = "Man, pone dnis menores a 999999 porfa";
            for (i = 0; i < 3; i++) {
                System.out.println(v[i].toString());
                System.out.println();
                if (v[i].mayor65()) {
                    cant++;
                }
                personamin = v[i].min(minDNI, personamin);
                minDNI = v[i].min2(minDNI);
            }
            System.out.println("La cantidad de personas mayores a 65 años son: " + cant);
            System.out.println("La cantidad de personas mayores a 65 años son: " + v[1].jubilados(v));
            System.out.println(personamin);
        }
    }
}