package jku.se.FireInspectionsService.model;

public enum InspectionStatus {
    pending("Ausstehend", "#277da1"),
    canceled("Abgesagt", "#f94144"),
    completed("Abgeschlossen", "#90be6d");

    public final String label;
    public final String color;

    private InspectionStatus(String label, String color) {
        this.label = label;
        this.color = color;
    }
}
