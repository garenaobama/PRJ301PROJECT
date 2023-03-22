/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Order;
import model.Status;
import model.SubOrder;

/**
 *
 * @author pc
 */
public class OrderDAO extends DBContext{
    public List<Order> GetAll(){
        String sql="select * from [Order] ORDER BY [ORDERDATE] DESC";
        List<Order> list = new ArrayList<>();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Order a = new Order();
                a.setId(rs.getInt("ID"));
                a.setUserid(rs.getInt("USERID"));
                a.setClientname(rs.getNString("CLIENTNAME"));
                a.setPhonenumber(rs.getString("PHONENUMBER"));
                a.setTotalprice(rs.getDouble("TOTALPRICE"));
                a.setOrderdate(rs.getString("ORDERDATE"));
                a.setStatus(rs.getInt("STATUS"));
                a.setLog(rs.getNString("LOG"));
                list.add(a);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public List<Order> GetAllByQuery(int sid, String orderby, String from, String to, int num){
        int min = num*25 - 25;
        String sql="select * from [Order]\n" +
                    "where CLIENTNAME like '%' ";  
        
        if(sid !=-1){
            sql+= " and [STATUS] = "+sid;
        }
        if(!from.equals("normal")){
            sql += "and ORDERDATE between '"+from+"' and '"+to+"'\n" ;
        }  
        sql+= "\n order by ORDERDATE "+orderby;    
        sql+= "\n Offset "+min+" rows\n";
        sql+= "fetch next 25 row only";
        List<Order> list = new ArrayList<>();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                /*
                Order a = new Order();
                a.setId(rs.getInt("ID"));
                a.setUserid(rs.getInt("USERID"));
                a.setClientname(rs.getNString("CLIENTNAME"));
                a.setPhonenumber(rs.getString("PHONENUMBER"));
                a.setTotalprice(rs.getDouble("TOTALPRICE"));
                a.setOrderdate(rs.getString("ORDERDATE"));
                a.setDeliveryaddress(rs.getNString("DELIVERYADDRESS"));
                a.setStatus(rs.getInt("STATUS"));
                a.setLog(rs.getNString("LOG"));
                list.add(a);
                */
                
                Order a=new Order(rs.getInt("ID"), 
                        rs.getInt("USERID"), 
                        rs.getInt("STATUS"), 
                        rs.getDouble("TOTALPRICE"), 
                        rs.getString("ORDERDATE"),
                        rs.getNString("DELIVERYADDRESS"), 
                        rs.getNString("CLIENTNAME"), 
                        rs.getString("PHONENUMBER"), 
                        rs.getNString("LOG"));
                list.add(a);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return list;
    }
     public List<Order> GetAllOrderByStatus(int stt){
        String sql="select * from [Order] \n" +
                    "WHERE [STATUS] = "+stt+" \n" +
                    "ORDER BY [ORDERDATE] DESC";
        List<Order> list = new ArrayList<>();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Order a = new Order();
                a.setId(rs.getInt("ID"));
                a.setUserid(rs.getInt("USERID"));
                a.setClientname(rs.getNString("CLIENTNAME"));
                a.setPhonenumber(rs.getString("PHONENUMBER"));
                a.setTotalprice(rs.getDouble("TOTALPRICE"));
                a.setOrderdate(rs.getString("ORDERDATE"));
                a.setStatus(rs.getInt("STATUS"));
                a.setLog(rs.getNString("LOG"));
                list.add(a);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return list;
    }
    
     public Order GetOrderById(int id){
        String sql ="select * from [Order]\n" +
                    "where ID ="+id;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Order a=new Order(rs.getInt("ID"), 
                        rs.getInt("USERID"), 
                        rs.getInt("STATUS"), 
                        rs.getDouble("TOTALPRICE"), 
                        rs.getString("ORDERDATE"),
                        rs.getNString("DELIVERYADDRESS"), 
                        rs.getNString("CLIENTNAME"), 
                        rs.getString("PHONENUMBER"), 
                        rs.getNString("LOG"));
                return a;
            }
        }
        catch(SQLException e){
            
        }
        return null;
     } 
    public List<SubOrder> GetAllSubOrderByID (int oid){
        String sql="select * from SUBORDER where ORDERID = "+oid;
        List<SubOrder> list = new ArrayList<>();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                SubOrder so = new SubOrder(rs.getInt("PRODUCTID"), rs.getInt("OPTIONID"), rs.getInt("QUANTITY"), rs.getInt("PRICEPERUNIT"));
                list.add(so);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public List<Order> GetAllOrderByUid (int uid){
        String sql="select * from [ORDER] where USERID = "+uid+" order by ORDERDATE desc";
        List<Order> list = new ArrayList<>();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Order so = new Order(rs.getInt("ID"), rs.getInt("USERID"), rs.getInt("STATUS"), rs.getDouble("TOTALPRICE"), rs.getString("ORDERDATE"), rs.getString("DELIVERYADDRESS"), rs.getNString("CLIENTNAME"), rs.getString("PHONENUMBER"), rs.getNString("LOG"));
                list.add(so);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return list;
    }
    
    public void CreateOrder(Order a, List<SubOrder> listOrder){
        String sqlgettopid="select top 1 id, clientname \n" +
                            "from [order] \n" +
                            "order by (id) desc";
        String sqlorder="INSERT INTO [dbo].[ORDER]\n" +
                        "([ID]\n" +
                        ",[USERID]\n" +
                        ",[CLIENTNAME]\n" +
                        ",[PHONENUMBER]\n" +
                        ",[TOTALPRICE]\n" +
                        ",[STATUS]\n" +
                        ",[LOG]\n" +
                        ",[DELIVERYADDRESS])\n" +
                        "VALUES(?,?,?,?,?,?,?,?)";
        int orderid=0;
        try{
            PreparedStatement st1 = connection.prepareStatement(sqlgettopid);
            PreparedStatement st2 = connection.prepareStatement(sqlorder);
            ResultSet rs = st1.executeQuery();
            while(rs.next()){
                orderid = rs.getInt("id");
                orderid= orderid + 1;
            }
            st2.setInt(1, orderid);
            st2.setInt(2, a.getUserid());
            st2.setNString(3, a.getClientname());
            st2.setString(4, a.getPhonenumber());
            st2.setDouble(5, a.getTotalprice());
            st2.setInt(6, 1);
            st2.setNString(7, "Order submited");
            st2.setNString(8, a.getDeliveryaddress());
            st2.executeUpdate();
            
            CreateSubOrder(orderid, listOrder);
        }
        catch(SQLException e){
            
        }
    }
    public void CreateSubOrder(int orderid, List<SubOrder> listOrder){
        String sqlsuborder="INSERT INTO [dbo].[SUBORDER]\n" +
                        "([ORDERID]\n" +
                        ",[PRODUCTID]\n" +
                        ",[OPTIONID]\n" +
                        ",[QUANTITY]\n" +
                        ",[PRICEPERUNIT])\n" +
                        "VALUES(?,?,?,?,?)";
        try{
            PreparedStatement st = connection.prepareStatement(sqlsuborder);
            for(int i =0;i<listOrder.size();i++){
                SubOrder a = listOrder.get(i);
                st.setInt(1, orderid);
                st.setInt(2, a.getProductid());
                st.setInt(3, a.getOptionid());
                st.setInt(4, a.getQuantity());
                st.setDouble(5, a.getPriceperunit());
                st.executeUpdate();
            }
        }
        catch(SQLException e){
            
        }
    }       
    public List<SubOrder> ListCartToListSubOrder(List<Cart> a){
        List<SubOrder> list = new ArrayList<>();
        for(int i =0; i< a.size();i++){
            Cart nc = a.get(i);
            double priceperunit =nc.getPrice() - nc.getPrice()*nc.getDiscount()/100;
            SubOrder ns = new SubOrder(nc.getId(), nc.getOptionid(), nc.getQuantity(), priceperunit);
            list.add(ns);
        }
        return list;
    }
    public String GetStatusMessage(int id){
        String sql = "select OS.[STATUS] from ORDERSTATUS OS,[ORDER] OD where OS.ID = OD.[STATUS] and OD.ID ="+id;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            rs.next();
            return rs.getNString("STATUS");
        }
        catch(SQLException e){
            
        }
        return "";
    }
    
    public List<Status> GetStatusList(){
        String sql = "select * from ORDERSTATUS ";
        List<Status> list = new ArrayList<>();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Status a = new Status(rs.getInt("ID"), rs.getNString("STATUS"));
                list.add(a);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return null;
    }

    public void UpdateStatus(int oid, int sid) {
        String sql ="UPDATE [dbo].[ORDER]\n" +
                    "SET [STATUS] = "+sid+"\n" +
                    "WHERE [ID] = "+oid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    
    public int CountOrder(){
        String sql="select count(*)[NUM] from [Order] ";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            rs.next();
            return rs.getInt("NUM");
        }
        catch(SQLException e){
            
        }
        return 0;
    }
}
