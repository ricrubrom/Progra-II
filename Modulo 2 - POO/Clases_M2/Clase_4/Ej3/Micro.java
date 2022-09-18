package Ej3;

public class Micro {
    private String destino;
    private String patente;
    private int hora;
    private Asientos asientos;

    public Micro(String patente, String destino, int hora, Asientos asientos) {
        this.asientos = asientos;
        this.destino = destino;
        this.patente = patente;
        this.hora = hora;
    }

    public Micro() {

    }

    public String getDestino() {
        return destino;
    }

    public String getPatente() {
        return patente;
    }

    public int getAsientosOc() {
        return this.asientos.getOcupados();
    }

    public int getAsientosTot() {
        return this.asientos.getTot();
    }

    public int getHora() {
        return hora;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }

    // i
    public int devolverOcupados() {
        return asientos.getOcupados();
    }

    // ii
    public boolean devolverLleno() {
        return (asientos.getOcupados() == 20);
    }

    // iii
    public boolean validarAsiento(int asiento) {
        if ((asiento >= 0) && (asiento <= 20))
            return true;
        else
            return false;
    }

    // iv
    public boolean getEstado(int asiento) {
        return asientos.getAsientos(asiento);
    }

    // v
    public void ocuparAsiento(int asiento) {
        this.asientos.ocuparAsiento(asiento);
    }

    // vi
    public void liberarAsiento(int asiento) {
        this.asientos.liberarAsiento(asiento);
    }

    // vii
    public int devolverLibre() {
        return this.asientos.devolverLibre();
    }

}
