package Ej4;

public class Jugadores {
    private String nombre;
    private int DNI;
    private int edad;
    private int jugados;
    private int goles;

    public Jugadores(String unNombre, int unDNI, int unaEdad, int pJugados, int cant) {
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad;
        jugados = pJugados;
        goles = cant;
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public int getJugados() {
        return jugados;
    }

    public int getGoles() {
        return goles;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setJugados(int pJugados) {
        jugados = pJugados;
    }

    public void setGoles(int cant) {
        goles = cant;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public String toString() {
        String aux;
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + ", tengo " + edad + " años, " + " jugue " + jugados
                + " partidos " + " y meti " + goles + " goles.";
        return aux;
    }
}
