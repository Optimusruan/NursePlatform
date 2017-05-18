<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/16
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="c" %>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
  <head>
    <title>首页</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
  </head>
  <body>
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">NursePlatform</a>
      </div>
      <div>
        <ul class="nav navbar-nav navbar-left">
          <li class="active"><a href="#">首页</a></li>
          <li><a href="#">服务介绍</a></li>
          <li><a href="#">月嫂的一天</a></li>
          <li><a href="#">关于我们</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="login.jsp">登录</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              注册
              <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
              <li><a href="customerRegister.jsp">客户</a></li>
              <li><a href="nurseRegister.jsp">月嫂</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  </body>
</html>
