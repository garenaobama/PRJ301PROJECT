/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class Option extends Product{
    int optionid,discount;
    double price;
    String optiondescribe;

    public Option() {
    }
    public Option(int id, int optionid) {
        super(id);
        this.optionid=optionid;
    }
    public Option(int optionid,String optiondescribe, double price, int discount) {
        this.optionid = optionid;
        this.discount = discount;
        this.price = price;
        this.optiondescribe = optiondescribe;
    }
    //information for simple display
    public Option(int id, int discount, double price, String name) {
        super(id, name);
        this.discount = discount;
        this.price = price;
    }
    public Option(String optiondescribe,  double price ,int discount) {
        this.optiondescribe = optiondescribe;
        this.discount = discount;
        this.price = price;
    }
    //information for detailed display
    public Option(int optionid, int discount, double price, String optiondescribe, int id, int cateid, String name, String describe, String material, String size, String color) {
        super(id, cateid, name, describe, material, size, color);
        this.optionid = optionid;
        this.discount = discount;
        this.price = price;
        this.optiondescribe = optiondescribe;
    }
    public Option(int optionid, int discount, double price, String optiondescribe, int id, String name) {
        super(id, name);
        this.optionid = optionid;
        this.discount = discount;
        this.price = price;
        this.optiondescribe = optiondescribe;
    }
    public int getOptionid() {
        return optionid;
    }

    public void setOptionid(int optionid) {
        this.optionid = optionid;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOptiondescribe() {
        return optiondescribe;
    }

    public void setOptiondescribe(String optiondescribe) {
        this.optiondescribe = optiondescribe;
    }
    
    
}
