/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class Category {
    int id;
    String name,purpose,purposeid;

    public Category() {
    }

    public Category(int id, String name, String purpose, String purposeid) {
        this.id = id;
        this.name = name;
        this.purpose = purpose;
        this.purposeid = purposeid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getPurposeid() {
        return purposeid;
    }

    public void setPurposeid(String purposeid) {
        this.purposeid = purposeid;
    }
    

    
}
