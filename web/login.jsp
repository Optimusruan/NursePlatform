<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/18
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <style>
        .block {
            margin: 10px;
            padding: 10px;
            height: auto;
            width: 300px;
            box-shadow: 5px 5px 5px #bbb;
            background: white;
        }
        .login-container{
            background: url("assets/img/login.jpg");
            padding-left:70%;
            padding-top: 11%;
            padding-bottom: 11%;
        }
    </style>
</head>
<body>
<div class="panel-heading" style="font-size: 2em">育婴平台</div>
<div class="login-container">
    <div class="block">
        <form action="" class="form-horizontal">
            <div class="form-group">
                <label for="username" class="control-label col-sm-2"><i class="fa fa-user"
                                                                        style="font-size: 1.25em"></i></label>
                <div class="col-sm-10">
                    <input type="text" id="username" name="username" class="form-control" placeholder="用户名"/>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="control-label col-sm-2"><i class="fa fa-key" style="font-size: 1.25em"></i></label>
                <div class="col-sm-10">
                    <input type="password" id="password" name="password" class="form-control" placeholder="密码"/>
                </div>
            </div>
            <div class="form-group">
                <label for="userType" class="control-label col-sm-2"><i class="fa fa-cog" style="font-size: 1.25em"></i></label>
                <div class="col-sm-10">
                    <select name="userType" id="userType" class="form-control">
                        <option value="nurse">月嫂</option>
                        <option value="custom">客户</option>
                    </select>
                </div>
            </div>
        </form>
        <button id="sm" class="btn btn-success" style="width: 100%">登陆</button>

    </div>
</div>
<div class="panel-footer" style="background: #bbb;text-align:center;font-size: 1.5em;"> 2016-2018 CopyRight@Biu</div>


<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
