/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author pc
 */
public class UserDAO extends DBContext{
    public User check(String username, String password){
        String sql="Select * from [USER] where [username] = ? and [password] = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User a = new User(rs.getInt("id"),
                    rs.getInt("role"),
                    rs.getNString("Name"),
                    rs.getString("phonenumber"),
                    rs.getNString("address"),
                    rs.getBoolean("gender"),
                    rs.getString("username"),
                    rs.getString("Password")
                    );
                return a;
            }
        }
        catch(SQLException e){
            
        }
        return null;
    }
    public User refresh(int uid){
        String sql="Select * from [USER] where ID="+uid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User a = new User(rs.getInt("id"),
                                rs.getInt("role"),
                                rs.getNString("Name"),
                                rs.getString("phonenumber"),
                                rs.getNString("address"),
                                rs.getBoolean("gender"),
                                rs.getString("username"),
                                rs.getString("Password")
                                );
                return a;
            }
        }
        catch(SQLException e){
            
        }
        return null;
    }
    
    public void UpdateName(int uid, String name){
        String sql="UPDATE [dbo].[USER]\n" +
                    "SET [NAME] = N'"+name+"'\n" +
                    "WHERE ID = "+uid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public void UpdatePassword(int uid,String newpass){
        String sql="UPDATE [dbo].[USER]\n" +
                    "SET [PASSWORD] = '"+newpass+"'\n" +
                    "WHERE ID = "+uid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public void UpdatePhone(int uid, String phone){
        String sql="UPDATE [dbo].[USER]\n" +
                    "SET [PHONENUMBER] = '"+phone+"'\n" +
                    "WHERE ID = "+uid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public void UpdateGender(int uid, String gender){
        boolean a = gender.equals("true");
        String sql="UPDATE [dbo].[USER]\n" +
                    "SET [GENDER] = '"+a+"'\n" +
                    "WHERE ID = "+uid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public void UpdateAddress(int uid, String address){
        String sql="UPDATE [dbo].[USER]\n" +
                    "SET [ADDRESS] = N'"+address+"'\n" +
                    "WHERE ID = "+uid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public void RegisterNewAccount(User a){
        String sqlu = "select top 1 ID from [USER] order by [ID] DESC";
        String sql ="INSERT INTO [dbo].[USER]\n" +
                    "([ID]\n" +
                    ",[NAME]\n" +
                    ",[USERNAME]\n" +
                    ",[PASSWORD]\n" +
                    ",[GENDER]\n" +
                    ",[ROLE])\n" +
                    "VALUES (?,?,?,?,?,?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            PreparedStatement stu = connection.prepareStatement(sqlu);
            ResultSet rs = stu.executeQuery();
            rs.next();
            int uid = rs.getInt("ID") +1;
            st.setInt(1, uid);
            st.setNString(2, a.getName());
            st.setString(3, a.getUsername());
            st.setString(4, a.getPassword());
            st.setBoolean(5, a.isGender());
            st.setInt(6, 0);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }

    public boolean isExist(String username) {
        String sql="select * from [USER] where USERNAME ='"+username+"'";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            return rs.next();
        }
        catch(SQLException e){
            
        }
        return false;
    }
}
