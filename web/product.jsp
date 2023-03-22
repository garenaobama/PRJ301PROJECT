<%-- 
    Document   : product
    Created on : Mar 2, 2023, 11:53:55 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.Product"%>
<%@page import="model.Option"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.data.name}</title>
        <link rel="stylesheet" type="text/css" href="css/product.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
    </head>
    <body onload="displayPrice()">
        <!-- header -->
        <%@include file="header.jsp"%>
        <!-- header -->                           
        <div id ="content-bound">
            <div id="second-bound">
                <div id="content-sub-bound">
                    <div id="category-path">
                        <a class="category-path-link" href="#linknek">${requestScope.cate.purpose}</a> / 
                        <a class="category-path-link" href="#linknek">${requestScope.cate.name}</a>
                    </div>
                    <div id="content-sub-sub-bound">
                        <div id="image-field-bound">
                            <div id="main-image-bound">
                                <div id="main-image-box">
                                    <img class="main-image" src="image/product/${requestScope.data.id}/1.jpg">
                                    
                                </div>
                            </div>
                            <div id="below-image-bound">
                                <div id="below-image-box">
                                    <div class="small-image-box"><img class="small-image" src="image/product/${requestScope.data.id}/1.jpg"></div>
                                    <div class="small-image-box"><img class="small-image" src="image/product/${requestScope.data.id}/2.jpg"></div>
                                    <div class="small-image-box"><img class="small-image" src="image/product/${requestScope.data.id}/3.jpg"></div>
                                    <div class="small-image-box"><img class="small-image" src="image/product/${requestScope.data.id}/4.jpg"></div>
                                </div>
                            </div>
                        </div>
                        <div id="info-field-bound">
                            <h1 id="product-title">${requestScope.data.name}</h1>
                            <div id="line-decor"></div>
                            <c:if test="${requestScope.data.describe != null}"><h3 class="information-text">${requestScope.data.describe}</h3></c:if>
                            <c:if test="${requestScope.data.material != null}">
                                <h2 style="color : rgb(171,141,66);display: inline" class="information-text">Chất liệu: </h2>
                                <h3 style="display: inline" class="information-text">
                                    ${requestScope.data.material}
                                </h3>
                            </c:if>
                            <c:if test="${requestScope.data.size != null}">
                                <h2 style="color : rgb(171,141,66); margin-bottom: 0;" class="information-text">Kích thước: </h2>
                                <h3 style="margin-top: 0;" class="information-text">
                                    <%
                                        Product p =(Product)request.getAttribute("data");
                                        String size = p.getSize();
                                        String ms ="";
                                        for(int i =0;i<size.length();i++){
                                            if(size.charAt(i) == '+'){
                                                ms+="<br>";
                                            }
                                            ms+=size.charAt(i);   
                                        }
                                        out.print(ms);
                                    %>
                                </h3>
                            </c:if>
                            <c:if test="${requestScope.data.color != null}">
                                <h2 style="color : rgb(171,141,66);display: inline" class="information-text">Màu sắc: </h2>
                                <h3 style="display: inline;" class="information-text">
                                    ${requestScope.data.color}
                                </h3>
                            </c:if>
                            <br/>
                            <h2 style="color : rgb(171,141,66); display: inline" class="information-text">Bảo hành: </h2>
                            <h3 style="display: inline" class="information-text">
                                5 năm, bảo trì vĩnh viễn
                            </h3>
                            <br/>
                            <%
                                   List<Option> o = (List<Option>) request.getAttribute("choice");
                            %>
                            <div id="client-purchase-bound">
                                <div id="select-price-box">
                                    <div id="price-box">
                                        <div id="price-box-sub">
                                            <h3 id="old-price-display"></h3>
                                            <h2 id="price-display"></h2>
                                        </div>
                                        <div id="discount-box">
                                            <h3 id="discount-display"></h3>
                                            <div id="decor-discount-box"></div>
                                        </div>
                                    </div>


                                    <form id="addtocartform" action="addtocart" method="post">
                                        <select name="optionid" id="my-select" onchange="displayPrice()">
                                            <c:forEach var="item" items="${requestScope.choice}">
                                                <option class="option-bar" value="${item.optionid}" price="${item.price}" discount="${item.discount}">${item.optiondescribe}</option>
                                            </c:forEach>
                                        </select>
                                        <input style="display: none;" type="text"  name="userid" value="${sessionScope.account.id}">
                                        <input style="display: none;" type="text"  name="proid" value="${requestScope.data.id}">
                                        <div style="display: flex; flex-direction: column">
                                            <div class="counter">
                                                <button type="button" id="minus">-</button>
                                                <input id="quantity" name="num" type="number" value="1" min="1">
                                                <button type="button" id="plus">+</button>
                                            </div>
                                            <button id="submit-add-to-cart" type="submit" value="submit">
                                                <svg width="30px" height="30px" viewBox="0 0 32 32" id="svg5" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">

                                                    <<defs id="defs2"/>

                                                    <g id="layer1" transform="translate(-252,-244)">

                                                    <path style="fill:white" d="m 261,268.00586 c -1.64501,0 -3,1.35499 -3,3 0,1.64501 1.35499,3 3,3 1.64501,0 3,-1.35499 3,-3 0,-1.64501 -1.35499,-3 -3,-3 z m 0,2 c 0.56413,0 1,0.43587 1,1 0,0.56413 -0.43587,1 -1,1 -0.56413,0 -1,-0.43587 -1,-1 0,-0.56413 0.43587,-1 1,-1 z" id="circle1799" style="color:#000000;fill:#000000;fill-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4.1;-inkscape-stroke:none"/>

                                                    <path style="fill:white" d="m 275,268.00586 c -1.64501,0 -3,1.35499 -3,3 0,1.64501 1.35499,3 3,3 1.64501,0 3,-1.35499 3,-3 0,-1.64501 -1.35499,-3 -3,-3 z m 0,2 c 0.56413,0 1,0.43587 1,1 0,0.56413 -0.43587,1 -1,1 -0.56413,0 -1,-0.43587 -1,-1 0,-0.56413 0.43587,-1 1,-1 z" id="circle1801" style="color:#000000;fill:#000000;fill-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4.1;-inkscape-stroke:none"/>

                                                    <path style="fill:white" d="m 255,246.00586 a 1,1 0 0 0 -1,1 1,1 0 0 0 1,1 h 1.17969 l 2.65039,13.24219 C 257.7593,261.70823 257,262.77542 257,264.00586 c 0,1.6447 1.3553,3 3,3 h 17 a 1,1 0 0 0 1,-1 1,1 0 0 0 -1,-1 h -17 c -0.5713,0 -1,-0.4287 -1,-1 0,-0.5713 0.4287,-1 1,-1 h 15 A 1,1 0 0 0 275.0293,263 H 278 a 1.0001,1.0001 0 0 0 0.98828,-0.84375 l 0.93945,-5.96875 a 1,1 0 0 0 -0.83203,-1.14453 1,1 0 0 0 -1.14453,0.83398 L 277.14453,261 h -16.32422 l -1.80078,-8.99414 h 12.08399 a 1,1 0 0 0 1,-1 1,1 0 0 0 -1,-1 h -12.48438 l -0.63867,-3.19531 A 1.0001,1.0001 0 0 0 257,246.00586 Z" id="path1803" style="color:#000000;fill:#000000;fill-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4.1;-inkscape-stroke:none"/>

                                                    <path style="fill:white" d="m 276,246.00586 c -3.30186,0 -6,2.69814 -6,6 0,3.30186 2.69814,6 6,6 3.30186,0 6,-2.69814 6,-6 0,-3.30186 -2.69814,-6 -6,-6 z m 0,2 c 2.22098,0 4,1.77902 4,4 0,2.22098 -1.77902,4 -4,4 -2.22098,0 -4,-1.77902 -4,-4 0,-2.22098 1.77902,-4 4,-4 z" id="circle1805" style="color:#000000;fill:#000000;fill-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4.1;-inkscape-stroke:none"/>

                                                    <path style="fill:white" d="m 276,249.00586 a 1,1 0 0 0 -1,1 v 1 h -1 a 1,1 0 0 0 -1,1 1,1 0 0 0 1,1 h 1 v 1 a 1,1 0 0 0 1,1 1,1 0 0 0 1,-1 v -1 h 1 a 1,1 0 0 0 1,-1 1,1 0 0 0 -1,-1 h -1 v -1 a 1,1 0 0 0 -1,-1 z" id="path1807" style="color:#000000;fill:#000000;fill-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4.1;-inkscape-stroke:none"/>

                                                    </g>

                                                </svg>
                                                Thêm vào giỏ hàng
                                                   
                                            </button>
                                        </div>
                                    </form>
                                    <script>
                                        // Get the elements
                                        var minus = document.getElementById("minus");
                                        var plus = document.getElementById("plus");
                                        var quantity = document.getElementById("quantity");
                                        // Add event listeners for the buttons
                                        minus.addEventListener("click", function () {
                                            // Decrease the quantity by 1 if it is greater than 1
                                            if (quantity.value > 1) {
                                                quantity.value--;
                                            }
                                        });

                                        plus.addEventListener("click", function () {
                                            // Increase the quantity by 1
                                            quantity.value++;

                                        });
                                        quantity.addEventListener("input", function () {
                                            // Use a regular expression to check if the input value is a positive integer
                                            var regex = /^\d+$/;

                                            // If the input value is not a positive integer, reset it to 1
                                            if (!regex.test(quantity.value)) {
                                                quantity.value = 1;
                                            }
                                        });
                                    </script>
                                </div>
                                <div id="purchase-now-decor-line">
                                    <div class="purchase-decor-line"></div>
                                    <p style="color: #ccc">Hoặc</p>
                                    <div class="purchase-decor-line"></div>
                                </div>
                                <div style="display: flex;justify-content: center;">
                                    <form action="GoToCart">
                                        <input id="create-order-now-button" type="submit" value="Tiến hành đặt mua ngay">
                                    </form>
                                </div>
                            </div>
                            <script>
                                function displayPrice() {
                                    // get the selected option element
                                    var option = document.getElementById("my-select").options[document.getElementById("my-select").selectedIndex];
                                    // get the price and discount attributes from the option element
                                    var price = option.getAttribute("price");
                                    var discount = option.getAttribute("discount");
                                    // convert the price and discount attributes from strings to numbers
                                    discount = Number(discount);
                                    price = Number(price);
                                    // calculate the final price after applying the discount
                                    var finalPrices = price - (price * discount / 100);
                                    var formattedPrice = finalPrices.toLocaleString("en-US");
                                    if (discount !== 0) {
                                        document.getElementById("discount-box").style.display = "flex";
                                        document.getElementById("old-price-display").innerHTML = price.toLocaleString("en-US") + " ₫";
                                        document.getElementById("discount-display").innerHTML = "- " + discount + " %";
                                    }
                                    if (discount === 0) {
                                        document.getElementById("old-price-display").innerHTML = "";
                                        document.getElementById("discount-box").style.display = "none";
                                    }
                                    document.getElementById("price-display").innerHTML = formattedPrice + " ₫";
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>  

        </div>
        <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
    <!-- MDB -->
</html>
