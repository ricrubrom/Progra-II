package Ej2;

public class Automotor extends Vehiculo {
    private String patente;
    private double importe;
    private String descripcion;

    // constructor
    public Automotor(String patente, double importe, String descripcion, int año, double importe1,
            Propietario propietario) {
        super(año, importe1, propietario);
        this.setPatente(patente);
        this.setImporte(importe);
        this.setDescripcion(descripcion);
    }

    public Automotor() {

    }

    // getters
    public String getPatente() {
        return patente;
    }

    public double getImporte() {
        return importe;
    }

    public String getDescripcion() {
        return descripcion;
    }

    // setters
    public void setPatente(String patente) {
        this.patente = patente;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double calcTotPagar() {
        return (super.getImporte() + this.importe);
    }

    public String toString() {
        return ("Automotor: \n  Patente: " + patente + "\n  Importe: " + importe + "\n  Descripcion: " + descripcion
                + "\n  Año: " + super.getAño() + "\n  Importe: " + super.getImporte() + "\n  Propietario: "
                + super.getPropietario().getNombre());
    }
}
