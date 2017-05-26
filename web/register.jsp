<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/19
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <style>
        .register-container {
            margin: 0 auto;
        }

        .register-icon {
            font-size: 20em;
            text-align: center;
            transition-property: font-size;
            transition-duration: 0.7s;
        }

        .register-icon:hover {
            font-size: 28em;
        }

        .register-title {
            text-align: center;
            font-size: 2em;
        }

        .register-type a:link, .register-type a:visited {
            color: #bbb;

        }

        .register-type a:hover {
            color: deeppink;
            text-decoration: none;
        }

        .register-type a {
            display: block;
            height: auto;
        }
    </style>
</head>
<body>

<div class="container register-container">
    <div class="page-header" style="font-size: 2em;">选择要注册的用户类型</div>
    <div class="row ">
        <div class="col-lg-6 register-type">
            <a href="nurseRegister?opt=reg">
                <div class="row register-icon"><i class="fa fa-user-md"></i></div>
                <div class="row register-title">我是月嫂</div>
            </a>
        </div>
        <div class="col-lg-6 register-type">
            <a href="customerRegister?opt=reg">
                <div class="row register-icon"><i class="fa fa-user"></i></div>
                <div class="row register-title">我是用户</div>
            </a>
        </div>
    </div>
</div>
</body>
</html>
