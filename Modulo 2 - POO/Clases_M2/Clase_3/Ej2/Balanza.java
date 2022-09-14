package Ej2;

public class Balanza {
    private double monto;
    private int cant;

    public void iniciarCompra() {
        monto = 0;
        cant = 0;
    }

    public double devolverMontoAPagar() {
        return monto;
    }

    public void registrarProducto(double pesoEnKg, double precioPorKg) {
        monto += (pesoEnKg * precioPorKg);
        cant++;
    }

    public String devolverResumenDeCompra() {
        return ("Total a pagar " + monto + " por la compra de " + cant + " productos.");
    }
}
