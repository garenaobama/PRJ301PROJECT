<%-- 
    Document   : adminheader
    Created on : Mar 12, 2023, 5:07:40 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/header.css">
        <link rel="stylesheet" href="webfont/stylesheet.css" type="text/css" charset="utf-8"/>
    </head>
    <body style="margin: 0">
        <div id="header">
            <a href="index" id="left-section">
                <svg id="logo" version="1.0" xmlns="http://www.w3.org/2000/svg"
                     width="300.000000pt" height="300.000000pt" viewBox="0 0 300.000000 300.000000"
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
                <div id="main-title">
                    <h1 class="theme" style="font-family:'utm_bitsumishi_proregular';font-weight: lighter; font-size: 5ch; margin: 0">GỖ ANH PHƯƠNG</h1>
                    <h4 class="theme" style="font-family:'utm_bitsumishi_proregular';font-weight: lighter; font-size: 2rem; margin: 0 ">Admin page</h4>
                </div>
            </a>
            <div id="right-section">
                <div id = "top-bar-above-bound">
                    <div id = "top-bar-above">
                        <div id="no-decor-func">
                            <c:choose>
                                <c:when test="${sessionScope.account.role == null}">
                                    <a href="login"  class="upper-func-link">Đăng nhập</a>
                                </c:when>
                                <c:when test="${sessionScope.account.role == 1}">
                                    <div id="user-button">
                                        <a href="UserDetail?index=myprofile"  class="upper-func-link">Xin chào ${account.username}</a>
                                        <div id="user-drop-bar">
                                            <a class="user-task" href="AdminPage">Đến trang admin</a>
                                            <a class="user-task" href="UserDetail?index=myprofile">Thông tin cá nhân</a>
                                            <a class="user-task" href="logout">Đăng xuất</a>
                                        </div>
                                    </div>
                                    <style>
                                        #user-drop-bar{
                                            display: none;
                                            flex-direction: column;
                                            text-decoration: none;
                                            box-shadow: .5px .5px 2px;
                                        }
                                        #user-button {
                                            display: flex;
                                            align-items: center;
                                            height: 50px;
                                        }
                                        #user-button:hover #user-drop-bar{
                                            display: flex;
                                            position: absolute;
                                            z-index: 3;
                                            margin-top: 180px;
                                        }
                                        .user-task{
                                            display: flex;
                                            align-items: center;
                                            width: 150px;
                                            height: 50px;
                                            background: white;
                                            text-decoration: none;
                                            color: black;
                                            font-family: arial;
                                            padding: 2.5px;
                                            padding-left: 15px;
                                            border-width: 0px 0px 1px 0px;
                                            border-style: solid;
                                            border-color: #ccc;
                                        }
                                        .user-task:hover{
                                            color: rgb(171,141,66);
                                        }
                                    </style>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <div id = "top-bar-below">
                    <div id="decor-powered-button-bound" style="width: 490px;">
                        <div class="decor-powered-button-sub-bound">
                            <div class="button-bound">
                                <a href="AdminPage" class="button-decor-title" style="font-size: 1.75rem; font-family: sans-serif"> Đơn hàng </a>
                                <a style="rotate: 45deg;" href="AdminPage" class="button-below theme"></a>
                            </div>
                            
                        </div>
                        <div class="decor-powered-button-sub-bound">
                            <div class="button-bound" style="transform: translateY(-150px);">
                                <a style="transform: translateY(150px);font-size: 1.75rem; font-family: sans-serif" href="AdminPage2" class="button-decor-title" > Sản phẩm </a>
                                <a style="rotate: 45deg;" href="AdminPage2" class="button-below theme"></a>
                            </div>
                     
                        </div>

                        <div class="decor-powered-button-sub-bound">
                            <div class="button-bound">
                                <a href="AdminPage3" class="button-decor-title" style="font-size: 1.75rem; font-family: sans-serif" > Thống kê </a>
                                <a style="rotate: 45deg;" href="AdminPage3" class="button-below theme"></a>
                            </div>
                           
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </body>
</html>