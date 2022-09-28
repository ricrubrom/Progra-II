package Ej1;

import java.util.Scanner;

public class ProgramaEditorial {
    public static void main(String[] args) {
        try (Scanner in = new Scanner(System.in)) {
            Ejemplar[] v = new Ejemplar[2];
            String tipo;
            int i;
            for (i = 0; i < 2; i++) {
                System.out.println("Ingrese tipo de ejemplar (Revista o Libro): ");
                tipo = in.nextLine();
                if (tipo.equals("Revista"))
                    cargarRevista(v, in, i);
                else
                    cargarLibro(v, in, i);
                in.nextLine();
            }

            System.out.println("\n\nInserte año actual: ");
            int year = in.nextInt();
            for (i = 0; i < 2; i++)
                v[i].setYear(year);

            System.out.println("\n\nListado de editoriales: ");

            for (i = 0; i < 2; i++) {
                System.out.println(v[i].toString());
                System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            }

        }
    }

    public static void cargarRevista(Ejemplar[] v, Scanner in, int i) {
        System.out.println("Ingrese el codigo: ");
        String code = in.nextLine();
        System.out.println("Ingrese la cantidad de paginas: ");
        int pags = in.nextInt();
        in.nextLine();
        System.out.println("Ingrese el resumen: ");
        String summary = in.nextLine();
        System.out.println("Ingrese el DNI del responsable: ");
        int DNI = in.nextInt();
        in.nextLine();
        System.out.println("Ingrese el nombre del responsable: ");
        String name = in.nextLine();
        Responsable responsable = new Responsable(DNI, name);
        System.out.println("Ingrese el nombre de la revista: ");
        String nameR = in.nextLine();
        System.out.println("Ingrese la cantidad de articulos: ");
        int articles = in.nextInt();
        v[i] = new Revista(code, pags, summary, responsable, nameR, articles);
    }

    public static void cargarLibro(Ejemplar[] v, Scanner in, int i) {
        System.out.println("Ingrese el codigo: ");
        String code = in.nextLine();
        System.out.println("Ingrese la cantidad de paginas: ");
        int pags = in.nextInt();
        in.nextLine();
        System.out.println("Ingrese el resumen: ");
        String summary = in.nextLine();
        System.out.println("Ingrese el DNI del responsable: ");
        int DNI = in.nextInt();
        in.nextLine();
        System.out.println("Ingrese el nombre del responsable: ");
        String name = in.nextLine();
        Responsable responsable = new Responsable(DNI, name);
        System.out.println("Ingrese el titulo del libro: ");
        String title = in.nextLine();
        System.out.println("Ingrese la cantidad de capitulos: ");
        int chapters = in.nextInt();
        System.out.println("Ingrese si es o no una edicion de bolsillo (true o false)");
        boolean pocketEdition = in.nextBoolean();
        v[i] = new Libro(code, pags, summary, responsable, title, chapters, pocketEdition);
    }
}
