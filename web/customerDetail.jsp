<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/19
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户信息</title>
    <style>
        .panel-heading{
            width: auto;
            height: auto;
            text-align: center;
            background: #E91E63;
            border-radius: 10px;
            margin: 10px;
            padding: 10px;
        }
        a{
            font-size: 2em;
            color: white;
        }
        a:hover {
            color: lightyellow;
            text-decoration:none;
        }
        .fa{
            color: white;
        }
    </style>
</head>
<body>
<div class="panel">
    <div class="panel-heading">
        <a>客户信息</a>
        <a href="customerHome.jsp"><i class="fa fa-reply " aria-hidden="true"></i>返回</a>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-3"><img src="" alt=""></div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-3"><label>姓名:</label></div>
                    <div class="col-lg-9"><c:out value="${info.cusName}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">身份证:</label>
                    <div class="col-lg-9"><c:out value="${info.cusIdno}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">联系方式:</label>
                    <div class="col-lg-9"><c:out value="${info.cusContact}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">地址:</label>
                    <div class="col-lg-9"><c:out value="${info.cusAdd}"/></div>
                </div>
                <div class="row" style="display: none;">
                    <div class="col-lg-12" style="text-align: center">
                        <a href="#" id="modify" class="btn btn-warning" style="width: 50%;">收藏</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel">
</body>
</html>
