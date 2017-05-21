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
    <title>月嫂主页</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<style>
    .status0{
        background-color:#f06292 ;
    }
    .status1{
        background-color:#f48fb1 ;
    }
    .status2{
        background-color:#f8bbd0 ;
    }
    .status3{
        background-color:#ff5177 ;
    }
    .status4{
        background-color:#e91e63 ;
    }

</style>
<body>
<%=session.getAttribute("id")%>
<c:out value="${id}"></c:out>
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
                    <a href="nurseRegister?opt=mod" id="modify" class="btn btn-warning" style="width: 50%;">修改信息</a>
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
            <c:forEach var="svc" items="${services}">
                <c:if test="${svc.svcPps}==0">
                    <tr class="status0">
                        <td><c:out value="${svc.svcStart}"></c:out>~<c:out value="${svc.svcEnd}"</td>
                        <td><c:out value="${svc.svcStatus}"></c:out></td>
                        <td>待处理</td>
                        <td>
                            <a class="btn btn-sm btn-default" href="">同意</a>
                            <a class="btn btn-sm btn-danger" href="">拒绝</a>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${svc.svcPps}==1">
                    <tr class="status1">
                        <td><c:out value="${svc.svcStart}"></c:out>~<c:out value="${svc.svcEnd}"</td>
                        <td><c:out value="${svc.svcStatus}"></c:out></td>
                        <td>已同意等待客户处理</td>
                        <td></td>
                    </tr>
                </c:if>
                <c:if test="${svc.svcPps}==2">
                    <tr class="status2">
                        <td><c:out value="${svc.svcStart}"></c:out>~<c:out value="${svc.svcEnd}"</td>
                        <td><c:out value="${svc.svcStatus}"></c:out></td>
                        <td>已拒绝</td>
                        <td></td>
                    </tr>
                </c:if>
                <c:if test="${svc.svcPps}==3">
                    <tr class="status3">
                        <td><c:out value="${svc.svcStart}"></c:out>~<c:out value="${svc.svcEnd}"</td>
                        <td><c:out value="${svc.svcStatus}"></c:out></td>
                        <td>已被客户取消</td>
                        <td></td>
                    </tr>
                </c:if>
                <c:if test="${svc.svcPps}==4">
                    <tr class="status4">
                        <td><c:out value="${svc.svcStart}"></c:out>~<c:out value="${svc.svcEnd}"</td>
                        <td><c:out value="${svc.svcStatus}"></c:out></td>
                        <td>已成交</td>
                        <td>
                            <a class="btn btn-sm">查看评价</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
