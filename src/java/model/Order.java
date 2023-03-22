/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author pc
 */
public class Order {
    int id,userid,status;
    double totalprice;
    String orderdate,deliveryaddress,clientname,phonenumber,log;

    public Order() {
    }

    public Order(int id, int userid, int status, double totalprice, String orderdate, String deliveryaddress, String clientname, String phonenumber, String log) {
        this.id = id;
        this.userid = userid;
        this.status = status;
        this.totalprice = totalprice;
        this.orderdate = orderdate;
        this.deliveryaddress = deliveryaddress;
        this.clientname = clientname;
        this.phonenumber = phonenumber;
        this.log = log;
    }
    public Order(int userid,String clientname, String phonenumber, double totalprice, String deliveryaddress ) {
        this.userid = userid;
        this.totalprice = totalprice;
        this.deliveryaddress = deliveryaddress;
        this.clientname = clientname;
        this.phonenumber = phonenumber;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public String getDeliveryaddress() {
        return deliveryaddress;
    }

    public void setDeliveryaddress(String deliveryaddress) {
        this.deliveryaddress = deliveryaddress;
    }

    public String getClientname() {
        return clientname;
    }

    public void setClientname(String clientname) {
        this.clientname = clientname;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }
    
    
}
