<%-- 
    Document   : addoption
    Created on : Mar 15, 2023, 10:12:35 AM
    Author     : pc
--%>

<%-- 
    Document   : addproduct
    Created on : Mar 13, 2023, 10:42:35 PM
    Author     : pc
--%>
<%@page import="model.Category"%>
<%@page import="dal.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div id="second-bound">
                <div id="content-sub-bound">
                    <div style="display: flex;flex-direction: column;">
                        <h1 style="margin-bottom: 30px; margin-right: 20px">Thêm tùy chọn cho sản phẩm id: ${requestScope.pid}</h1>
                        <form action="AddOption" method="post">
                                <div class="mb-3 row">
                                 <label for="text" class="col-sm-2 col-form-label">Mô tả tùy chọn</label>
                                 <div class="col-sm-10">
                                     <input name="opdes" placeholder="nguyên bản" type="text" class="form-control">
                                 </div>
                             </div>
                                
                                <div class="mb-3 row">
                                 <label for="text" class="col-sm-2 col-form-label">Giá thành</label>
                                 <div class="col-sm-10">
                                     <input name="price" type="text" class="form-control">
                                 </div>
                             </div>
                            
                                <div class="mb-3 row">
                                 <label for="text" class="col-sm-2 col-form-label">Giảm giá</label>
                                 <div class="col-sm-10">
                                     <input name="discount" type="text" class="form-control">
                                 </div>
                             </div>
                            <input style="display: none" name="pid" value="${requestScope.pid}">
                                <div class="col-auto">
                                <button type="submit" class="btn btn-primary mb-3">Thêm</button>
                              </div>
                        </form>
                    </div>  
                </div>    
            </div>   
        </div>
             <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
</html>

