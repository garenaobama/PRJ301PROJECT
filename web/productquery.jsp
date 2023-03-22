<%-- 
    Document   : productquery
    Created on : Mar 12, 2023, 11:23:24 PM
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
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="css/productquery.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </head>
    <body onload="displaypriceses()">
        <!-- header -->
        <%@include file="header.jsp"%>
        <!-- header -->  
        <!-- content -->
        <!-- content bound -->
        <div id ="content-bound">
            <div id="second-bound">
                <div id="content-sub-bound">
                    <div id="main-content">
                        <div id="top-head-title">
                            <h1 style="margin-top: 10px;">Sản phẩm ${requestScope.purpose} </h1> 
                            <p>Hiển thị 1-50 của ${requestScope.data.size()} kết quả</p>
                            <form id="main-filter-cưanqmo" action="displayquery" method="post">
                                <div style="margin-right: 20px;">
                                <p>Phân loại</p>
                                <select name="cate" class="form-select" aria-label="Default select example">
                                    <option value="-1">Mặc định</option>
                                    <c:forEach items="${sessionScope.catelist}" var="cl">
                                        <c:if test="${cl.id != sessionScope.choosecate}">
                                            <option value="${cl.id}">${cl.name}</option>
                                        </c:if>
                                        <c:if test="${cl.id == sessionScope.choosecate}">
                                            <option selected value="${cl.id}">${cl.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div style="margin-right: 20px;">
                                <p>Sắp xếp theo</p>
                                <select name="orderby" class="form-select" aria-label="Default select example">
                                    <option value="normal">Mặc định</option>
                                  
                                    <c:set value="${sessionScope.chooseorder}" var="sco"></c:set>
                                    <c:set value="asc" var="asc"></c:set>
                                    <c:set value="desc" var="desc"></c:set>
                                    <c:set value="normal" var="norm"></c:set>
                                    <c:if test="${sco == asc}">
                                        <option selected value="asc">Giá: Thấp đến cao</option>
                                        <option value="desc">Giá: Cao đến thấp</option>
                                    </c:if>
                                    <c:if test="${sco == desc}">
                                        <option value="asc">Giá: Thấp đến cao</option>
                                        <option selected value="desc">Giá: Cao đến thấp</option>
                                    </c:if>
                                    <c:if test="${sco == null}">
                                        <option value="asc">Giá: Thấp đến cao</option>
                                        <option value="desc">Giá: Cao đến thấp</option>
                                    </c:if>
                                    <c:if test="${sco == norm}">
                                        <option value="asc">Giá: Thấp đến cao</option>
                                        <option value="desc">Giá: Cao đến thấp</option>
                                    </c:if>
                                </select>
                            </div>
                                <div style="width: 600px;">
                                    <input id="checkbox" type="checkbox">
                                    <label for="checkbox">Khoảng giá : </label>
                                    từ <span id="from-value"><fmt:formatNumber type="number" value="${sessionScope.choosefrom}"/>&nbsp;₫</span> <input name="from" id="from" type="range" class="form-range" min="0" max="3000000000" step="10000000" id="customRange3">
                                    đến <span id="to-value"><fmt:formatNumber type="number" value="${sessionScope.chooseto}"/>&nbsp;₫</span> <input name="to" id="to" type="range" class="form-range" min="0" max="3000000000" step="10000000" id="customRange3">
                                </div>
                                
                                <script>
                                    const from = document.getElementById("from");
                                    const to = document.getElementById("to");
                                    const fromValue = document.getElementById("from-value");
                                    const toValue = document.getElementById("to-value");

                                    from.addEventListener("input", () => {
                                      fromValue.innerHTML = (Number(from.value)).toLocaleString("en-US") +" ₫";
                                      to.min = from.value;
                                      toValue.innerHTML = (Number(to.value)).toLocaleString("en-US") +" ₫";
                                    });

                                    to.addEventListener("input", () => {
                                      toValue.innerHTML = (Number(to.value)).toLocaleString("en-US") +" ₫";
                                    });
                                    
                                    const checkbox = document.getElementById("checkbox");

                                    from.disabled = true; // disable range by default
                                    to.disabled = true; 
                                    checkbox.addEventListener("change", () => {
                                      if (checkbox.checked) {
                                        from.disabled = false; // enable range when checked
                                        to.disabled = false;
                                        } else {
                                            from.disabled = true; // enable range when checked
                                        to.disabled = true;
                                      }
                                    });
                                    function displaypriceses(){
                                        from.disabled = true; // disable range by default
                                        to.disabled = true;
                                    }
                              </script>
                              <input style="display: none" name="pur" value="${requestScope.pur}">
                              <input style="display: none" name="num" value="1">
                                <div style="display: flex;flex-direction: column-reverse">
                                     <button class="btn btn-primary" type="submit">Áp dụng</button>
                                </div>
                            </form>
                        </div>
                        <table class="normal-product-show" style="width: 100%">
                            <tr class="product-show">
                                <c:forEach items="${requestScope.data}" var="d">
                                    <td class="product-show-td">
                                        <a class="product-link" href="ProductDisplay?id=${d.id}">
                                            <div class="img-box-display">
                                                <img class="normal-product-image" src="image/product/${d.id}/1.jpg" alt="alt"/>
                                            </div>
                                            <div class="text-box-display">
                                                <p class="name-display">
                                                    ${d.name}
                                                </p>
                                            </div>
                                        </a>
                                        <p class="price-display">
                                            <fmt:formatNumber type="number" value="${d.price}"/>
                                            ₫
                                        </p>
                                    </td>
                                </c:forEach>
                            </tr>
                        </table>    
                    </div>
                </div>
            </div>
        </div>
        <!--------------------- ###Footer### -----------------------> 
        <%@include file="footer.jsp" %>
    </body>
</html>
