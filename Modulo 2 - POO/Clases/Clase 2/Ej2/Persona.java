package Ej2;

public class Persona {
    private String nombre;
    private int DNI;
    private int edad;

    public Persona(String unNombre, int unDNI, int unaEdad) {
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad;
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

    public boolean mayor65() {
        if (edad >= 65) {
            return true;
        } else {
            return false;
        }
    }

    public String min(int unDNI, String aux) {
        if (DNI > unDNI) {
            return aux;
        } else {
            aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
            return aux;
        }
    }

    public int min2(int unDNI) {
        if (DNI > unDNI)
            return unDNI;
        else
            return DNI;
    }

    public int jubilados(Persona[] p) {
        int cant = 0;
        for (int i = 0; i < 3; i++) {
            if (p[i].mayor65()) {
                cant++;
            }
        }
        return cant;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public String toString() {
        String aux;
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }

}
