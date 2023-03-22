/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author pc
 */
public class DashDAO extends DBContext{
    public double Revenue(){
        String sql ="select sum(TOTALPRICE)[REVENUE] from [ORDER] where [STATUS] =5";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getDouble("REVENUE");
            }
        }
        catch(SQLException e){
            
        }
        return 0;
    }
    public int NumberOfSuccessfulOrder(){
        String sql ="select count(*)[NUM] from [Order] where [STATUS] =5";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getInt("NUM");
            }
        }
        catch(SQLException e){
            
        }
        return 0;
    }
    public double GetRevenueBySeason(int s, int y){
        String sql = "select sum(TOTALPRICE)[SREVENUE] \n" +
                     "from [ORDER]\n";
        if(s==0){
            sql+= "where ORDERDATE between '1-1-"+y+"' and '12-31-"+y+"'"; // year
        }
        if(s==1){
            sql+= "where ORDERDATE between '1-1-"+y+"' and '3-31-"+y+"'"; // s1
        }
        if(s==2){
            sql+= "where ORDERDATE between '4-1-"+y+"' and '6-30-"+y+"'"; // s2
        }
        if(s==3){
            sql+= "where ORDERDATE between '7-1-"+y+"' and '9-30-"+y+"'"; // s3
        }
        if(s==4){
            sql+= "where ORDERDATE between '10-1-"+y+"' and '12-31-"+y+"'"; // s4
        }
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getDouble("SREVENUE");
            }
        }
        catch(SQLException e){
            
        }
        
        return 0;
    }
    public double GetRevenueByMonth(int m, int y){
        int next = m+1;
        String sql ="DECLARE @year INT = "+y+";\n" +
                    "SELECT sum(TOTALPRICE)[MREVENUE] \n" +
                    "FROM [ORDER]\n" +
                    "WHERE ORDERDATE >= DATEFROMPARTS(@year, "+m+", 1) AND\n" +
                    "      ORDERDATE < DATEFROMPARTS(@year, "+next+", 1);";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getDouble("MREVENUE");
            }
        }
        catch(SQLException e){
            
        }
        
        return 0;
    }
    
}
