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

    <style>
      /*style="background-color:#FFB6C1"*/
      .table{
        width: 80%;
        margin: 0 10% 0 10%;
      }
      .circle{
        border-radius: 30px;
        background: #FFB6C1;
        margin: 10px;
        width: 60px;
        height: 60px;
        padding: 20px;
      }

    </style>
  </head>
  <body  >
  <nav class="navbar navbar-default " role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand">NursePlatform</a>
      </div>
      <div>
        <ul class="nav navbar-nav navbar-left">
          <li class="active"><a href="#">首页</a></li>
          <li><a href="#services">服务介绍</a></li>
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
  <br>
  <div class="table-responsive" name="services" style="width: 100%;height: 100%">
    <table class="table" >
      <thead>
      <tr colspan="5">
        <h2>服务介绍</h2>
      </tr>
      </thead>
      <tbody>
      <tr align="center">
        <td><div class="circle"><i class="fa fa-book fa-3" aria-hidden="true"></i></div ><p>产妇专业护理</p></td>
        <td><div class="circle"><i class="fa fa-female fa-3" aria-hidden="true"></i></div> <p>产妇产后恢复</p></td>
        <td><div class="circle"><i class="fa fa-coffee fa-3" aria-hidden="true"></i></div> <p>产妇生活护理</p></td>
        <td><div class="circle"><i class="fa fa-heartbeat fa-3" aria-hidden="true"></i></div> <p>产妇心理护理</p></td>
        <td><div class="circle"><i class="fa fa-medkit fa-3" aria-hidden="true"></i></div> <p>产妇疾病预防</p></td>

      </tr>
      <tr align="center">
        <td><div class="circle"><i class="fa fa-pencil-square-o fa-3" aria-hidden="true"></i></div> <p>产妇带教培训</p></td>
        <td><div class="circle"><i class="fa fa-bed fa-3" aria-hidden="true"></i></div> <p>新生儿生活照料</p></td>
        <td><div class="circle"><i class="fa fa-umbrella fa-3" aria-hidden="true"></i></div> <p>新生儿疾病预防</p></td>
        <td><div class="circle"><i class="fa fa-child fa-3" aria-hidden="true"></i></div> <p>新生儿早期促进</p></td>
        <td><div class="circle"><i class="fa fa-stethoscope fa-3" aria-hidden="true"></i></div> <p>新生儿健康护理</p></td>
      </tr>
      </tbody>
    </table>

  </div><hr>
  <div name="oneday">
    <h3>一天的工作</h3>
  </div>
  </body>
</html>
