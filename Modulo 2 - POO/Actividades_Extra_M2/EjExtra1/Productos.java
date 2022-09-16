package Actividades_Extra_M2.EjExtra1;

public class Productos{
    private int code;
    private String nombre;
    private String descripcion;
    private String marca;
    private int stock;

    public Productos(int code, String nombre, String descripcion, String marca, int stock){
        this.code = code;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.marca = marca;
        this.stock = stock;
    }

    public Productos(){

    }

    //Getters

    public int getCode() {
        return code;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getMarca() {
        return marca;
    }

    public int getStock() {
        return stock;
    }


    //Setters

    public void setCode(int code) {
        this.code = code;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String toString() {
        return (nombre + " tiene codigo de producto  " + code + ", de la marca " + marca + " y en stock hay " + stock + " unidades del mismo, y cuanta con la siguiente descripcion: " + descripcion);
    }

