<%-- 
    Document   : myaccount
    Created on : Mar 4, 2023, 11:34:20 AM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hồ sơ của tôi - Gỗ Anh Phương</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/user.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
    </head>
    <body onload="showcebox(${requestScope.num})">
        <h1 id="main-title-dscewvc">Thông tin cá nhân</h1>
        <div id="decor-bar-dsacxber"></div>   
        <div>
            <div id="profile-content-bound-cxsajo">
                <div class="infor-title-bound-dsavc">
                    <div class="infor-title-cwonz">Tên:</div> 
                    ${sessionScope.account.name}
                    <button onfocus="goshowchangebox(1)" id="sausagecx1" class="ask-to-change-cyenmo">Thay đổi</button>
                </div><br>
                <div id="sausagecx1a" class="change-info-fieldsacw" style="align-items: center">
                    <form action="UpdateInfo" method="post">
                        <input name="name" value="${sessionScope.account.name}">
                        <input type="submit" value="Lưu">
                        <button onfocus="cancelshowchangebox(1)">Hủy</button>
                    </form>
                        <p style="color: red">${requestScope.ms1}</p>
                </div><br>
                <div class="infor-title-bound-dsavc">
                    <div class="infor-title-cwonz">ID: </div>
                    ${sessionScope.account.id}
                </div><br><br>
                <div class="infor-title-bound-dsavc">
                    <div class="infor-title-cwonz">Tên đăng nhập:</div> 
                    ${sessionScope.account.username}
                </div><br><br>
                <div class="infor-title-bound-dsavc" style="align-items: center">
                    <div class="infor-title-cwonz">Mật khẩu:</div>
                    <div style="display: flex;align-items: center">
                        <div id="password-content">●●●●●●●●●●</div>
                    </div>
                    <button onfocus="goshowchangebox(5)" id="sausagecx5" class="ask-to-change-cyenmo">Thay đổi</button>
                </div> <br>
                <div id="sausagecx5a" class="change-info-fieldsacw" style="flex-direction: column">
                    <br>
                        <form action="UpdateInfo" method="post">
                            <div class="bvmoenxc"><p>Mật khẩu cũ:</p> <input type="password" name="oldpass"></div>
                            <div class="bvmoenxc"><p>Mật khẩu mới:</p> <input type="password" name="newpass"></div>
                            <div class="bvmoenxc"><p>Nhập lại mật khẩu mới:</p> <input type="password" name="newpassagain"></div>
                            <input type="submit" value="Lưu">
                            <button onfocus="cancelshowchangebox(5)">Hủy</button>
                        </form>
                    <p style="color: red">${requestScope.ms}</p>
                </div>
                <br>
                <div class="infor-title-bound-dsavc">
                    <div class="infor-title-cwonz">Số điện thoại: </div>
                    ${sessionScope.account.phone}
                    <button onfocus="goshowchangebox(2)" id="sausagecx2" class="ask-to-change-cyenmo">Thay đổi</button><br>
                </div><br>
                <div id="sausagecx2a" class="change-info-fieldsacw">
                    <form action="UpdateInfo" method="post">
                        <input type="text" name="phone" value="${sessionScope.account.phone}">
                        <input type="submit" value="Lưu">
                        <button onfocus="cancelshowchangebox(2)">Hủy</button>
                    </form>
                </div><br>
                <div class="infor-title-bound-dsavc">
                    <div class="infor-title-cwonz">Giới tính:</div> 
                    <c:if test="${sessionScope.account.gender == true}">
                        Nam
                    </c:if>
                    <c:if test="${sessionScope.account.gender == false}">
                        Nữ
                    </c:if>
                        <button onfocus="goshowchangebox(3)" id="sausagecx3" class="ask-to-change-cyenmo">Thay đổi</button>
                </div><br>
                <div id="sausagecx3a" class="change-info-fieldsacw">
                    <form action="UpdateInfo" method="post">
                        <c:if test="${sessionScope.account.gender == true}">
                            Nam <input type="radio" name = "gender" checked value ="true">
                            Nữ <input type="radio" name = "gender" value ="false">
                        </c:if>
                        <c:if test="${sessionScope.account.gender == false}">
                            Nam <input type="radio" name = "gender" value ="true">
                            Nữ <input type="radio" name = "gender" checked value ="false">
                        </c:if>
                        <input type="submit" value="Lưu">
                        <button onfocus="cancelshowchangebox(3)">Hủy</button>
                    </form>
                </div><br>
                <div class="infor-title-bound-dsavc">
                    <div class="infor-title-cwonz">Địa chỉ: </div>
                    ${sessionScope.account.address}
                    <button onfocus="goshowchangebox(4)" id="sausagecx4" class="ask-to-change-cyenmo">Thay đổi</button> 
                </div><br>
                <div id="sausagecx4a" class="change-info-fieldsacw" style="margin-bottom: 100px;">
                        <form action="UpdateInfo" method="post">
                            <textarea name="address" cols="40" rows="6" style="font-family: sans-serif">${sessionScope.account.address}</textarea>
                            <input type="submit" value="Lưu">
                            <button onfocus="cancelshowchangebox(4)">Hủy</button>
                        </form>
                </div><br>
            </div>
                            
            <div>
                
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
            function goshowchangebox(i){
                var ida="sausagecx"+i+"a";
                document.getElementById(ida).style.display ="flex";
            }
            function cancelshowchangebox(i){
                var ida="sausagecx"+i+"a";
                document.getElementById(ida).style.display ="none";
            }
            function showcebox(i){
                var ida="sausagecx"+i+"a";
                document.getElementById(ida).style.display ="flex";
            }
            /*
            var toggle1 = true;
            const button1 = document.getElementById("sausagecx1");
            const button2 = document.getElementById("sausagecx2");
            const button3 = document.getElementById("sausagecx3");
            const button4 = document.getElementById("sausagecx4");
            // Add a click event listener to the button
            button1.addEventListener("click", event => {
                if(toggle1){
                    document.getElementById("sausagecx11").style.display ="flex";
                }
                else{
                    document.getElementById("sausagecx11").style.display ="none";
                }
                toggle1 = !toggle1;
              console.log(event.target);
            });
            button1.addEventListener("click", event => {
                if(toggle1){
                    document.getElementById("sausagecx11").style.display ="flex";
                }
                else{
                    document.getElementById("sausagecx11").style.display ="none";
                }
                toggle1 = !toggle1;
              console.log(event.target);
            });
            button1.addEventListener("click", event => {
                if(toggle1){
                    document.getElementById("sausagecx11").style.display ="flex";
                }
                else{
                    document.getElementById("sausagecx11").style.display ="none";
                }
                toggle1 = !toggle1;
              console.log(event.target);
            });
            button1.addEventListener("click", event => {
                if(toggle1){
                    document.getElementById("sausagecx11").style.display ="flex";
                }
                else{
                    document.getElementById("sausagecx11").style.display ="none";
                }
                toggle1 = !toggle1;
              console.log(event.target);
            });              
            */
        </script>
    </body>
</html>
