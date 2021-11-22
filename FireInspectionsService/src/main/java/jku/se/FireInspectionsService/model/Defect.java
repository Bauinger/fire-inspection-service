package jku.se.FireInspectionsService.model;

import java.io.Serializable;

public class Defect implements Serializable {

    private int id;
    private String defect;
    private DefectPriority priority;
    private int inspection_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDefect() {
        return defect;
    }

    public void setDefect(String defect) {
        this.defect = defect;
    }

    public DefectPriority getPriority() {
        return priority;
    }

    public void setPriority(DefectPriority priority) {
        this.priority = priority;
    }

    public int getInspection_id() {
        return inspection_id;
    }

    public void setInspection_id(int inspection_id) {
        this.inspection_id = inspection_id;
    }

}
