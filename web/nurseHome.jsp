<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/19
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>
<%--<%=session.getAttribute("id")%>--%>
<%--<c:out value="${id}"></c:out>--%>
<div class="container">
    <div class="panel">
        <div class="panel-heading">我的信息</div>
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <label class="col-lg-3 label-info">姓名</label>
                    <div class="col-lg-9"><c:out value="${info.nurName}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">身份证</label>
                    <div class="col-lg-9"><c:out value="${info.nurIdno}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">年龄</label>
                    <div class="col-lg-9"><c:out value="${info.nurAge}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">学历</label>
                    <div class="col-lg-9"><c:out value="${info.nurEdu}"/></div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row"><img src="" alt=""></div>
                <div class="row" style="text-align: center">
                    <button id="modify" class="btn btn-warning" style="width: 50%;">修改信息</button>
                </div>
            </div>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading">我的服务</div>
        <table class="table">
            <thead>
            <tr>
                <th>服务时间</th>
                <th>服务状态</th>
                <th>预约状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
