<%-- 
    Document   : cart
    Created on : Mar 6, 2023, 9:50:49 AM
    Author     : pc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" type="text/css" href="css/cart.css">
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
                <div id="content-sub-bound">
                    <div id ="cart-top-bar">
                        <svg width="50px" height="50px" viewBox="0 0 1024 1024" fill="firebrick" class="icon"  version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M800.8 952c-31.2 0-56-24.8-56-56s24.8-56 56-56 56 24.8 56 56-25.6 56-56 56z m-448 0c-31.2 0-56-24.8-56-56s24.8-56 56-56 56 24.8 56 56-25.6 56-56 56zM344 792c-42.4 0-79.2-33.6-84-76l-54.4-382.4-31.2-178.4c-2.4-19.2-19.2-35.2-37.6-35.2H96c-13.6 0-24-10.4-24-24s10.4-24 24-24h40.8c42.4 0 80 33.6 85.6 76l31.2 178.4 54.4 383.2C309.6 728 326.4 744 344 744h520c13.6 0 24 10.4 24 24s-10.4 24-24 24H344z m40-128c-12.8 0-23.2-9.6-24-22.4-0.8-6.4 1.6-12.8 5.6-17.6s10.4-8 16-8l434.4-32c19.2 0 36-15.2 38.4-33.6l50.4-288c1.6-13.6-2.4-28-10.4-36.8-5.6-6.4-12.8-9.6-21.6-9.6H320c-13.6 0-24-10.4-24-24s10.4-24 24-24h554.4c22.4 0 42.4 9.6 57.6 25.6 16.8 19.2 24.8 47.2 21.6 75.2l-50.4 288c-4.8 41.6-42.4 74.4-84 74.4l-432 32c-1.6 0.8-2.4 0.8-3.2 0.8z" fill="" /></svg>
                        <h1 class="cart-title">Giỏ hàng của : </h1>
                        <a id="user-cart-link-pro" class="cart-title" href="#use"><h2 style="font-weight: lighter;">&nbsp; ${sessionScope.account.name}</h2></a>
                    </div>
                    <div id="cart-display" style="display: flex;flex-direction: column;align-items: center; margin-top: 50px;">  
                        <div id="cart-column-info">
                            <div style="width: 35%"><p>Sản phẩm</p></div>
                            <div style="width: 100px"><p>Tùy chọn</p></div>
                            <div style="width: 100px"><p>Đơn giá</p></div>
                            <div style="width: 20px"><p>Sl</p></div>
                            <div style="width: 200px"><p>Tổng tiền &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></div>
                            <div style="width: 140px"><p>Thao tác</p></div>
                        </div>
                        <form style="width: 95%" action="SubmitOrder" method="get">
                            <c:forEach items="${sessionScope.cart}" var="d">
                                <div class="cart-item-bound">
                                    <div class="inner-field-cart" style="display: flex;align-items: center; width: 35%;">
                                        <label class="control control-checkbox">
                                            Chọn
                                            <input class="check-box-list" type="checkbox" name="option" value="${d.id}" price="${(d.price - d.price * d.discount /100) *d.quantity}">
                                            <div class="control_indicator"></div>
                                        </label>
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
                                      
                                    </div>

                                    <div class="inner-field-cart" style="display: flex; width: 20px; align-items: center;">
                                        <p>${d.quantity}</p>
                                    </div>

                                    <div class="inner-field-cart"style="display: flex; width: 200px; align-items: center;">
                                        <p class="final-price-cart"><fmt:formatNumber type="number" value="${(d.price - d.price * d.discount /100) *d.quantity}"/>₫</p>
                                    </div>

                                    <div class="inner-field-cart" style="display: flex;flex-direction: column;align-items: center;justify-content: center; width: 140px; border-radius: 15px;">
                                        <a class="cart-funct-butt"  href="DeleteCart?pid=${d.id}&uid=${sessionScope.account.id}">
                                            <svg class="fdsafdsa-icon" width="25px" height="25px" viewBox="0 0 1024 1024" fill="white" class="icon"  version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M32 241.6c-11.2 0-20-8.8-20-20s8.8-20 20-20l940 1.6c11.2 0 20 8.8 20 20s-8.8 20-20 20L32 241.6zM186.4 282.4c0-11.2 8.8-20 20-20s20 8.8 20 20v688.8l585.6-6.4V289.6c0-11.2 8.8-20 20-20s20 8.8 20 20v716.8l-666.4 7.2V282.4z" fill="white" /><path d="M682.4 867.2c-11.2 0-20-8.8-20-20V372c0-11.2 8.8-20 20-20s20 8.8 20 20v475.2c0.8 11.2-8.8 20-20 20zM367.2 867.2c-11.2 0-20-8.8-20-20V372c0-11.2 8.8-20 20-20s20 8.8 20 20v475.2c0.8 11.2-8.8 20-20 20zM524.8 867.2c-11.2 0-20-8.8-20-20V372c0-11.2 8.8-20 20-20s20 8.8 20 20v475.2c0.8 11.2-8.8 20-20 20zM655.2 213.6v-48.8c0-17.6-14.4-32-32-32H418.4c-18.4 0-32 14.4-32 32.8V208h-40v-42.4c0-40 32.8-72.8 72.8-72.8H624c40 0 72.8 32.8 72.8 72.8v48.8h-41.6z" fill="white" /></svg>
                                            <p class="fdsafdsa-text">&nbsp;Xóa</p>
                                        </a>
                                        <a class="cart-funct-butt"  href="ProductDisplay?id=${d.id}">
                                            <svg class="fdsafdsa-icon" fill="white" width="25px" height="25px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><g><path d="M15,6V1.76l-1.7,1.7A7,7,0,1,0,14.92,9H13.51a5.63,5.63,0,1,1-1.2-4.55L10.76,6Z"/></g></svg>
                                            <p class="fdsafdsa-text">&nbsp; Sửa</p>
                                        </a>
                                        <a class="cart-funct-butt"  href="displayquery?proidn=${d.id}"><p class="fdsafdsa-text">Sp tương tự</p></a>
                                    </div>    
                                </div>
                            </c:forEach>  
                            <div id="fdsavc-submit-buy">
                                <div>
                                    <label class="control control-checkbox">
                                        Chọn tất cả (${sessionScope.cart.size()})
                                        <input id="fdsaf-get-all" type="checkbox">
                                        <div class="control_indicator"></div>
                                    </label>
                                </div>
                                        <div id="fdsa-number-of-selected" style="font-family: sans-serif">
                                    Tổng thanh toán (0 sản phẩm):
                                </div>
                                <div id="dsavcx-sumary-price">
                                    0 ₫
                                </div>
                                <input style="display: none" type="text" name="uid" value="${sessionScope.account.id}">
                                <button id="commit-buy-cart-dsa" type="submit">
                                    Tiến hành đặt mua 
                                </button>
                            </div>
                            <script>   
                                // Get the button element by its id
                                let buttona = document.getElementById("fdsaf-get-all");
                                 // Get all the checkbox elements by their name attribute
                                let checkboxes = document.querySelectorAll("input[name ='option']");
                                // Declare a variable to store the state of the checkboxes
                                let booltog =false;
                                let count =0;
                                // Add a click event listener to the button
                                buttona.addEventListener("click", function() {
                                    console.log(buttona.checked);
                                  // Toggle the state of the variable
                                    booltog=!booltog;
                                  // Loop through all the checkboxes and set them to checked or unchecked based on the variable
                                  checkboxes.forEach(function(checkbox) {
                                      for (let i = 0; i < checkboxes.length; i++) {
                                          if(buttona.checked){
                                              checkboxes[i].checked = true;
                                          }
                                          else{
                                              checkboxes[i].checked = false;;
                                          }
                                      }
                                      if(buttona.checked) count = checkboxes.length;
                                      else count=0;
                                  }); 
                                  document.getElementById("fdsa-number-of-selected").innerHTML="Tổng thanh toán ("+count+" sản phẩm):";
                                  calallbuy();
                                });
                                
                                for (let i = 0; i < checkboxes.length; i++) {
                                    checkboxes[i].addEventListener("click", function() {
                                        
                                        buttona.checked = false;
                                        console.log(buttona.checked);
                                        count=0;
                                        for (let i = 0; i < checkboxes.length; i++) {
                                            if(checkboxes[i].checked) count++;
                                        }
                                    document.getElementById("fdsa-number-of-selected").innerHTML="Tổng thanh toán ("+count+" sản phẩm):";   
                                    calallbuy();
                                    });
                                  }
                                  function calallbuy(){
                                      var checkboxlist = document.getElementsByClassName("check-box-list");
                                      var sum=0;
                                      var formattedPrice;
                                      for (let i = 0; i < checkboxes.length; i++) {
                                          if(checkboxes[i].checked){
                                              sum = sum+Number(checkboxlist[i].getAttribute("price"));
                                              formattedPrice = sum.toLocaleString("en-US");
                                          }
                                      }
                                      if(count===0) formattedPrice =0;
                                      document.getElementById("dsavcx-sumary-price").innerHTML=formattedPrice + " ₫";
                                  }
                            </script>
                        </form>
                        <style>
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
                            .control {
                                font-family: arial;
                                display: block;
                                position: relative;
                                padding-left: 30px;
                                margin-bottom: 5px;
                                padding-top: 3px;
                                cursor: pointer;
                                font-size: 16px;
                            }
                                .control input {
                                    position: absolute;
                                    z-index: -1;
                                    opacity: 0;
                                }
                            .control_indicator {
                                position: absolute;
                                top: 2px;
                                left: 0;
                                height: 20px;
                                width: 20px;
                                background: #8f8585;
                                border: 0px solid #000000;
                                border-radius: 0px;
                            }
                            .control:hover input ~ .control_indicator,
                            .control input:focus ~ .control_indicator {
                                background: #928383;
                            }

                            .control input:checked ~ .control_indicator {
                                background: #c02a43;
                            }
                            .control:hover input:not([disabled]):checked ~ .control_indicator,
                            .control input:checked:focus ~ .control_indicator {
                                background: #ba2f2f;
                            }
                            .control input:disabled ~ .control_indicator {
                                background: #e6e6e6;
                                opacity: 8;
                                pointer-events: none;
                            }
                            .control_indicator:after {
                                box-sizing: unset;
                                content: '';
                                position: absolute;
                                display: none;
                            }
                            .control input:checked ~ .control_indicator:after {
                                display: block;
                            }
                            .control-checkbox .control_indicator:after {
                                left: 8px;
                                top: 4px;
                                width: 3px;
                                height: 8px;
                                border: solid #ffffff;
                                border-width: 0 2px 2px 0;
                                transform: rotate(45deg);
                            }
                            .control-checkbox input:disabled ~ .control_indicator:after {
                                border-color: #7b7b7b;
                            }
                            .control-checkbox .control_indicator::before {
                                content: '';
                                display: block;
                                position: absolute;
                                left: 0;
                                top: 0;
                                width: 3.85rem;
                                height: 3.85rem;
                                margin-left: -1.3rem;
                                margin-top: -1.3rem;
                                background: #ff008a;
                                border-radius: 3rem;
                                opacity: 0.6;
                                z-index: 99999;
                                transform: scale(0);
                            }
                            @keyframes s-ripple {
                                0% {
                                    transform: scale(0);
                                }
                                20% {
                                    transform: scale(1);
                                }
                                100% {
                                    opacity: 0;
                                    transform: scale(1);
                                }
                            }
                            @keyframes s-ripple-dup {
                               0% {
                                   transform: scale(0);
                                }
                               30% {
                                    transform: scale(1);
                                }
                                60% {
                                    transform: scale(1);
                                }
                                100% {
                                    opacity: 0;
                                    transform: scale(1);
                                }
                            }
                            .control-checkbox input + .control_indicator::before {
                                animation: s-ripple 250ms ease-out;
                            }
                            .control-checkbox input:checked + .control_indicator::before {
                                animation-name: s-ripple-dup;
                            }
                        </style>
                    </div>
                </div>
            </div>
        </div>
        <!-- end content -->
        <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
</html>
