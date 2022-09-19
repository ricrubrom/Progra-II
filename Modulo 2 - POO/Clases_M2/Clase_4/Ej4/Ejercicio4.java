package Ej4;

import java.util.Scanner;

public class Ejercicio4 {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            String patente, destino;
            int hora;
            Flota flota = new Flota();
            System.out.println("Inserte la patente del micro: ");
            patente = in.next();
            in.nextLine();
            while ((!patente.equals("ZZZ000")) && (flota.getAct() != 15)) {

                System.out.println("Inserte el destino del micro: ");
                destino = in.nextLine();
                System.out.println("Inserte la hora de salida del micro: ");
                hora = in.nextInt();

                Micro micro = new Micro(patente, destino, hora);
                System.out.println("Ingrese Asiento que desea ocupar: ");
                int asiento = in.nextInt();

                while ((asiento != -1) && (micro.devolverLleno() != true)) {
                    if (micro.validarAsiento(asiento)) {
                        if (!micro.getEstado(asiento)) {
                            micro.ocuparAsiento(asiento);
                            System.out.println("Se ha ingresado correctamente");
                        } else
                            System.out.println(
                                    "El asiento elegido se encuentra ocupado. El asiento libre mas cercano es: "
                                            + micro.devolverLibre());
                    } else
                        System.out.println("El asiento elegido no existe");
                    System.out.println();
                    System.out.println("Ingrese Asiento que desea ocupar: ");

                    asiento = in.nextInt();
                    System.out.println();
                }
                flota.agregarMicro(micro);
                System.out.println("Inserte la patente del micro: ");
                patente = in.next();
                in.nextLine();
            }
            System.out.println("Inserte la patente a eliminar: ");
            patente = in.next();
            Micro micro = flota.getMicroPat(patente);
            if (micro != null) {
                flota.eliminarMicro(patente);
                System.out.println("El micro fue eliminado con exito");
            } else
                System.out.println("El micro no existe en la flota");
            in.nextLine();
            System.out.println("Inserte el destino del micro a eliminar: ");
            destino = in.nextLine();
            micro = flota.getMicroDest(destino);
            if (micro != null) {
                System.out.println("El micro con ese destino tiene la patente " + micro.getPatente());
            } else
                System.out.println("Nadie va a ese lugar de mierda.");
        }
        System.out.println("El programa finalizo.");
    }
}
