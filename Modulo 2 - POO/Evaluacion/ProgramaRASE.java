import java.util.Scanner;

public class ProgramaRASE {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int i, tipo, dimF = 1;
        Solicitud[] v = new Solicitud[dimF];
        for (i = 0; i < dimF; i++) {
            System.out.println("Ingrese numero de operacion (1=Gas, 2=Electricidad)");
            tipo = in.nextInt();// Confiamos en que se inserte el dato correcto
            if (tipo == 1)
                cargaGas(v, i, in);
            else
                cargaElec(v, i, in);
        }
        for (i = 0; i < dimF; i++) {
            if (v[i].verificar()) {
                System.out.println("La siguiente solicitud a sido aprobada y debe abonar aproximadamente: "
                        + v[i].calcularAprox());
                System.out.println(v[i].toString() + "\n");
            } else {
                System.out.println("La siguiente solicitud a sido rechazada y debe abonar aproximadamente: "
                        + (v[i].getIngreso() * ((double) 5 / 100)));
                System.out.println(v[i].toString() + "\n");
            }
        }
    }

    public static void cargaGas(Solicitud[] v, int i, Scanner in) {
        System.out.println("Ingrese Numero de Gestion (Alfanumerico): ");
        String numGest = in.next();
        in.nextLine();
        System.out.println("Ingrese Fecha de gestion: ");
        String fecha = in.nextLine();
        System.out.println("Ingrese Ingresos mensuales declarados: ");
        double ingresos = in.nextDouble();
        System.out.println("Ingrese Cantidad de integrantes del grupo familiar: ");
        int cantPer = in.nextInt();
        System.out.println(
                "Ingrese Region (Patagonia, PampaHúmeda, PampaSeca, Cuyo, SierrasPampeanas, NOA, Chaqueña, Mesopotamia): ");
        String region = in.next();
        System.out.println("Ingrese Nombre del solicitante: ");
        String nombre = in.next();
        System.out.println("Ingrese Apellido del solicitante: ");
        String apellido = in.next();
        System.out.println("Ingrese CUIT del solicitante:");
        int CUIT = in.nextInt();
        Persona persona = new Persona(nombre, apellido, CUIT);
        System.out.println("Ingrese Numero del Medidor: ");
        int medidor = in.nextInt();
        System.out.println("Ingrese Tamaño del hogar (Metros cuadrados): ");
        double tamaño = in.nextDouble();
        System.out.println("Ingrese Cantidad de calefactores/estufas: ");
        int estufas = in.nextInt();
        v[i] = new Gas(numGest, fecha, ingresos, cantPer, region, persona, medidor, tamaño, estufas);
    }

    public static void cargaElec(Solicitud[] v, int i, Scanner in) {
        System.out.println("Ingrese Numero de Gestion (Alfanumerico): ");
        String numGest = in.next();
        in.nextLine();
        System.out.println("Ingrese Fecha de gestion: ");
        String fecha = in.nextLine();
        System.out.println("Ingrese Ingresos mensuales declarados: ");
        double ingresos = in.nextDouble();
        System.out.println("Ingrese Cantidad de integrantes del grupo familiar: ");
        int cantPer = in.nextInt();
        System.out.println(
                "Ingrese Region (Patagonia, PampaHúmeda, PampaSeca, Cuyo, SierrasPampeanas, NOA, Chaqueña, Mesopotamia): ");
        String region = in.next();
        System.out.println("Ingrese Nombre del solicitante: ");
        String nombre = in.next();
        System.out.println("Ingrese Apellido del solicitante: ");
        String apellido = in.next();
        System.out.println("Ingrese CUIT del solicitante:");
        int CUIT = in.nextInt();
        Persona persona = new Persona(nombre, apellido, CUIT);
        System.out.println("Ingrese Numero de Identificacion de Sumistro (NIS): ");
        int NIS = in.nextInt();
        System.out.println("Ingrese Cantidad de electrodomesticos: ");
        int cantElec = in.nextInt();
        v[i] = new Energia(numGest, fecha, ingresos, cantPer, region, persona, NIS, cantElec);
    }
}
