<%-- 
    Document   : myorder
    Created on : Mar 9, 2023, 7:17:02 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dal.OrderDAO"%>
<%@page import="model.Order"%>
<%@page import="model.SubOrder"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="main-title-dscewvc">Đơn hàng của tôi</h1>
        <div id="decor-bar-dsacxber"></div>  
            <div>
                <%
                    List<Order> data = (List<Order>)request.getAttribute("order");
                    OrderDAO od = new OrderDAO();   
                    DecimalFormat formatter = new DecimalFormat("#,###.##");
                    for(int i=0;i<data.size();i++){
                    Order a = data.get(i);
                    double finalprice =0;
                %>
                <div class="bound-bill-cenosau">
                    <div class="bill-sec-cndsiou">
                        <div class="sec-field-cvxz" style="display: flex; ">
                            <div class="wqsvrerris">
                                <p>ID hóa đơn: &nbsp;</p>
                                <%=a.getId()%>
                            </div>
                            <div class="wqsvrerris">
                                <p>Ngày tạo: &nbsp;</p>
                                <%=a.getOrderdate()%>
                            </div>
                        </div>
                        <div class="sec-field-cvxz">
                            <p style="margin: 0;">-----------------</p>
                            <p style="margin: 0;">Địa chỉ giao hàng</p>
                            <p style="margin: 0;">----------------------------------------------------------------------------------------</p>
                            Name: <%=a.getClientname()%><br>
                            Phone: <%=a.getPhonenumber()%><br>
                            Address: <%=a.getDeliveryaddress()%>
                        </div>
                        <div class="sec-field-cvxz">
                            <p style="margin: 0;">----------------------------------------------------------------------------------------</p>
                            <p style="margin: 0;">Sản phẩm</p>
                            <p style="margin: 0;">-----------------------</p>
                            <%
                                List<SubOrder> lo = od.GetAllSubOrderByID (a.getId());
                                for(int j=0;j<lo.size();j++){
                                double price= lo.get(j).getPriceperunit();
                                int quantity =lo.get(j).getQuantity();
                                finalprice = finalprice + price * quantity;
                            %>
                            <a href="ProductDisplay?id=<%=lo.get(j).getProductid()%>" style="display: flex; width: 200px;justify-content: space-between;">
                                <div style="width: 200px">Mã <%=lo.get(j).getProductid()%>:
                                    <%=formatter.format(Math.round(price))%></div>
                                <div>x<%=quantity%></div><br>
                            </a>
                            <%
                                }
                            %>
                        </div>
                        <div class="sec-field-cvxz">
                            <p style="margin: 0;">-----------------------</p>
                            <p style="margin: 0;">Tổng tiền: <%=formatter.format(Math.round(finalprice))%> VND</p>
                            <p style="margin: 0;">-----------------------</p>
                        </div>
                    </div>
                    <div class="vmnoiedberis">
                        <p>Trạng thái: &nbsp;</p>
                        <p style="font-family: sans-serif; font-weight: bold"><%=od.GetStatusMessage(a.getId())%></p>
                    </div>    
                </div>
                <%
                    }
                %>
            </div>
    </body>
</html>
