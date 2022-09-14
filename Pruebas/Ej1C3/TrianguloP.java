package Clases.Clase_3.Ej1;

public class TrianguloP {
    private double lado1;
    private double lado2;
    private double lado3;
    private String relleno;
    private String linea;

    public TrianguloP(double MiLado1, double MiLado2, double MiLado3, String MiRelleno, String MiLinea) {
        lado1 = MiLado1;
        lado2 = MiLado2;
        lado3 = MiLado3;
        relleno = MiRelleno;
        linea = MiLinea;
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getRelleno() {
        return relleno;
    }

    public String getLine() {
        return linea;
    }

    public void setLado1(double lado) {
        lado1 = lado;
    }

    public void setLado2(double lado) {
        lado2 = lado;
    }

    public void setLado3(double lado) {
        lado3 = lado;
    }

    public void setRelleno(String color) {
        relleno = color;
    }

    public void setLine(String color) {
        linea = color;
    }

    public double calcularPerimetro() {
        return (lado1 + lado2 + lado3);
    }

    public double calcularArea() {
        double s = (calcularPerimetro() / 2);
        return (Math.sqrt(s * (s - lado1) * (s - lado1) * (s - lado3)));

    }

}
