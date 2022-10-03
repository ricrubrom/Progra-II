public class Persona {
    private String nombre;
    private String apellido;
    private int CUIT;

    // Constructores
    public Persona(String nombre, String apellido, int CUIT) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.CUIT = CUIT;
    }

    public Persona() {

    }

    // getters
    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public int getCUIT() {
        return CUIT;
    }

    // setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setCUIT(int CUIT) {
        this.CUIT = CUIT;
    }
}
