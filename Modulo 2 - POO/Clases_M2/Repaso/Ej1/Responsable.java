package Ej1;

public class Responsable {
    private int DNI;
    private String name;

    public Responsable(int DNI, String name) {
        this.DNI = DNI;
        this.name = name;
    }

    public Responsable() {
    }

    // getters
    public int getDNI() {
        return DNI;
    }

    public String getName() {
        return name;
    }

    // setters
    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setName(String name) {
        this.name = name;
    }

}
