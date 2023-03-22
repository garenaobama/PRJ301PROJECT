<%-- 
    Document   : signup
    Created on : Mar 12, 2023, 2:38:10 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập tài khoản - tha hồ chọn lựa tại Gỗ Anh Phương</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
    </head>
    <body>
        <div style="display: flex; align-items: center;">
            <a href="index" id="home-button">
                <svg id="logo" version="1.0" xmlns="http://www.w3.org/2000/svg"
                     viewBox="0 0 300.000000 300.000000"
                     preserveAspectRatio="xMidYMid meet">
                <g transform="translate(0.000000,300.000000) scale(0.100000,-0.100000)"
                   fill="#000000" stroke="none">
                <path class="theme" d="M2137 2880 c-4 -8 -18 -49 -33 -90 -28 -79 -79 -184 -113 -235 -12
                      -16 -21 -33 -21 -36 0 -3 19 -12 43 -18 23 -7 70 -29 104 -47 68 -38 112 -96
                      177 -234 20 -41 36 -71 36 -67 0 18 -55 258 -95 417 -58 227 -91 329 -98 310z"/>
                <path class="theme" d="M670 2579 c0 -2 9 -32 20 -67 28 -90 56 -292 87 -642 27 -288 28
                      -330 25 -770 -1 -256 -6 -602 -11 -770 -5 -168 -8 -306 -7 -307 1 -2 44 190
                      95 425 51 235 100 458 108 495 32 143 62 154 389 139 203 -9 239 -13 256 -28
                      47 -43 147 -302 263 -681 94 -304 97 -312 91 -253 -15 165 -69 1050 -64 1055
                      8 9 99 -38 121 -63 21 -23 37 -114 61 -352 15 -147 35 -400 37 -465 0 -16 12
                      35 25 115 13 80 43 249 65 375 46 259 48 364 11 483 -23 70 -85 180 -116 203
                      -12 9 -73 40 -136 69 -117 54 -155 79 -165 111 -8 25 31 134 65 185 49 70 131
                      154 151 154 10 0 37 -7 59 -16 45 -18 53 -38 65 -154 16 -151 44 -252 100
                      -365 30 -60 55 -116 55 -122 0 -7 4 -13 9 -13 10 0 21 122 21 235 0 302 -72
                      586 -193 768 -25 38 -47 55 -104 84 -68 34 -76 35 -145 30 -90 -6 -189 -37
                      -249 -77 -60 -39 -111 -114 -198 -290 -40 -80 -78 -153 -86 -164 -13 -17 -20
                      -15 -146 50 -72 38 -151 86 -175 107 -63 55 -168 191 -283 366 -55 85 -101
                      152 -101 150z m475 -762 c63 -31 120 -57 126 -57 6 0 8 -7 5 -15 -32 -85 -48
                      -163 -43 -214 11 -128 86 -203 252 -253 l60 -18 -55 6 c-150 15 -334 54 -407
                      85 -71 30 -94 99 -109 331 -3 59 -3 137 1 173 l7 64 24 -23 c14 -12 77 -48
                      139 -79z"/>
                </g>
                </svg>
                <h1 class="theme" style="font-family:'utm_bitsumishi_proregular';font-weight: lighter; font-size: 1.5rem; text-decoration: none; ">GỖ ANH PHƯƠNG</h1>
            </a>
            <h2  style="font-family:'utm_bitsumishi_proregular'; font-weight: lighter; color: black" class="theme">&nbsp; ▶ Tạo tài khoản<h2>
                    </div>

                    <!--body part -->
                    <div id="login-form-bound" style="height: 700px">
                        <div id="login-form-sub-bound" style="height: 700px">
                            <div id="login-form-sub-sub-bound" style="height: 700px">
                                <img id="saleposter" src="image/saleposter.jpg">
                                <div id="login-box-bound" style="height: 650px">
                                    <div id="login-box">
                                        <h2 style="margin-bottom: 0" id="login-title">Tạo tài khoản</h2>
                                        <form action="Register" method="post" id="login-form">
                                            <p style="width: 100%">Họ và tên : </p>
                                            <input style="margin-bottom: 0" class="input-text" type="text" name="name" placeholder="Họ và tên">
                                            <div style="width: 100%"><div style="width: 70%; display: flex; align-items: center;"><p style="width: 100%">Giới tính : </p> Nam<input name="gender" value="true" checked style="margin-right: 20px;" type="radio">  Nữ <input name="gender" value ="false" type="radio"></div></div>
                                            <p style="width: 100%">Tên đăng nhập : </p>
                                            <input style="margin-bottom: 0" class="input-text" type="text" name="username" placeholder="Email/Số điện thoại/Tên đăng nhập">
                                            <p style="width: 100%">Mật khẩu : </p>
                                            <input style="margin-bottom: 0;" class="input-text" type="password" name="password" placeholder="Mật khẩu ít nhất 6 kí tự">
                                            <p style="width: 100%">Nhập lại mật khẩu : </p>
                                            <input style="margin-bottom: 0;" class="input-text" type="password" name="passwordagain" placeholder="Mật khẩu">
                                            <p style="width: 100%; color: red;">${requestScope.ms}</p>
                                            <input style="margin-bottom: 0" id="submit-button" type="submit" value="ĐĂNG KÍ">
                                        </form>
                                        <div style="margin-top: 20px;">
                                            <div style="display: flex;justify-content: space-around;align-items: center;">
                                                <div class="decor"></div> 
                                                <span style="color:#ccc;font-size: 0.85rem;">HOẶC</span>
                                                <div class="decor"></div>
                                            </div>
                                            <div style="display: flex; font-size: smaller;color:#7a7a7a; margin-top: 20px;">
                                                Bạn đã có tài khoản ? &nbsp;
                                                <a style="text-decoration: none;color:rgb(255, 120, 42); " href="login">Đăng nhập ngay</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--footer part -->
                    <%@ include file="footer.jsp" %>
                    <!--end of footer part -->
                    </body>
                    </html>
