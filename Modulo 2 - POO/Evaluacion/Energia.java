public class Energia extends Solicitud {
    private int NIS;
    private int cantElec;

    public Energia(String numGest, String fecha, double ingreso, int cantPer, String region, Persona persona, int NIS,
            int cantElec) {
        super(numGest, fecha, ingreso, cantPer, region, persona);
        this.NIS = NIS;
        this.cantElec = cantElec;
    }

    public Energia() {

    }

    // getters
    public int getNIS() {
        return NIS;
    }

    public int getCantElec() {
        return cantElec;
    }

    // setters
    public void setNIS(int NIS) {
        this.NIS = NIS;
    }

    public void setCantElec(int cantElec) {
        this.cantElec = cantElec;
    }

    // Inciso B
    public double calcularAprox() {
        if (super.getIngreso() > 300000) {
            return (500 * cantElec);
        } else {
            if (super.getIngreso() > 150000) {
                return (100 * ((double) cantElec / 2) + super.getIngreso() * ((double) 2 / 100));
            } else {
                return (super.getIngreso() * ((double) 1.5 / 100) + 400 * super.getCantPer());
            }
        }
    }

    // Inciso C
    public boolean verificar() {
        if (super.verificar()) {
            if ((super.getIngreso() / (super.getCantPer())) < (super.getIngreso() * ((double) 45 / 100))) {
                return true;
            } else
                return false;
        } else
            return false;
    }

    @Override
    public String toString() {
        return (super.toString() + "\n  NIS: " + NIS + "\n  Cantidad de electrodomesticos: " + cantElec);
    }
}
