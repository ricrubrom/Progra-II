import java.util.Scanner;

public class Ejercicio2 {
    public static void main(String[] args)
    {
        Scanner in = new Scanner(System.in);
        int cant = 0, paso = 0;
        System.out.print("Ingrese patente del automovil: ");
        int patente = in.nextInt();
        while(patente != 0){
            if(patente % 2 == 0) {
                System.out.println("El automovil de patente " + patente + " tiene permitido el paso");
                paso = paso + 1;
            }
            else 
                System.out.println("El automovil de patente " + patente + " no tiene permitido el paso"); 
            cant = cant + 1;
            System.out.print("Ingrese patente del automovil: ");
            patente = in.nextInt();
        }
        in.close();
        if(paso != 0)
          System.out.println("El porcentaje de autos que pasaron fue " + ((paso * 100) / cant));
        System.out.println("Fin del programa.");
    }
}
