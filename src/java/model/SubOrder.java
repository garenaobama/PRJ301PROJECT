/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class SubOrder {
    private int orderid,productid,optionid,quantity;
    private double priceperunit;

    public SubOrder() {
    }

    public SubOrder(int productid, int optionid, int quantity, double priceperunit) {
        this.productid = productid;
        this.optionid = optionid;
        this.quantity = quantity;
        this.priceperunit = priceperunit;
    }

    public SubOrder(int productid, int optionid, int quantity) {
        this.productid = productid;
        this.optionid = optionid;
        this.quantity = quantity;
    }
    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getOptionid() {
        return optionid;
    }

    public void setOptionid(int optionid) {
        this.optionid = optionid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPriceperunit() {
        return priceperunit;
    }

    public void setPriceperunit(double priceperunit) {
        this.priceperunit = priceperunit;
    }
    
}
