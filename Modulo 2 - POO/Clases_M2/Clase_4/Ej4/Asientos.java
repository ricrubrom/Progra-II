package Ej4;

public class Asientos {
    private boolean[] asientos;
    private int ocupados;
    private int tot;

    public Asientos() {
        this.asientos = new boolean[20];
        this.tot = 20;
        for (int i = 0; i < 20; i++)
            this.asientos[i] = false;
    }

    public boolean getAsientos(int i) {
        return asientos[i];
    }

    public int getOcupados() {
        return ocupados;
    }

    public int getTot() {
        return tot;
    }

    public void ocuparAsiento(int asiento) {
        this.asientos[asiento] = true;
        ocupados++;
    }

    public void liberarAsiento(int asiento) {
        this.asientos[asiento] = false;
        ocupados--;
    }

    public int devolverLibre() {
        int i = 0;
        while (asientos[i] != false)
            i++;
        return i;

    }

}
