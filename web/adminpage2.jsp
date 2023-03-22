<%-- 
    Document   : adminpage2
    Created on : Mar 13, 2023, 8:18:38 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="model.Option"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/cart.css">
        <link rel="stylesheet" type="text/css" href="css/adminpage.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
    </head>
    <body>
        <!-- header -->
        <%@include file="adminheader.jsp"%>
        <!-- header -->  
        <div id ="content-bound">
            <%
                List<Product> list = (List<Product>) request.getAttribute("data");
                ProductDAO pd = new ProductDAO();
                int numofpro =pd.countProduct();
            %>
            <div id="second-bound">
                <div id="content-sub-bound">
                    <div style="display: flex;align-items: center">
                            <h1 style="margin-bottom: 30px; margin-right: 20px">Sản phẩm</h1>
                            <form action="AdminPage2" method="post" style="width: 200px; margin-right: 20px;">
                                <div class="input-group">
                                    <input name="pid" type="text" class="form-control" placeholder="Nhập mã Sản phẩm">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <a href="AddProduct" style="font-size: 2rem">
                                Thêm sản phẩm
                            </a>
                    </div>
                            <div>
                                Hiển thị 1-25 trong số <%=numofpro%> sản phẩm
                            </div>
                            <div>
                               
                                <div style="display: flex;justify-content: flex-end;align-items: baseline;">
                                    <p style="margin-right: 10px;">Trang </p>
                                    <%
                                        int numpage = 1;
                                        for(int k =numofpro ; k>0;k-=25){
                                        
                                    %>
                                    <a class="num-page-ccwem" href="AdminPage2?num=<%=numpage%>"><%=numpage%></a>
                                    <%
                                        numpage++;
                                        }
                                    %>
                                </div> 
                            </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Image</th>
                                <th scope="col">Name</th>
                                <th scope="col">Describe</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(int i=0;i<list.size();i++){
                            %>
                            <tr>
                                <th scope="row"><%=list.get(i).getId()%></th>
                                <td><img class="image-gdfsocvnew" src="image//product/<%=list.get(i).getId()%>/1.jpg"></td>
                                <td><%=list.get(i).getName()%></td>
                                <td><%=list.get(i).getDescribe()%></td>
                                <td>
                                    <a href="DeleteProduct?id=<%=list.get(i).getId()%>">Delete</a>
                                    <a href="UpdateProduct?id=<%=list.get(i).getId()%>">Update</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
