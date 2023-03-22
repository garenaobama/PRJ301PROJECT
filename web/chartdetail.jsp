<%-- 
    Document   : chartdetail
    Created on : Mar 15, 2023, 6:47:37 PM
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
        <% 
            DashDAO dd = new DashDAO(); 
            int y = Integer.parseInt(request.getParameter("year"));
        %>
        <!-- header -->
        <%@include file="adminheader.jsp"%>
        <!-- header -->  
        <!-- content -->
        <!-- content bound -->
        <div id ="content-bound">
            <div id="second-bound">
                <div id="content-sub-bound" style="background:  #f1f1f1">
                    <h1 style="margin-bottom: 30px; margin-right: 20px">Thống kê</h1>
                    <h1>Năm : <%=y%></h1>
                    <div>
                        <div>
                            <h2 id="tongdoanhthu">Tổng doanh thu: <%=String.format("%1$,.0f",dd.GetRevenueBySeason(0,y))%> ₫</h2>
                        </div>
                    </div>
                    <%  
                            double year = dd.GetRevenueBySeason(0,y);
                            double s1 =dd.GetRevenueBySeason(1,y);
                            double s2 =dd.GetRevenueBySeason(2,y);
                            double s3 =dd.GetRevenueBySeason(3,y);
                            double s4 =dd.GetRevenueBySeason(4,y);
                    %>
                    <div  style="text-decoration: none" class="year-fieldsfdsa">
                        <div>
                            <h3>Năm <%=y%> : doanh thu theo quý</h3>

                            <div>
                                <div class="percent-bound"><p>Quý 1 :</p> <div style="width:<%=s1/year *1000   %>px" class="percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", s1/year *100 )%> %</div>
                                <div class="percent-bound"><p>Quý 2 :</p> <div style="width:<%=s2/year *1000   %>px" class="percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", s2/year *100 )%> %</div>
                                <div class="percent-bound"><p>Quý 3 :</p> <div style="width:<%=s3/year *1000   %>px" class="percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", s3/year *100 )%> %</div>
                                <div class="percent-bound"><p>Quý 4 :</p> <div style="width:<%=s4/year *1000   %>px" class="percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", s4/year *100 )%> %</div>
                            </div>
                        </div>
                    </div>
                    <%
                        double m1 = dd.GetRevenueByMonth(1,y);
                        double m2 = dd.GetRevenueByMonth(2,y);
                        double m3 = dd.GetRevenueByMonth(3,y);
                        double m4 = dd.GetRevenueByMonth(4,y);
                        double m5 = dd.GetRevenueByMonth(5,y);
                        double m6 = dd.GetRevenueByMonth(6,y);
                        double m7 = dd.GetRevenueByMonth(7,y);
                        double m8 = dd.GetRevenueByMonth(8,y);
                        double m9 = dd.GetRevenueByMonth(9,y);
                        double m10 = dd.GetRevenueByMonth(10,y);
                        double m11 = dd.GetRevenueByMonth(11,y);
                        double m12 = dd.GetRevenueByMonth(12,y);
                    %>
                    <div id="monthly-chart">
                        <h3>Năm <%=y%> : doanh thu theo tháng</h3>

                        <div style="display: flex;">
                            <div class="ver-percent-bound"><p>tháng 1</p> <div style="height:<%=m1/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m1/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 2</p> <div style="height:<%=m2/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m2/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 3</p> <div style="height:<%=m3/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m3/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 4</p> <div style="height:<%=m4/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m4/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 5</p> <div style="height:<%=m5/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m5/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 6</p> <div style="height:<%=m6/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m6/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 7</p> <div style="height:<%=m7/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m7/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 8</p> <div style="height:<%=m8/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m8/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 9</p> <div style="height:<%=m9/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m9/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 10</p> <div style="height:<%=m10/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m10/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 11</p> <div style="height:<%=m11/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m11/year *100 )%> %</div>
                            <div class="ver-percent-bound"><p>tháng 12</p> <div style="height:<%=m12/year *700   %>px" class="ver-percentage-bar"></div>&nbsp;<%=String.format("%1$,.2f", m12/year *100 )%> %</div>
                        </div>
                    </div>
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
            .ver-percentage-bar{
                width: 50px;
                background: #1883ba;
            }
            .percent-bound{
                display: flex;
                align-items: center;
                margin: 10px;
            }
            .ver-percent-bound{
                display: flex;
                flex-direction: column-reverse;
                align-items: center;
                margin: 10px;
            }
            #monthly-chart{
                 text-decoration: none;
                margin-bottom: 20px;
                border-radius: 10px;
                background: white;
                width: 80%;
                padding-left: 10px;
            }
        </style>
        <%@include file="footer.jsp"%>
    </body>
</html>