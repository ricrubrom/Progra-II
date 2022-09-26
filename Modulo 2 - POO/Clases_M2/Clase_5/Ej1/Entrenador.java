package Ej1;

public class Entrenador extends Empleado {
    private int campeonatos;

    public Entrenador(String nombre, int DNI, int edad, double sueldo, int campeonatos) {
        super(nombre, DNI, edad, sueldo);
        this.campeonatos = campeonatos;
    }

    public Entrenador() {

    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    public double calcularSueldoACobrar() {
        if (campeonatos > 1) {
            if (campeonatos < 4)
                return super.getSueldo() + 5000;
            else if (campeonatos < 10)
                return super.getSueldo() + 30000;
            else
                return super.getSueldo() + 50000;
        } else
            return super.getSueldo();
    }

    public String toString() {
        return (super.toString() + "\n Campeonatos ganados: " + this.campeonatos);
    }
}
