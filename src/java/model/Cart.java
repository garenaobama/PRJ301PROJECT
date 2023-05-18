/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class Cart extends Option{
    private int quantity, userid;
    private String adddate;

    public Cart() {
    }

    public Cart(int quantity, int userid, String adddate) {
        this.quantity = quantity;
        this.userid = userid;
        this.adddate = adddate;
    }

    public Cart( int userid, int id, int optionid,int quantity) {
        super(id,optionid);
        this.quantity = quantity;
        this.userid = userid;
    }

    
    public Cart(int id, String name ,int optionid, String optiondescribe, int quantity,double price,  int discount, String adddate) {
        super(optionid, discount, price, optiondescribe, id, name);
        this.quantity = quantity;
        this.adddate = adddate;
    }
    public Cart(int userid,int id, String name ,int optionid, String optiondescribe, int quantity,double price,  int discount, String adddate) {
        super(optionid, discount, price, optiondescribe, id, name);
        this.userid = userid;
        this.quantity = quantity;
        this.adddate = adddate;
    }
    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAdddate() {
        return adddate;
    }

    public void setAdddate(String adddate) {
        this.adddate = adddate;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }
    
}
