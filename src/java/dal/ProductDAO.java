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
import model.Option;
import model.Product;

/**
 *
 * @author pc
 */
public class ProductDAO extends DBContext{
    public List<Product> GetAll(){
        List<Product> list = new ArrayList<>();
        String sql = "Select * from PRODUCT";
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Product s = new Product();
                s.setId(rs.getInt("ID"));
                s.setName(rs.getString("NAME"));
                s.setCateid(rs.getInt("CATEGORYID"));
                s.setDescribe(rs.getNString("DESCRIBE"));
                s.setMaterial(rs.getNString("MATERIAL"));
                s.setSize(rs.getNString("SIZE"));
                s.setColor(rs.getNString("COLOR"));
                list.add(s);
            }
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public List<Product> GetNumAll(int num){
        int min=num*25 -25;
        List<Product> list = new ArrayList<>();
        String sql =    "Select * from PRODUCT\n" +
                        "ORDER BY ID\n" +
                        "OFFSET "+min+" ROWS \n" +
                        "FETCH NEXT 25 ROWS ONLY";
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Product s = new Product();
                s.setId(rs.getInt("ID"));
                s.setName(rs.getString("NAME"));
                s.setCateid(rs.getInt("CATEGORYID"));
                s.setDescribe(rs.getNString("DESCRIBE"));
                s.setMaterial(rs.getNString("MATERIAL"));
                s.setSize(rs.getNString("SIZE"));
                s.setColor(rs.getNString("COLOR"));
                list.add(s);
            }
            return list;
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public int countProduct(){
        String sql="Select  count(*)[NUMBER] from PRODUCT";
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            rs.next();
            return rs.getInt("NUMBER");
        }
        catch(SQLException e){
            
        }
        return 1;
    }
    //get all product for simple display ( not contain detailed information )
    public List<Option> GetAllProductByCategory(int categoryid){
        List<Option> list = new ArrayList<>();
        String sql = "select P.ID, [NAME],PRICE,DISCOUNT from [OPTION] O, PRODUCT P where O.PRODUCTID = P.ID and O.ID =1 and P.CATEGORYID ="+categoryid;
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Option s = new Option();
                s.setId(rs.getInt("ID"));
                s.setName(rs.getString("NAME"));
                s.setPrice(rs.getDouble("PRICE"));
                s.setDiscount(rs.getInt("DISCOUNT"));
                list.add(s);
            }
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public List<Option> GetNumProductByCategoryDescribe(int pur, int num){
        List<Option> list = new ArrayList<>();
        int min = num*50 - 50;
        String sql ="select P.ID, P.[NAME],PRICE,DISCOUNT\n" +
                    "from [OPTION] O, PRODUCT P , CATEGORY C\n" +
                    "where O.PRODUCTID = P.ID AND P.CATEGORYID = C.ID and O.ID =1 and PURPOSEID = "+pur+"\n" +
                    "ORDER BY P.ID\n" +
                    "OFFSET "+min+" ROWS\n" +
                    "FETCH NEXT 50 ROWS ONLY;";
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Option s = new Option();
                s.setId(rs.getInt("ID"));
                s.setName(rs.getString("NAME"));
                s.setPrice(rs.getDouble("PRICE"));
                s.setDiscount(rs.getInt("DISCOUNT"));
                list.add(s);
            }
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public List<Option> GetNumProductByQueryAttribute(int pur, int num,int cate, double from , double to, String order){
        List<Option> list = new ArrayList<>();
        int min = num*50 -50;
        String sql ="select P.ID, P.[NAME],PRICE,DISCOUNT\n" +
                    "from [OPTION] O, PRODUCT P , CATEGORY C\n" +
                    "where O.PRODUCTID = P.ID AND P.CATEGORYID = C.ID and O.ID =1 ";
        if(pur!= (-1)) {
            sql+=  " and PURPOSEID ="+pur+" ";
        }
        if(cate!= (-1)) {
            sql+= " and CATEGORYID="+cate +" ";
        }
        if(from!= (-1)) {
            sql+= " and (PRICE between "+from+" and "+to+" )\n ";
        }
        if(!order.equals("normal")){
            sql+= "ORDER BY PRICE "+order+"\n";
        }
        else{
            sql+="ORDER BY P.ID\n" ;
        }
        sql+= ("OFFSET "+min+" ROWS ") ;
        sql+= ("FETCH NEXT 50 ROWS ONLY;");
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Option s = new Option();
                s.setId(rs.getInt("ID"));
                s.setName(rs.getString("NAME"));
                s.setPrice(rs.getDouble("PRICE"));
                s.setDiscount(rs.getInt("DISCOUNT"));
                list.add(s);
            }
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public String GetPurposeByID(int pid){
        String sql = "select top 1 PURPOSE from CATEGORY where PURPOSEID = "+pid;
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            rs.next();
            return rs.getNString("PURPOSE");
        }
        catch(SQLException e){
            
        }
        return "";
    }
    public int GetPurposeIdByID(int pid){
        String sql = "select PURPOSEID\n" +
                    "from PRODUCT P, CATEGORY C \n" +
                    "where P.CATEGORYID = C.ID and P.ID ="+pid;
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            rs.next();
            return rs.getInt("PURPOSEID");
        }
        catch(SQLException e){
            
        }
        return 1;
    }
    public List<Option> GetAllProductByCategory(int categoryid,int numberOfProduct){
        List<Option> list = new ArrayList<>();
        String sql = "select top "+numberOfProduct+" P.ID, [NAME],PRICE,DISCOUNT from [OPTION] O, PRODUCT P where O.PRODUCTID = P.ID and O.ID =1 and P.CATEGORYID ="+categoryid;
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Option s = new Option();
                s.setId(rs.getInt("ID"));
                s.setName(rs.getString("NAME"));
                s.setPrice(rs.getDouble("PRICE"));
                s.setDiscount(rs.getInt("DISCOUNT"));
                list.add(s);
            }
        }
        catch(SQLException e){
            
        }
        return list;
    }
    //get some basic information for display : name, id , price , discount
    public Option GetSVIPProductByCategory(int categoryid){
        String sql ="select top 1 P.ID, [NAME],PRICE,DISCOUNT from [OPTION] O, PRODUCT P where O.PRODUCTID = P.ID and O.ID =1 and P.CATEGORYID = "+categoryid+" order by PRICE desc";
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            rs.next(); // first rs is in row 0 so next to row 1 for recording
            Option s = new Option();
            s.setId(rs.getInt("ID"));
            s.setName(rs.getString("NAME"));
            s.setPrice(rs.getDouble("PRICE"));
            s.setDiscount(rs.getInt("DISCOUNT"));
            return s;
        }
        catch(SQLException e){
            
        }
        return null;
    }
    public Product GetProductByID(int id){
        String sql = "select * from product where id= ?";
        Product p = new Product();
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            a.setInt(1, id);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                p.setId(rs.getInt("id"));
                p.setName(rs.getNString("NAME"));
                p.setCateid(rs.getByte("CATEGORYID"));
                p.setDescribe(rs.getNString("describe"));
                p.setMaterial(rs.getNString("material"));
                p.setSize(rs.getNString("size"));
                p.setColor(rs.getNString("color"));
            }
        }
        catch(SQLException e){
            
        }
        return p; 
    }
    public List<Option> GetOptionByProId(int id){
        List<Option> list = new ArrayList<>();
        String sql = "select * from [OPTION] where PRODUCTID = " + id;
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Option s = new Option();
                s.setOptionid(rs.getInt("ID"));
                s.setOptiondescribe(rs.getNString("DESCRIBE"));
                s.setPrice(rs.getDouble("PRICE"));
                s.setDiscount(rs.getInt("DISCOUNT"));
                list.add(s);
            }
        }
        catch(SQLException e){   
        }
        return list;
    }

    public List<Option> GetNumProductBySearchKey(String word) {
        List<Option> list = new ArrayList<>();
        String sql="select P.ID, P.[NAME],PRICE,DISCOUNT\n" +
                    "from [OPTION] O, PRODUCT P , CATEGORY C\n" +
                    "where O.PRODUCTID = P.ID AND P.CATEGORYID = C.ID and O.ID =1 and P.[Name] COLLATE Latin1_General_CI_AI LIKE N'%"+word+"%'\n" +
                    "ORDER BY P.ID DESC\n" +
                    "OFFSET 0 ROWS\n" +
                    "FETCH NEXT 50 ROWS ONLY;";

        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Option s = new Option();
                s.setId(rs.getInt("ID"));
                s.setName(rs.getString("NAME"));
                s.setPrice(rs.getDouble("PRICE"));
                s.setDiscount(rs.getInt("DISCOUNT"));
                list.add(s);
            }
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public List<Option> GetNumProductBySearchKey(String word, String order, double from, double to) {
        List<Option> list = new ArrayList<>();
        String sql="select P.ID, P.[NAME],PRICE,DISCOUNT\n" +
                    "from [OPTION] O, PRODUCT P , CATEGORY C\n" +
                    "where O.PRODUCTID = P.ID AND P.CATEGORYID = C.ID and O.ID =1 and P.[Name] COLLATE Latin1_General_CI_AI LIKE N'%"+word+"%'\n" ;
        if(from!= (-1)) {
            sql+= " and (PRICE between "+from+" and "+to+" )\n ";
        }
        if(!order.equals("normal")){
            sql+= "ORDER BY PRICE "+order+"\n";
        }
        else{
            sql+="ORDER BY P.ID\n" ;
        }
        sql+= ("OFFSET 0 ROWS ") ;
        sql+= ("FETCH NEXT 50 ROWS ONLY;");
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                Option s = new Option();
                s.setId(rs.getInt("ID"));
                s.setName(rs.getString("NAME"));
                s.setPrice(rs.getDouble("PRICE"));
                s.setDiscount(rs.getInt("DISCOUNT"));
                list.add(s);
            }
        }
        catch(SQLException e){
            
        }
        return list;
    }
    public int GetMaxId(){
        String sql = "select top 1 ID from PRODUCT order by ID desc";
        try{
            PreparedStatement a = connection.prepareStatement(sql);
            ResultSet rs = a.executeQuery();
            while(rs.next()){
                return rs.getInt("ID");
            }
        }
        catch(SQLException e){
            
        }
        return 0;
    }
    public void AddProduct(Product pro, Option lo){
        int proid = GetMaxId() +1;
        String sql="INSERT INTO [dbo].[PRODUCT]\n" +
                    "([ID]\n" +
                    ",[NAME]\n" +
                    ",[CATEGORYID]\n" +
                    ",[DESCRIBE]\n" +
                    ",[MATERIAL]\n" +
                    ",[SIZE]\n" +
                    ",[COLOR])\n" +
                    "VALUES (?,?,?,?,?,?,?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, proid);
            st.setNString(2, pro.getName());
            st.setInt(3, pro.getCateid());
            st.setNString(4, pro.getDescribe());
            st.setNString(5, pro.getMaterial());
            st.setNString(6, pro.getSize());
            st.setNString(7, pro.getColor());
            st.executeUpdate();
            AddOption(lo, proid);
        }
        catch(SQLException e){
            
        }
    }
    public void AutoIdAddOption(Option o, int pid)   {
       String sql ="select top 1 o.ID \n" +
                    "from Product p , [OPTION] o\n" +
                    "where p.ID = o.PRODUCTID and p.ID ="+pid+"\n" +
                    "order by  o.ID desc";
       String sql2= "INSERT INTO [dbo].[OPTION]\n" +
                    "([ID]\n" +
                    ",[PRODUCTID]\n" +
                    ",[DESCRIBE]\n" +
                    ",[PRICE]\n" +
                    ",[DISCOUNT])\n" +
                    "VALUES (?,?,?,?,?)";
       try{
            PreparedStatement st = connection.prepareStatement(sql);
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs = st.executeQuery();
            rs.next();
            int oid = rs.getInt("ID") +1;
            //
            st2.setInt(1, oid);
            st2.setInt(2, pid);
            st2.setNString(3, o.getOptiondescribe());
            st2.setDouble(4, o.getPrice());
            st2.setInt(5, o.getDiscount());
            st2.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public void AddOption(Option lo,int pid) {
        String sql= "INSERT INTO [dbo].[OPTION]\n" +
                    "([ID]\n" +
                    ",[PRODUCTID]\n" +
                    ",[DESCRIBE]\n" +
                    ",[PRICE]\n" +
                    ",[DISCOUNT])\n" +
                    "VALUES (?,?,?,?,?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 1);
            st.setInt(2, pid);
            st.setNString(3, lo.getOptiondescribe());
            st.setDouble(4, lo.getPrice());
            st.setInt(5, lo.getDiscount());
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }

    public void DeleteProductById(int pid) {
        String sql ="DELETE FROM [dbo].[OPTION]\n" +
                "      WHERE PRODUCTID = " +pid;
        String sql2 = "DELETE FROM [dbo].[PRODUCT]\n" +
                "      WHERE ID = " +pid;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st.executeUpdate();
            st2.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    public void UpdateProductById(Product pro, Option b) {
        String sql = "UPDATE [dbo].[PRODUCT]\n" +
                    "   SET \n" +
                    "      [NAME] = ?\n" +
                    "      ,[CATEGORYID] = ?\n" +
                    "      ,[DESCRIBE] = ?\n" +
                    "      ,[MATERIAL] = ?\n" +
                    "      ,[SIZE] = ?\n" +
                    "      ,[COLOR] = ?\n" +
                    " WHERE ID = " + pro.getId();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, pro.getName());
            st.setInt(2, pro.getCateid());
            st.setNString(3, pro.getDescribe());
            st.setNString(4, pro.getMaterial());
            st.setNString(5, pro.getSize());
            st.setNString(6, pro.getColor());
            st.executeUpdate();
            UpdateOption(b, pro.getId());
        }
        catch(SQLException e){
            
        }
    }

    private void UpdateOption(Option lo, int id) {
        String sql="UPDATE [dbo].[OPTION]\n" +
                "      SET [DESCRIBE] = ?\n" +
                "      ,[PRICE] = ?\n" +
                "      ,[DISCOUNT] = ?\n" +
                " WHERE [PRODUCTID] ="+ id +" and ID ="+ lo.getOptionid();
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setNString(1, lo.getOptiondescribe());
            st.setDouble(2, lo.getPrice());
            st.setInt(3, lo.getDiscount());
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    
    public void DeleteOpt(int pid, int id){
        String sql ="DELETE FROM [dbo].[OPTION]\n" +
                    "WHERE Productid ="+pid+" and id = "+id;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        }
        catch(SQLException e){
            
        }
    }
    
}
