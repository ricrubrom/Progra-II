package Ej2;

public class Entrenadores {
    private String nombre;
    private double sueldo;
    private int campeonatos;

    public Entrenadores(String unNombre, double unSueldo, int unCampeonato) {
        nombre = unNombre;
        sueldo = unSueldo;
        campeonatos = unCampeonato;
    }

    public Entrenadores() {

    }

    public double getSueldo() {
        return sueldo;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setSueldo(double unSueldo) {
        sueldo = unSueldo;
    }

    public void setCampeonatos(int unCampeonato) {
        campeonatos = unCampeonato;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public String toString() {
        return ("Mi nombre es " + nombre + ", mi sueldo basico es " + sueldo + " y tengo " + campeonatos
                + " campeonatos ganados.");
    }

    public double calcularSueldoACobrar() {
        if ((campeonatos >= 1))
            if (campeonatos < 5) {
                return (sueldo + 5000);
            } else if (campeonatos <= 10)
                return (sueldo + 30000);
            else
                return (sueldo + 50000);
        else
            return sueldo;
    }

}
