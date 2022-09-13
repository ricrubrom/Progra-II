package Ej2;
<<<<<<< HEAD
=======

>>>>>>> 6c32b818e0f7a7a55ab8897592c9dda48f195629
import java.util.Scanner;

public class Ejercicio2 {
    public static void main(String[] args) {
<<<<<<< HEAD

        Scanner in = new Scanner(System.in);

        Persona [] v = new Persona[15];
        int i, DNI, edad;
        String nom;

        for(i = 0; i < 15; i++){
            System.out.println(" Ingrese Nombre de la persona: ");
            nom = in.next();
            System.out.println(" Ingrese DNI de la persona: ");
            DNI = in.nextInt();
            System.out.println(" Ingrese Edad de la persona: ");
            edad = in.nextInt();
            v[i] = new Persona(nom, DNI, edad);
        }
        in.close();

        System.out.println( "La cantidad de personas con mas de 65 anios son:  " + mayores(v));

        System.out.println(Menor(v));
    }


        public static int mayores(Persona[] v){
            int edad, i, cant = 0;
            for(i = 0; i < 3; i++){
                edad = v[i].getEdad();
                if(edad >= 65) cant++;
            }
            return cant;
        } 

        public static String Menor(Persona[] v){
          int i, dni, menor = 10000000;
          Persona perMin = new Persona();
          for (i = 0; i < 15; i++){
            dni = v[i].getEdad();
            if(dni < menor){
                menor = dni;
                perMin = v[i];
            }
          }
          return perMin.toString();

    }
}
=======
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
>>>>>>> 6c32b818e0f7a7a55ab8897592c9dda48f195629
