<%-- 
    Document   : user
    Created on : Mar 9, 2023, 7:19:50 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin khách hàng - Gỗ Anh Phương</title>
        <link rel="stylesheet" type="text/css" href="css/cart.css">
        <link rel="stylesheet" type="text/css" href="css/user.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
    </head>
    <body>
        <!-- header -->
        <%@include file="header.jsp"%>
        <!-- header --> 
        <!-- content -->
        <!-- content bound -->
        <div id ="content-bound">
            <div id="second-bound">
                <div id="content-sub-bound" style="min-height: 400px">
                    <div id="" style="display: flex;flex-direction: row; margin-top: 20px; height: 95%">
                        <div id="left-nav-bar">
                            <div id="name-field-part">
                                <div id="side-avatar-field">

                                </div>
                                <div id="username-display-vcxnzuiew">
                                    ${sessionScope.account.username}
                                </div>
                            </div>
                            <div id="decor-bar-dsacxber"></div>    
                            <div>
                                <div class="nav-task-cenoisa">
                                    <div style="display: flex;align-items: center;">
                                        <div class="svg-xzi">
                                            <svg width="20px" height="20px" viewBox="0 0 24 24" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{
                                                fill:none;
                                                stroke:#020202;
                                                stroke-miterlimit:10;
                                                stroke-width:1.91px;
                                            }</style></defs><circle class="cls-1" cx="12" cy="7.25" r="5.73"/><path class="cls-1" d="M1.5,23.48l.37-2.05A10.3,10.3,0,0,1,12,13h0a10.3,10.3,0,0,1,10.13,8.45l.37,2.05"/></svg>
                                        </div>
                                        <a class="a-text-vcxowe" href="UserDetail?index=myprofile">Thông tin cá nhân</a>                              
                                    </div>
                                </div>
                                <div class="nav-task-cenoisa">
                                    <div style="display: flex;align-items: center;">
                                        <div class="svg-xzi">
                                            <svg width="30px" height="30px" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6.50001 5.5C8.50003 5.5 8.50003 8 8.50003 8V9.5M6.50001 5.5C4.5 5.5 4.5 8 4.5 8L4.50001 9.5H8.50003M6.50001 5.5C6.50001 5.5 15.8333 5.5 17.6667 5.5C19.5 5.5 19.5 8.5 19.5 8.5V20L17.6667 19L15.8333 20L14 19L12.1667 20L10.3334 19L8.50003 20V9.5M11 12.5H15M11 9.5H16M11 15.5H16" stroke="#121923" stroke-width="1.2"/></svg>                                    
                                        </div>
                                        <a class="a-text-vcxowe" href="UserDetail?index=myorder">Đơn mua</a>                              
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="infor-display-box">
                            <c:if test="${requestScope.ma == 1}">
                                <%@include file="user/myprofile.jsp" %>
                            </c:if>
                            <c:if test="${requestScope.mo == 1}">
                                <%@include file="user/myorder.jsp" %>
                            </c:if>                                                                                                                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
</html>
