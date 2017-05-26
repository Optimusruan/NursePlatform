<%--
  Created by IntelliJ IDEA.
  User: wx
  Date: 2017/5/24
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="st" %>
<style>

    .navbar a:link, .navbar a:visited {
        color: white;
    }

    .navbar span {
        color: white;
    }

    .nav > li > a:focus, .nav > li > a:hover {
        background: white;
        color: deeppink;
    }

    nav > .fa {
        color: white;
    }

    nav > .fa:focus, nav > .fa:hover {
        color: deeppink;
    }

    .dropdown-menu {
        background: #E91E63;
        color: white;
    }

    .dropdown-menu > li > a:focus, .dropdown-menu > li > a:hover {
        background: white;
        color: deeppink;
    }

    .navbar-right {
        padding-top: 0;
    }
</style>
<nav id="top" class="navbar" role="navigation" style="background: #E91E63;">
    <div class="container-fluid">
        <div class="navbar-header">
            <span class="navbar-brand">NursePlatform</span>
        </div>
        <div>
            <ul class="nav navbar-nav navbar-left" style="font-weight: bold">
                <li><a href="index.jsp">首页</a></li>
                <li><a href="index.jsp#services">服务介绍</a></li>
                <li><a href="index.jsp#nurses">月嫂展示</a></li>
                <li><a href="index.jsp#about">关于我们</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right" id="status">
                <%--<li>--%>
                <%--<a href="login.jsp">登录</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                <%--<a href="register.jsp">注册</a>--%>
                <%--</li>--%>

                <st:if test="${id==null}">
                    <li>
                        <a href="login.jsp">登录</a>
                    </li>
                    <li>
                        <a href="register.jsp">注册</a>
                    </li>
                </st:if>
                <st:if test="${id!=null}">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding: 11px">
                            <i class="fa fa-user-circle-o fa-2x" aria-hidden="true"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${type}Home?id=${id}">我的主页</a></li>
                            <li><a href="#">注销登陆</a></li>
                        </ul>
                    </li>
                </st:if>
            </ul>
        </div>
    </div>
</nav>
