package Ej3;

import java.util.Scanner;

public class Ejercicio3 {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            // Asientos asientos = new Asientos();
            Micro micro = new Micro("ABC123", "Mar del Plata", 5);
            System.out.println("Ingrese Asiento que desea ocupar: ");
            int asiento = in.nextInt();
            while ((asiento != -1) && (micro.devolverLleno() != true)) {
                if (micro.validarAsiento(asiento)) {
                    if (!micro.getEstado(asiento)) {
                        micro.ocuparAsiento(asiento);
                        System.out.println("Se ha ingresado correctamente");
                    } else
                        System.out.println("El asiento elegido se encuentra ocupado. El asiento libre mas cercano es: "
                                + micro.devolverLibre());
                } else
                    System.out.println("El asiento elegido no existe");
                System.out.println();
                System.out.println("Ingrese Asiento que desea ocupar: ");
                asiento = in.nextInt();
                System.out.println();
            }
            System.out.println("La cantidad de asientos ocupados es: " + micro.devolverOcupados());
        }
    }
}