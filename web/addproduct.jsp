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
            <%
                CategoryDAO cd = new CategoryDAO();
                List<Category> d = cd.GetAllCategory();
            %>
            <div id="second-bound">
                <div id="content-sub-bound">
                    <div style="display: flex;flex-direction: column;">
                        <h1 style="margin-bottom: 30px; margin-right: 20px; color: goldenrod">Thêm sản phẩm</h1>
                        <div style="display: flex; flex-direction: column; width: 80%;">
                            <h2 style="margin-bottom: 30px; margin-right: 20px">Thông tin sản phẩm</h2>
                            <form style="width: 90%" action="AddProduct" method="post">
                                <div class="mb-3 row">
                                    <label for="text" class="col-sm-2 col-form-label">Tên sản phẩm</label>
                                    <div class="col-sm-10">
                                        <input name="name" type="text" class="form-control">
                                    </div>
                                </div>
                                Loại sản phẩm <select class="form-select" aria-label="Default select example" name="cateid">
                                    <% 
                                        for(int k=0;k<d.size();k++){
                                    %>
                                    <option value="<%=d.get(k).getId()%>" ><%=d.get(k).getName()%></option>
                                    <%  
                                        }
                                    %>
                                </select>
                                <div class="mb-3 row">
                                    <label for="text" class="col-sm-2 col-form-label">Mô tả</label>
                                    <div class="col-sm-10">
                                        <input name="describe" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="text" class="col-sm-2 col-form-label">Chất liệu</label>
                                    <div class="col-sm-10">
                                        <input name="material" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="text" class="col-sm-2 col-form-label">Kích thước</label>
                                    <div class="col-sm-10">
                                        <input name="size" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="text" class="col-sm-2 col-form-label">Màu sắc</label>
                                    <div class="col-sm-10">
                                        <input name="color" type="text" class="form-control">
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="text" class="col-sm-2 col-form-label">Mô tả tùy chọn</label>
                                    <div class="col-sm-10">
                                        <input name="opdes" value="nguyên bản" type="text" class="form-control">
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

                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary mb-3">Thêm</button>
                                </div>
                            </form>
                        </div>         
                    </div>  
                </div>    
            </div>   
        </div>
        <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
</html>
