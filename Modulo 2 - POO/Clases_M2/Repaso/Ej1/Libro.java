package Ej1;

public class Libro extends Ejemplar {
    private String title;
    private int chapters;
    private boolean pocket;

    public Libro(String code, int pags, String summary, Responsable responsable, String title, int chapters,
            boolean pocket) {
        super(code, pags, summary, responsable);
        if (pocket)
            this.title = title + " - De Bolsillo";
        else
            this.title = title;
        this.chapters = chapters;
        this.pocket = pocket;
    }

    public Libro() {

    }

    public String getTitle() {
        return title;
    }

    public int getChapters() {
        return chapters;
    }

    public boolean getEdition() {
        return pocket;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setChapters(int chapters) {
        this.chapters = chapters;
    }

    public void setEdition(boolean pocket) {
        this.pocket = pocket;
    }

    public String toString() {
        return ("Libro: " + title + "\n   Capitulos: " + chapters + "\n   Codigo: " + super.getCode()
                + "\n   Nombre del responsable: " + super.getResponsableName());
    }

}
