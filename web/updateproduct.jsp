<%-- 
    Document   : updateproduct
    Created on : Mar 14, 2023, 8:51:37 AM
    Author     : pc
--%>

<%@page import="model.Category"%>
<%@page import="dal.CategoryDAO"%>
<%@page import="model.Product"%>
<%@page import="model.Option"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                ProductDAO pd = new ProductDAO();
                List<Category> d = cd.GetAllCategory();
                Product p = (Product) request.getAttribute("product");
                List<Option> lo = pd.GetOptionByProId(p.getId());
            %>
            <div id="second-bound">
                <div id="content-sub-bound">
                    <div style="display: flex;flex-direction: column;">
                        <h1 style="margin-bottom: 30px; margin-right: 20px">Chỉnh sửa sản phẩm ID : <%=p.getId()%></h1>
                        <div style="display: flex; flex-direction: row;">
                            <div style="width: 70%; margin-right: 20px;">
                                <h2 style="margin-bottom: 30px; margin-right: 20px">Thông tin sản phẩm</h2>
                                <form action="UpdateProduct" method="post">
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Tên sản phẩm</label>
                                        <div class="col-sm-10">
                                            <input value="<%=p.getName()%>" name="name" type="text" class="form-control">
                                        </div>
                                    </div>
                                    Loại sản phẩm <select class="form-select" aria-label="Default select example" name="cateid">
                                        <% 
                                            for(int k=0;k<d.size();k++){
                                            if(p.getCateid() == d.get(k).getId()){
                                        %>
                                        <option selected value="<%=d.get(k).getId()%>" ><%=d.get(k).getName()%></option>
                                        <%  
                                                }
                                                else {
                                        %>
                                        <option value="<%=d.get(k).getId()%>" ><%=d.get(k).getName()%></option>
                                        <%
                                            }
                                        }
                                        %>
                                    </select>
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Mô tả</label>
                                        <div class="col-sm-10">
                                            <input name="describe" value="<%=p.getDescribe()%>" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Chất liệu</label>
                                        <div class="col-sm-10">
                                            <input value="<%=p.getMaterial()%>" name="material" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Kích thước</label>
                                        <div class="col-sm-10">
                                            <input value="<%=p.getSize()%>" name="size" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Màu sắc</label>
                                        <div class="col-sm-10">
                                            <input value="<%=p.getColor()%>" name="color" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <%
                                        for(int i=0;i<lo.size();i++){ 
                                    %>
                                    <div class="mb-3 row">

                                        <label for="text" class="col-sm-2 col-form-label">Tùy chọn : <%=lo.get(i).getOptionid()%> &nbsp;
                                            <%if(lo.size()>1) {%>
                                            <a href="DeleteOption?pid=<%=p.getId()%>&id=<%=lo.get(i).getOptionid()%>">Xóa tùy chọn</a>
                                            <%}%>
                                        </label>
                                        <input type="text" style="display: none;" name="opid" value="<%=lo.get(i).getOptionid()%>">
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Mô tả tùy chọn</label>
                                        <div class="col-sm-10">
                                            <input name="opdes" value="<%=lo.get(i).getOptiondescribe()%>" type="text" class="form-control">
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Giá thành</label>
                                        <div class="col-sm-10">
                                            <input name="price" value="<%=String.format("%1$.0f",lo.get(i).getPrice())%>" type="text" class="form-control">
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label for="text" class="col-sm-2 col-form-label">Giảm giá</label>
                                        <div class="col-sm-10">
                                            <input name="discount" value="<%=lo.get(i).getDiscount()%>" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <a style="margin-bottom: 20px;" href="AddOption?pid=<%=p.getId()%>">thêm tùy chọn</a>
                                    <div class="col-auto">
                                        <input style="display: none;" name="id" value="<%=p.getId()%>">
                                        <button type="submit" class="btn btn-primary mb-3">Cập nhập</button>
                                    </div>
                                </form>
                            </div>
                            <div>
                                <form action="uploadimage" method="post" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label for="formFileMultiple" class="form-label"><h2>Hình ảnh cho sản phẩm</h2></label>
                                        <input style="display: none" name="proid" value="<%=p.getId()%>">
                                        <input class="form-control" name="image" type="file" id="formFileMultiple" multiple>
                                    </div>
                                    <input type="submit" value="Upload">
                                </form>
                                        <div>
                                            <p>Hoặc</p>
                                        </div>
                                   <form action="uploadimage" method="get" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label for="url" class="form-label"><h4>url hình ảnh</h4></label>
                                        <input style="display: none" name="proid" value="<%=p.getId()%>">
                                        <input class="form-control" name="image" type="url" id="formFileMultiple" multiple>
                                    </div>
                                    <input type="submit" value="Upload">
                                </form>     
                            </div>
                        </div>

                    </div>  
                </div>    
            </div>   
        </div>
        <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
</html>
