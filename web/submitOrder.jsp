<%-- 
    Document   : submitOrder
    Created on : Mar 8, 2023, 10:13:43 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
        <link rel="stylesheet" type="text/css" href="css/cart.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
    </head>
    <body onload="showsumaryprice()">
        <!-- header -->
        <%@include file="header.jsp"%>
        <!-- header -->  
        <!-- content -->
        <!-- content bound -->
        <div id ="content-bound">
            <div id="second-bound">
                <div id="content-sub-bound">
                    <div id ="cart-top-bar">
                        <svg width="50px" height="50px" viewBox="0 0 1024 1024" fill="firebrick" class="icon"  version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M800.8 952c-31.2 0-56-24.8-56-56s24.8-56 56-56 56 24.8 56 56-25.6 56-56 56z m-448 0c-31.2 0-56-24.8-56-56s24.8-56 56-56 56 24.8 56 56-25.6 56-56 56zM344 792c-42.4 0-79.2-33.6-84-76l-54.4-382.4-31.2-178.4c-2.4-19.2-19.2-35.2-37.6-35.2H96c-13.6 0-24-10.4-24-24s10.4-24 24-24h40.8c42.4 0 80 33.6 85.6 76l31.2 178.4 54.4 383.2C309.6 728 326.4 744 344 744h520c13.6 0 24 10.4 24 24s-10.4 24-24 24H344z m40-128c-12.8 0-23.2-9.6-24-22.4-0.8-6.4 1.6-12.8 5.6-17.6s10.4-8 16-8l434.4-32c19.2 0 36-15.2 38.4-33.6l50.4-288c1.6-13.6-2.4-28-10.4-36.8-5.6-6.4-12.8-9.6-21.6-9.6H320c-13.6 0-24-10.4-24-24s10.4-24 24-24h554.4c22.4 0 42.4 9.6 57.6 25.6 16.8 19.2 24.8 47.2 21.6 75.2l-50.4 288c-4.8 41.6-42.4 74.4-84 74.4l-432 32c-1.6 0.8-2.4 0.8-3.2 0.8z" fill="" /></svg>
                        <h1 class="cart-title">Đơn hàng của : </h1>
                        <a id="user-cart-link-pro" class="cart-title" href="#use"><h2 style="font-weight: lighter;">&nbsp; ${sessionScope.account.name}</h2></a>
                    </div>
                    <div id="cart-display" style="display: flex;flex-direction: column;align-items: center; margin-top: 50px;">    
                        <form style="width: 95%; display: flex;" action="SubmitOrder" method="post">
                            <div style="width: 35%;display: flex;flex-direction: column ">
                                <div style="display: flex;flex-direction: column; width: 80%">
                                    <h2 style="font-family: sans-serif;color: crimson">Xác nhận thông tin</h2>
                                    <p>Tên khách hàng</p> <input style="height: 40px" name="clientname" type="text" value="${sessionScope.account.name}"> <br>
                                    <p>Tỉnh/thành phố</p> <input style="height: 40px" name="province" type="text"> <br>
                                    <p>Địa chỉ giao hàng</p> <input style="height: 40px" name="address" type="text" value="${sessionScope.account.address}"> <br>
                                    <p>Số điện thoại</p> <input name="phonenumber" style="height: 40px" type="text" value="${sessionScope.account.phone}"> <br>
                                        <p>Tổng giá trị đơn hàng :</p>
                                        <p id="pricesummary"></p>
                                        <input style="display: none" id="totalprice" type="text" name="totalprice">
                                        <p>(Thanh toán khi nhận hàng)</p>
                                        <button id="commit-buy-cart-dsa" type="submit">
                                        Đặt hàng
                                    </button>
                                </div>
                            </div>
                            <div>
                                <div style="width: 100%;" id="cart-column-info">
                                    <div style="width: 35%"><p>Sản phẩm</p></div>
                                    <div style="width: 100px"><p>Tùy chọn</p></div>
                                    <div style="width: 100px"><p>Đơn giá</p></div>
                                    <div style="width: 20px"><p>Sl</p></div>
                                    <div style="width: 200px"><p>Tổng tiền &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></div>
                                </div>
                                <div style="width: 100%">
                                    <c:forEach items="${requestScope.data}" var="d">
                                        <div style="height: 80px; margin-bottom:0;"  class="cart-item-bound">
                                            <div class="inner-field-cart" style="display: flex;align-items: center; width: 35%;">
                                                <a id="fdytrfdsa-link" class="inner-field-cart" href="ProductDisplay?id=${d.id}">
                                                    <img class="cart-product-img" src="image/product/${d.id}/1.jpg">
                                                    <p style="margin-left: 10px;" class="cart-product-name">${d.name}</p>
                                                </a>
                                            </div>

                                            <div class="inner-field-cart" style="display: flex; width: 100px;align-items: center">
                                                <p class="">${d.optiondescribe}</p>
                                            </div>

                                            <div class="inner-field-cart" style="display: flex; width: 100px;align-items: center;justify-content: center;flex-direction: column">
                                                <p class="cart-old-price"><fmt:formatNumber type="number" value="${d.price}"/>₫</p>
                                                <p class="cart-new-price"><fmt:formatNumber type="number" value="${d.price - d.price * d.discount /100}"/>₫</p>
                                                <p style="display: none" class="final-price-per-unit">${d.price - d.price * d.discount /100}</p>
                                            </div>

                                            <div class="inner-field-cart" style="display: flex; width: 20px; align-items: center;">
                                                <p>${d.quantity}</p>
                                            </div>

                                            <div class="inner-field-cart"style="display: flex; width: 200px; align-items: center;">
                                                <p class="final-price-cart"><fmt:formatNumber type="number" value="${(d.price - d.price * d.discount /100) *d.quantity}"/>₫</p>
                                            </div>
                                        </div>
                                     </c:forEach>  
                                    <script>
                                        function showsumaryprice(){
                                            var sum =0 ;
                                            var formattedPrice;
                                            var a = document.getElementsByClassName("final-price-per-unit");
                                            for(var i =0; i< a.length ;i++){
                                                sum = sum + Number(a[i].innerHTML);
                                                formattedPrice = sum.toLocaleString("en-US");
                                            }
                                            document.getElementById("pricesummary").innerHTML=formattedPrice+" ₫";
                                            document.getElementById("totalprice").value = sum;
                                        }
                                    </script>
                                </div>
                            </div>
                        </form>
                        <style>
                            #pricesummary{
                                font-family:'utm_bitsumishi_proregular';
                                font-size: 2.25rem;
                                color: crimson;
                                margin: 0;
                            }
                            #fdytrfdsa-link{
                                display: flex;
                                text-decoration: none;
                                align-items: center;
                                font-family: sans-serif;
                                color: brown;
                            }
                            #fdytrfdsa-link:hover{
                                background: #eee;
                            }
                            .cart-item-bound{
                                width: 100%;
                                display: flex;
                                height: 150px;
                                border-width: 0.5px 0px 0.5px 0px;
                                border-style: solid;
                                border-color: #ccc;
                                justify-content: space-between;
                                align-items: center;
                                margin-bottom: 30px;

                            }
                            .inner-field-cart{
                                height: 100%;
                            }
                            .cart-product-img{
                                height: 60%;
                                border-radius: 15px;
                                margin-left: 10px;
                            }
                            .cart-product-name{
                                font-family:'Arial';
                                font-weight: lighter;
                                font-size: 1rem;
                            }
                            .cart-old-price{
                                text-decoration: line-through;
                                font-size: .75rem;
                            }
                            .final-price-cart{
                                font-family:'utm_bitsumishi_proregular';
                                color: #8f8585;
                                font-size: 1.75rem;
                            }
                        </style>
                    </div>
                </div>
            </div>
        </div>
        <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
</html>
