package Ej1;

public abstract class Ejemplar {
    private String code;
    private int pags;
    private String summary;
    private int year;
    private Responsable responsable;

    public Ejemplar(String code, int pags, String summary, Responsable responsable) {
        this.code = code;
        this.pags = pags;
        this.summary = summary;
        this.year = 0;
        this.responsable = responsable;
    }

    public Ejemplar() {
    }

    // getters
    public String getCode() {
        return code;
    }

    public int getPags() {
        return pags;
    }

    public String getSummary() {
        return summary;
    }

    public int getYear() {
        return year;
    }

    public int getResponsable() {
        return responsable.getDNI();
    }

    public String getResponsableName() {
        return responsable.getName();
    }

    // setters
    public void setCode(String code) {
        this.code = code;
    }

    public void setPags(int pags) {
        this.pags = pags;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setResponsableName(String name) {
        responsable.setName(name);
    }

    public void setResponsable(int DNI) {
        responsable.setDNI(DNI);
    }

    public abstract String toString();
}
