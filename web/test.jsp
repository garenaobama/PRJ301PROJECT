<%-- 
    Document   : test
    Created on : Mar 4, 2023, 2:43:10 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow-x:hidden">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="margin: 0;">
        <%@ include file="header.jsp" %>
        <h1>Cart size : ${requestScope.data.size()}</h1>
        <%@ include file="footer.jsp" %>
        <div class="infor-title-bound-dsavc" style="align-items: center">
                    <div class="infor-title-cwonz">Mật khẩu:</div>
                    <div style="display: flex;align-items: center">
                        <div id="password-content">●●●●●●●●●●</div>
                        <div onclick="showpassword()" id="showpassword">
                            <svg class="eyes-gfdsovdxui-svg" id="closed-eye-caodsav" width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M20 14.8335C21.3082 13.3317 22 12 22 12C22 12 18.3636 5 12 5C11.6588 5 11.3254 5.02013 11 5.05822C10.6578 5.09828 10.3244 5.15822 10 5.23552M12 9C12.3506 9 12.6872 9.06015 13 9.17071C13.8524 9.47199 14.528 10.1476 14.8293 11C14.9398 11.3128 15 11.6494 15 12M3 3L21 21M12 15C11.6494 15 11.3128 14.9398 11 14.8293C10.1476 14.528 9.47198 13.8524 9.1707 13C9.11386 12.8392 9.07034 12.6721 9.04147 12.5M4.14701 9C3.83877 9.34451 3.56234 9.68241 3.31864 10C2.45286 11.1282 2 12 2 12C2 12 5.63636 19 12 19C12.3412 19 12.6746 18.9799 13 18.9418" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            <svg class="eyes-gfdsovdxui-svg" id="open-eye-caodsav" width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 5C5.63636 5 2 12 2 12C2 12 5.63636 19 12 19C18.3636 19 22 12 22 12C22 12 18.3636 5 12 5Z" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15Z" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </div>
                    </div>
                </div>
         <script>
            var toggle = true;
            function showpassword() {
                if (toggle) {
                    document.getElementById("password-content").innerHTML = "${sessionScope.account.password}";
                    document.getElementById("open-eye-caodsav").style.display ="none";
                    document.getElementById("closed-eye-caodsav").style.display ="block";
                    toggle = !toggle;
                } else {
                    toggle = !toggle;
                    document.getElementById("password-content").innerHTML = "●●●●●●●●●●";
                    document.getElementById("open-eye-caodsav").style.display ="block";
                    document.getElementById("closed-eye-caodsav").style.display ="none";
                }
            }
        </script>
    </body>
</html>
