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
import model.Category;

/**
 *
 * @author pc
 */
public class CategoryDAO extends DBContext{
    public Category GetCategoryByID(int id){
        String sql = "select * from category where id= ?";
        Category p = new Category();
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            a.setInt(1, id);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                p.setId(rs.getInt("ID"));
                p.setName(rs.getNString("NAME"));
                p.setPurpose(rs.getNString("PURPOSE"));
            }
        }
        catch(SQLException e){
            
        }
        return p; 
    }
    
    public List<Category> GetAllCategoryByPurposeID(int pid){
        String sql ="select [NAME], ID from CATEGORY where PURPOSEID = " +pid;
        List<Category> list = new ArrayList<>();
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setId(rs.getInt("ID"));
                c.setName(rs.getNString("NAME"));
                list.add(c);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public List<Category> GetAllCategory(){
        String sql ="select [NAME], ID from CATEGORY";
        List<Category> list = new ArrayList<>();
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Category c = new Category();
                c.setId(rs.getInt("ID"));
                c.setName(rs.getNString("NAME"));
                list.add(c);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return list;
    }
}
