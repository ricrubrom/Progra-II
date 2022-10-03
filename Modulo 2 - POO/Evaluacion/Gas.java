public class Gas extends Solicitud {
    public int medidor;
    private double tamaño;
    private int estufas;

    // constructores
    public Gas(String numGest, String fecha, double ingreso, int cantPer, String region, Persona persona, int medidor,
            double tamaño, int estufas) {
        super(numGest, fecha, ingreso, cantPer, region, persona);
        this.medidor = medidor;
        this.tamaño = tamaño;
        this.estufas = estufas;
    }

    public Gas() {

    }

    // getters
    public int getMedidor() {
        return medidor;
    }

    public double getTamaño() {
        return tamaño;
    }

    public int getEstufas() {
        return estufas;
    }

    // setters
    public void setMedidor(int medidor) {
        this.medidor = medidor;
    }

    public void setTamaño(double tamaño) {
        this.tamaño = tamaño;
    }

    public void setEstufas(int estufas) {
        this.estufas = estufas;
    }

    // Inciso B
    public double calcularAprox() {
        if (super.getIngreso() > 300000) {
            return (250 * (tamaño / 2) + 750 * estufas);
        } else {
            if (super.getIngreso() > 150000) {
                return (100 * (tamaño / 3) + 500 * estufas);
            } else {
                return (1000 + super.getIngreso() * ((double) 2 / 100));
            }
        }
    }

    // Inciso C
    public boolean verificar() {
        if (super.verificar()) {
            if ((super.getIngreso() / (super.getCantPer() + estufas)) < (super.getIngreso() * ((double) 40 / 100))) {
                return true;
            } else
                return false;
        } else
            return false;
    }

    @Override
    public String toString() {
        return (super.toString() + "\n  Numero de medidor: " + medidor + "\n  Tamaño de la casa: " + tamaño
                + "\n  Cantidad de estufas/calefactores: " + estufas);
    }
}
