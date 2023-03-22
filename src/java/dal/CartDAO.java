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

/**
 *
 * @author pc
 */
public class CartDAO extends DBContext{
    public List<Cart> GetCartbyUserID(int id){
        List<Cart> list = new ArrayList<>();
        String sql ="select c.PRODUCTID,[NAME],o.ID, o.DESCRIBE, QUANTITY, PRICE ,DISCOUNT, ADDDATE\n" +
                    "from cart c, PRODUCT p, [OPTION] o \n" +
                    "where c.PRODUCTID = p.ID and o.ID = c.OPTIONID and p.ID = o.PRODUCTID and c.USERID = ?\n" +
                    "order by ADDDATE desc";
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            a.setInt(1, id);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Cart s = new Cart();
                s.setId(rs.getInt("PRODUCTID"));
                s.setName(rs.getNString("NAME"));
                s.setOptionid(rs.getInt("ID"));
                s.setOptiondescribe(rs.getNString("DESCRIBE"));
                s.setQuantity(rs.getInt("QUANTITY"));
                s.setPrice(rs.getDouble("PRICE"));
                s.setDiscount(rs.getInt("DISCOUNT"));
                s.setAdddate(rs.getString("ADDDATE"));
                list.add(s);
            }
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public Cart GetCartByProId(int proid, int uid){
        String sql= "select c.PRODUCTID,[NAME],o.ID, o.DESCRIBE, QUANTITY, PRICE ,DISCOUNT, ADDDATE\n" +
                    "from cart c, PRODUCT p, [OPTION] o \n" +
                    "where c.PRODUCTID = p.ID and o.ID = c.OPTIONID and p.ID = o.PRODUCTID and c.USERID = ? and p.id = ?";
        Cart s = new Cart();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            st.setInt(2, proid);
            ResultSet rs = st.executeQuery();
            rs.next(); // this is important
            s.setId(rs.getInt("PRODUCTID"));
            s.setName(rs.getNString("NAME"));
            s.setOptionid(rs.getInt("ID"));
            s.setOptiondescribe(rs.getNString("DESCRIBE"));
            s.setQuantity(rs.getInt("QUANTITY"));
            s.setPrice(rs.getDouble("PRICE"));
            s.setDiscount(rs.getInt("DISCOUNT"));
            return s;
        }catch(SQLException e){
            
        }
        return s;
    }
    public void AddToCart(Cart a){
        String sql ="INSERT INTO [dbo].[CART]\n" +
                    "           ([USERID]\n" +
                    "           ,[OPTIONID]\n" +
                    "           ,[PRODUCTID]\n" +
                    "           ,[QUANTITY])\n" +
                    "     VALUES(?,?,?,?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getUserid());
            st.setInt(2, a.getOptionid());
            st.setInt(3, a.getId());
            st.setInt(4, a.getQuantity());
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public void UpdateCart(Cart a){
        String sql= "UPDATE [dbo].[CART]\n" +
                    "SET [OPTIONID] = "+a.getOptionid()+",[QUANTITY] = "+a.getQuantity()+"\n" +
                    "WHERE [USERID] = "+a.getUserid()+" and [PRODUCTID]=" +a.getId();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public boolean isExist(int proid, int userid){
        String sql="select * from CART where PRODUCTID =" +proid+" and USERID="+userid;      
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return true;
            }
            else return false;
        }catch(SQLException e){
            
        }
        return false;
    }
    
    public void DeleteCartByProId(int pid, int uid){
        String sql ="DELETE FROM [dbo].[CART] WHERE PRODUCTID ="+pid+" and USERID = "+uid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }catch(SQLException e){
            
        }
    }
}
