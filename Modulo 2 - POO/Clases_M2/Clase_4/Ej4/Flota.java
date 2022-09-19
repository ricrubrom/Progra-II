package Ej4;

public class Flota {
    private Micro[] micro;
    private int act;

    // i
    public Flota() {
        micro = new Micro[15];

    }

    public int getAct() {
        return this.act;
    }

    public String getPatente(int i) {
        return micro[i].getPatente();
    }

    public int getHora(int i) {
        return micro[i].getHora();
    }

    public String getDestino(int i) {
        return micro[i].getDestino();
    }

    public boolean getEstadoAsiento(int i, int asiento) {
        return micro[i].getEstado(asiento);
    }

    public int getOcupados(int i) {
        return micro[i].devolverOcupados();
    }

    public int getTot(int i) {
        return micro[i].getAsientosTot();
    }

    public int getLibre(int i) {
        return this.micro[i].devolverLibre();
    }

    // ii
    public boolean getFlota() {
        return (act == 15);
    }

    // iii
    public void agregarMicro(Micro micro) {
        this.micro[act] = micro;
        act++;
    }

    // iv

    public void eliminarMicro(String patente) {
        int i = 0;
        while (this.micro[i].getPatente().equals(patente))
            i++;
        this.micro[i] = null;
    }

    // v
    public Micro getMicroPat(String patente) {
        int i = 0;
        while ((i < this.act) && (!micro[i].getPatente().equals(patente)))
            i++;
        if (i < act)
            return this.micro[i];
        else
            return null;
    }

    // vi
    public Micro getMicroDest(String destino) {
        int i = 0;
        while ((i < this.act) && (!micro[i].getDestino().equals(destino)))
            i++;
        if (i < act)
            return this.micro[i];
        else
            return null;
    }
}
