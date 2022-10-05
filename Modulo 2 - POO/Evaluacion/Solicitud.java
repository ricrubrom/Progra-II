public abstract class Solicitud {
    private String numGest;
    private String fecha;
    private double ingreso;
    private int cantPer;
    private String region;
    private Persona persona;

    // Constructores
    public Solicitud(String numGest, String fecha, double ingreso, int cantPer, String region, Persona persona) {
        this.numGest = numGest;
        this.fecha = fecha;
        this.ingreso = ingreso;
        this.cantPer = cantPer;
        this.region = region;
        this.persona = persona;
    }

    public Solicitud() {

    }

    // getters
    public String getNumGest() {
        return numGest;
    }

    public String getFecha() {
        return fecha;
    }

    public double getIngreso() {
        return ingreso;
    }

    public int getCantPer() {
        return cantPer;
    }

    public String getRegion() {
        return region;
    }

    public Persona getPersona() {
        return persona;
    }

    // setters
    public void setNumGest(String numGest) {
        this.numGest = numGest;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setIngreso(Double ingreso) {
        this.ingreso = ingreso;
    }

    public void setCantPer(int cantPer) {
        this.cantPer = cantPer;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    // Inciso B
    public abstract double calcularAprox();

    // Inciso B-2
    public boolean verificar() {
        return (TarifasNacionalesPorRegion.puedeAccederAlSubsidio(ingreso, region));
    }

    // Inciso c
    @Override
    public String toString() {
        return ("Numero gestion: " + numGest + "\n  Fecha: " + fecha + "\n  Ingreso mensual familiar: " + ingreso
                + "\n  Cant personas del grupo familiar: " + cantPer + "\n  Region: " + region
                + "\n  Persona: \n    Nombre: " + persona.getNombre() + "\n    Apellido: " + persona.getApellido()
                + "\n    CUIT: " + persona.getCUIT());
    }
}
