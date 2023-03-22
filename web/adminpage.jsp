<%-- 
    Document   : adminpage
    Created on : Feb 28, 2023, 10:20:06 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order"%>
<%@page import="model.Status"%>
<%@page import="model.SubOrder"%>
<%@page import="dal.OrderDAO"%>
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
            <div id="second-bound">
                <div id="content-sub-bound">
                    <%
                                    List<Order> d =(List<Order>) request.getAttribute("data");
                                    
                                    OrderDAO od = new OrderDAO();
                                    int numofpro = od.CountOrder();
                                    List<Status> ls = od.GetStatusList();
                    %>
                    <div style="display: flex;align-items: center">
                        <h1 style="margin-bottom: 30px; margin-right: 20px">Đơn hàng</h1>
                        <form action="AdminPage" method="post" style="width: 200px; margin-right: 20px;">
                            <div class="input-group">
                                <input name="oid" type="text" class="form-control" placeholder="Nhập mã Order">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <form action="AdminPage" method="get" style="border: 1px solid black; padding: 10px;">
                            Hiện thị danh sách theo: <select name="sid">

                                <option value="-1">Tất cả</option>
                                <%
                                    for(int k=0;k<ls.size();k++){
                                %>
                                <option value=<%=ls.get(k).getId()%>><%=ls.get(k).getStatus()%></option>
                                <%  
                                    }
                                %>
                            </select>
                            &nbsp; Sắp xếp danh sách theo: <select name="orderby">
                                <option value="desc">Mới nhất</option>
                                <option value="asc">Cũ nhất</option>
                            </select>
                            từ <input name="dfrom" type="date">
                            đến <input name="dto" type="date">
                            <input type="submit" value="Lọc">
                        </form>
                    </div>
                    <div>
                        Hiển thị 1-25 trong số <%=numofpro%> đơn hàng
                    </div>
                    <div>

                        <div style="display: flex;justify-content: flex-start;align-items: baseline;">
                            <p style="margin-right: 10px;">Trang </p>
                            <%
                                int numpage = 1;
                                for(int k =numofpro ; k>0;k-=25){
                                        
                            %>
                            <a class="num-page-ccwem" href="AdminPage?num=<%=numpage%>"><%=numpage%></a>
                            <%
                                numpage++;
                                }
                            %>
                        </div> 
                    </div>
                    <div style="display: flex; justify-content: space-between">
                        <table style="width: 70%" class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Order ID</th>
                                    <th scope="col">User ID</th>
                                    <th scope="col">Client name</th>
                                    <th scope="col">Phone number</th>
                                    <th scope="col">Order date</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for(int i=0;i<d.size();i++){
                                %>
                                <tr>
                                    <th><%=d.get(i).getId()%></th>
                                    <td><%=d.get(i).getUserid()%></td>
                                    <td><%=d.get(i).getClientname()%></td>
                                    <td><%=d.get(i).getPhonenumber()%></td>
                                    <td><%=d.get(i).getOrderdate()%></td>
                                    <td><%=od.GetStatusMessage(d.get(i).getId())%></td>
                                    <td>
                                        <a href="AdminPage?func=showdetail&oid=<%=d.get(i).getId()%>">Cập nhập</a>
                                    </td>
                                </tr>
                                <%
                                    }

                                    int oid=1;
                                    if(request.getParameter("oid")==null){
                                        oid=1;
                                    }
                                    else{
                                        oid =Integer.parseInt((String)request.getParameter("oid"));
                                    }
                                    List<SubOrder> so = od.GetAllSubOrderByID (oid);
                                %>
                            </tbody>
                        </table>
                        <div  style="width: 25%; display: flex;flex-direction: column;">
                            <div>
                                <h3>Thông tin đơn hàng id : <%=oid%> </h3>
                            </div>
                            <div>
                                <form action="AdminPage">
                                    <input style="display: none" name="oid" value="<%=oid%>">
                                    <input style="display: none" name="func" value="UpdateStatus">
                                    Cập nhập trạng thái <select name="sid">
                                        <%
                                            for(int i =0; i<ls.size();i++){
                                        %>
                                        <option value=<%=ls.get(i).getId()%>><%=ls.get(i).getStatus()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                    <input type="submit" value="save">
                                </form>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Product ID</th>
                                        <th scope="col">Option ID</th>
                                        <th scope="col">Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for(int i=0;i<so.size();i++){
                                    %>
                                    <tr>
                                        <td><%=so.get(i).getProductid()%></td>
                                        <td><%=so.get(i).getOptionid()%></td>
                                        <td><%=so.get(i).getQuantity()%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    <tr>
                                <br>
                                <p>-------------------------------Địa chỉ----------------------------</p>
                                <%=od.GetOrderById(oid).getDeliveryaddress()%>
                                <p>----------------------------------------------------------------------</p>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
</html>
