package Ej2;

import java.util.Scanner;

public class ProgramaArba {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            Vehiculo[] v = new Vehiculo[1];
            int i;
            for (i = 0; i < 1; i++) {
                System.out.println("Ingrese tipo de vehiculo (Automotor o Embarcacion): ");
                String tipo = in.nextLine();
                if (tipo.equals("Automotor"))
                    cargaAutomotor(v, in, i);
                else if (tipo.equals("Embarcacion"))
                    cargaEmbarcacion(v, in, i);
                else {
                    System.out.println("Escribi bien hijo de puta");
                    System.out.println("Ingrese tipo de vehiculo (Automotor o Embarcacion): ");
                    tipo = in.nextLine();
                    if (tipo.equals("Automotor"))
                        cargaAutomotor(v, in, i);
                    else if (tipo.equals("Embarcacion"))
                        cargaEmbarcacion(v, in, i);
                }
                in.nextLine();
            }

            for (i = 0; i < 1; i++) {
                System.out.println(v[i].toString() + "\n  Monto a pagar: " + v[i].calcTotPagar());
            }
        }
    }

    public static void cargaAutomotor(Vehiculo[] v, Scanner in, int i) {
        System.out.println("Ingrese año de fabricacion: ");
        int año = in.nextInt();
        System.out.println("Ingrese importe de gestion basico a pagar por el impuesto: ");
        double importe = in.nextDouble();
        System.out.println("Ingrese Clave de Identificacion Tributaria del propietario: ");
        int cit = in.nextInt();
        in.nextLine();
        System.out.println("Ingrese nombre del propietario: ");
        String nombre = in.nextLine();
        System.out.println("Ingrese apellido del propietario: ");
        String apellido = in.nextLine();
        Propietario p = new Propietario(nombre, apellido, cit);
        System.out.println("Ingrese la patente del automotor");
        String patente = in.nextLine();
        System.out.println("Ingrese el importe adicional por la fecha de fabricacion del automotor");
        double importeAdicional = in.nextDouble();
        in.nextLine();
        System.out.println("Ingrese una descripcion del automotor");
        String descripcion = in.nextLine();
        v[i] = new Automotor(patente, importeAdicional, descripcion, año, importe, p);
    }

    public static void cargaEmbarcacion(Vehiculo[] v, Scanner in, int i) {
        System.out.println("Ingrese año de fabricacion: ");
        int año = in.nextInt();
        System.out.println("Ingrese importe de gestion basico a pagar por el impuesto: ");
        double importe = in.nextDouble();
        System.out.println("Ingrese Clave de Identificacion Tributaria del propietario: ");
        int cit = in.nextInt();
        in.nextLine();
        System.out.println("Ingrese nombre del propietario: ");
        String nombre = in.nextLine();
        System.out.println("Ingrese apellido del propietario: ");
        String apellido = in.nextLine();
        Propietario p = new Propietario(nombre, apellido, cit);
        System.out.println("Ingrese REY (Registro Especial de Yates) de la embarcacion: ");
        int rey = in.nextInt();
        in.nextLine();
        System.out.println("Ingrese nombre de la embarcacion: ");
        nombre = in.nextLine();
        System.out.println("Ingrese tipo de embarcacion: ");
        String tipo = in.nextLine();
        System.out.println("Ingrese eslora (longitud de proa a popa) de la embarcacion: ");
        double eslora = in.nextDouble();
        System.out.println("Ingrese tonelaje de la embarcacion: ");
        double tonelaje = in.nextDouble();
        System.out.println("Ingrese valor declarado de la embarcacion: ");
        double valor = in.nextDouble();
        v[i] = new Embarcacion(año, importe, p, rey, nombre, tipo, eslora, tonelaje, valor);
    }
}
