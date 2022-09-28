package Ej1;

public class Revista extends Ejemplar {
    private String name;
    private int volume;
    private int articles;

    public Revista(String code, int pags, String summary, Responsable responsable, String name,
            int articles) {
        super(code, pags, summary, responsable);
        this.name = name;
        this.volume = Generador.getNroVolumen();
        this.articles = articles;
    }

    public Revista() {

    }

    // getters
    public String getName() {
        return name;
    }

    public int getVolume() {
        return volume;
    }

    public int getArticles() {
        return articles;
    }

    // setters
    public void setName(String name) {
        this.name = name;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }

    public void setArticles(int articles) {
        this.articles = articles;
    }

    public String toString() {
        return ("Revista: " + name + "\n   Volumen: " + volume);
    }

}
