package Ej2;

import java.util.Scanner;

public class Ejercicio2 {
    public static void main(String[] args) {


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
