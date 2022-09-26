package Ej1;

public class Jugador extends Empleado {
    private int partidos;
    private int goles;

    public Jugador(String nombre, int DNI, int edad, double sueldo, int partidos, int goles) {
        super(nombre, DNI, edad, sueldo);
        this.partidos = partidos;
        this.goles = goles;
    }

    public Jugador() {

    }

    // getters
    public int getPartidos() {
        return partidos;
    }

    public int getGoles() {
        return goles;
    }

    // setters
    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public double calcularSueldoACobrar() {
        if (((double) goles / partidos) > 0.5)
            return (super.getSueldo() * 2);
        else
            return super.getSueldo();
    }

    public String toString() {
        return (super.toString() + "\n Partidos jugados: " + this.partidos + "\n Goles: " + this.goles);
    }
}
