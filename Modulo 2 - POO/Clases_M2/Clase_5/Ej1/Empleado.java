package Ej1;

public abstract class Empleado {
    private String nombre;
    private int DNI;
    private int edad;
    private double sueldo;

    public Empleado(String nombre, int DNI, int edad, double sueldo) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.sueldo = sueldo;
    }

    public Empleado() {

    }

    // getters
    public String getNombre() {
        return nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public double getSueldo() {
        return sueldo;
    }

    // setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public abstract double calcularSueldoACobrar();

    public String toString() {
        return ("Nombre: " + this.nombre + "\n DNI: " + this.DNI + "\n Edad: " + this.edad + "\n Sueldo Basico: "
                + this.sueldo);
    }

}
