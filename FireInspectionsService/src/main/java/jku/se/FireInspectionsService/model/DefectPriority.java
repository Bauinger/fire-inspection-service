package jku.se.FireInspectionsService.model;

public enum DefectPriority {
    low("Niedrig", "#277da1"),
    normal("Normal", "#f94144"),
    high("Hoch", "#90be6d"),
    critical("Kritisch", "#FF0000");

    public final String label;
    public final String color;

    private DefectPriority(String label, String color) {
        this.label = label;
        this.color = color;
    }
}
