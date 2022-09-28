package Ej2;

public class Embarcacion extends Vehiculo {
    private int rey;
    private String nombre;
    private String tipo;
    private double eslora;
    private double tonelaje;
    private double valor;

    public Embarcacion(int año, double importe, Propietario propietario, int rey, String nombre, String tipo,
            double eslora, double tonelaje, double valor) {
        super(año, importe, propietario);
        this.rey = rey;
        this.nombre = nombre;
        this.tipo = tipo;
        this.eslora = eslora;
        this.tonelaje = tonelaje;
        this.valor = valor;
    }

    public Embarcacion() {

    }

    // getters
    public int getRey() {
        return rey;
    }

    public String getNombre() {
        return nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public double getEslora() {
        return eslora;
    }

    public double getTonelaje() {
        return tonelaje;
    }

    public double getValor() {
        return valor;
    }

    // setters
    public void setRey(int rey) {
        this.rey = rey;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setEslora(double eslora) {
        this.eslora = eslora;
    }

    public void setTonelaje(double tonelaje) {
        this.tonelaje = tonelaje;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public double calcTotPagar() {
        if (valor < 6000)
            return ((valor * ((double) 4 / 100)));
        else if (valor < 180000)
            return ((valor * ((double) 2 / 100)));
        else
            return ((valor * ((double) 5 / 100)));
    }

    public String toString() {
        return "Embarcacion: \n  REY: " + rey + "\n  Tipo: " + tipo + "\n  Eslora: " + eslora + "\n  Tonelaje: "
                + tonelaje
                + "\n  Valor: " + valor + "\n  Año: " + super.getAño() + "\n  Importe: " + super.getImporte()
                + "\n  Propietario: " + super.getPropietario().getNombre();
    }
}
