<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
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
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <style>
        .block {
            margin: 15% 70%;
            padding: 10px;
            height: auto;
            width: 300px;
            box-shadow: 5px 5px 5px #bbb;
            background: white;
            z-index: 12;

        }

        .login-container {

            position: relative;
            overflow: hidden;
        }

        .login-container > img {
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
        }

        .divideLine {
            text-align: center;
            margin-bottom: 10px;
        }

        .firstInput {
            margin-top: 15px;
        }
        #sm{
            color: white;
            background: #e91e63;
        }
        #sm:hover{

        }
    </style>
</head>
<body>
<%--<div class="panel-heading" style="font-size: 2em">育婴平台</div>--%>
<%@ include file="head.jsp" %>
<div class="login-container">
    <img src="assets/img/login.jpg" alt="" width="1920">
    <div class="block">
        <form action="loginSystem" class="form-horizontal" method="post" id="loginForm">
            <div class="form-group firstInput">
                <label for="username" class="control-label col-sm-2"><i class="fa fa-user" style="font-size: 1.5em"></i></label>
                <div class="col-sm-10">
                    <input type="text" id="username" name="username" class="form-control" placeholder="用户名"/>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="control-label col-sm-2"><i class="fa fa-key" style="font-size: 1.5em"></i></label>
                <div class="col-sm-10">
                    <input type="password" id="password" name="password" class="form-control" placeholder="密码"/>
                </div>
            </div>
            <div class="divideLine">----------选择用户类型----------</div>
            <div class="form-group">
                <label for="userType" class="control-label col-sm-2"><i class="fa fa-cog" style="font-size: 1.5em"></i></label>
                <div class="col-sm-10">
                    <select name="userType" id="userType" class="form-control">
                        <option value="nurse">月嫂</option>
                        <option value="customer">客户</option>
                    </select>
                </div>
            </div>
        </form>
        <button id="sm" class="btn" style="width: 100%">登陆</button>
        <%--<button id="test" class="btn btn-warning">测试</button>--%>
    </div>
</div>
<div class="panel-footer" style="background: #bbb;text-align:center;font-size: 1.5em;"> 2016-2018 CopyRight@Biu</div>


<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>
    $("#sm").on("click",function () {
        $.ajax({
            url:"login",
            data:{
                username:$("#username").val(),
                password:$("#password").val(),
                userType:$("#userType").val()
            },
            success:function (data) {
                if(data=="error")
                {
                    alert("用户名或密码错误");
                    window.location.href="login.jsp";
                }
                else {
                    alert("登陆成功");
                    window.location.href="/nurse/loginSystem?userType="+$("#userType").val();
                }
            }
        })
    });
//    $("#test").on("click",function () {
//        $.ajax({
//            url:"test",
//            success:function (data) {
//
//            }
//        })
//    })
</script>
</body>
</html>
