<%-- 
    Document   : adminpage3
    Created on : Mar 13, 2023, 8:18:54 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="dal.DashDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" type="text/css" href="css/cart.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/cart.css">
        <link rel="stylesheet" type="text/css" href="css/adminpage.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
    </head>
    <body>
        <% DashDAO dd = new DashDAO(); %>
        <!-- header -->
        <%@include file="adminheader.jsp"%>
        <!-- header -->  
        <!-- content -->
        <!-- content bound -->
        <div id ="content-bound">
            <div id="second-bound">
                <div id="content-sub-bound" style="background:  #f1f1f1">
                    <h1 style="margin-bottom: 30px; margin-right: 20px">Thống kê</h1>
                    <div>
                        <div>
                            <h2 id="tongdoanhthu">Tổng doanh thu: <%=String.format("%1$,.0f",dd.Revenue())%> ₫</h2>
                        </div>
                        <h3> Số đơn hàng thành công : <%=dd.NumberOfSuccessfulOrder()%> đơn </h3>
                    </div>
                    <%  
                        for(int y=2023;y>2019;y--){
                            double year = dd.GetRevenueBySeason(0,y);
                            double s1 =dd.GetRevenueBySeason(1,y);
                            double s2 =dd.GetRevenueBySeason(2,y);
                            double s3 =dd.GetRevenueBySeason(3,y);
                            double s4 =dd.GetRevenueBySeason(4,y);
                    %>
                    <a href="Chartdetail?year=<%=y%>" style="text-decoration: none" class="year-fieldsfdsa">
                        <div>
                            <h3>Doanh thu theo quý năm : <%=y%></h3>
                            <h4>Tổng doanh thu năm: <%=String.format("%1$,.0f",year)%> ₫</h4>
                            <div>
                                <div class="percent-bound"><p>Quý 1 :</p> <div style="width:<%=s1/year *1000   %>px" class="percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", s1/year *100 )%> %</div>
                                <div class="percent-bound"><p>Quý 2 :</p> <div style="width:<%=s2/year *1000   %>px" class="percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", s2/year *100 )%> %</div>
                                <div class="percent-bound"><p>Quý 3 :</p> <div style="width:<%=s3/year *1000   %>px" class="percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", s3/year *100 )%> %</div>
                                <div class="percent-bound"><p>Quý 4 :</p> <div style="width:<%=s4/year *1000   %>px" class="percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", s4/year *100 )%> %</div>
                            </div>
                        </div>
                    </a>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <style>
            #tongdoanhthu{
                width: 600px;
                height: 100px;
                display: flex;
                align-items: center;
                background: white;
                border-radius: 10px;
                padding-left: 10px;
                color: crimson;
                font-weight: bold;
            }
            .year-fieldsfdsa{
                text-decoration: none;
                margin-bottom: 20px;
                border-radius: 10px;
                background: white;
                width: 80%;
                padding-left: 10px;
            }
            .year-fieldsfdsa:hover{
                box-shadow: 1px 1px 2px 2px;
            }
            .percentage-bar{
                height: 50px;
                background: #1883ba;
            }
            .percent-bound{
                display: flex;
                align-items: center;
                margin: 10px;
            }
        </style>
    </body>
</html>