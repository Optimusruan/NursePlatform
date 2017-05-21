<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/19
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>客户主页</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">

    <style type="text/css">
        .panel-heading{
            width: auto;
            height: auto;
            text-align: center;
            background: #FFB6C1;
            color:grey;
            border-radius: 10px;
            margin: 10px;
            padding: 10px;
        }
        a{
            font-size: 2em;
            color: white;
        }
    </style>
</head>
<body>
<%=session.getAttribute("id")%>
<c:out value="${id}"></c:out>
<div class="container">
    <div class="panel">
        <div class="panel-heading">
            <a href="">我的信息</a>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-3"><<img src="" alt=""></div>
                <div class="col-lg-6">
                    <div class="row">
                        <label class="col-lg-3">姓名</label>
                        <div class="col-lg-9"><c:out value="${info.cusName}"/></div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3">身份证</label>
                        <div class="col-lg-9"><c:out value="${info.cusIdno}"/></div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3">登录名</label>
                        <div class="col-lg-9"><c:out value="${info.cusUname}"/></div>
                    </div>
                    <div class="row">
                        <label class="col-lg-3">联系方式</label>
                        <div class="col-lg-9"><c:out value="${info.cusContact}"/></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12" style="text-align: center">
                            <a href="customerRegister?opt=mod" id="modify" class="btn btn-warning" style="width: 50%;">修改信息</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading">
            <a>我的预约</a>
        </div>
        <div class="panel-body">
            <table class="table">
                <thead>
                <tr >
                    <th style="display: none">预约对象</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th style="display: none">价格（/天）</th>
                    <th>预约状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="svc" items="${services}">
                    <c:if test="${svc.svcPps}==1">
                        <tr class="status1">
                            <td style="display: none"><c:out value="${svc.svcNurid}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.svcStatus}"></c:out></td>
                            <td>待处理</td>
                            <td>
                                <a href="#"class="btn btn-success btn-sm" >确定预约</a>
                                <a href="#" class="btn btn-danger btn-sm" >取消预约</a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps}==0">
                        <tr class="status0">
                            <td style="display: none"><c:out value="${svc.svcNurid}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.svcStatus}"></c:out></td>
                            <td>已同意等待月嫂处理</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps}==2">
                        <tr class="status2">
                            <td style="display: none"><c:out value="${svc.svcNurid}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.svcStatus}"></c:out></td>
                            <td>已被月嫂拒绝</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps}==3">
                        <tr class="status3">
                            <td style="display: none"><c:out value="${svc.svcNurid}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.svcStatus}"></c:out></td>
                            <td>已取消</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps}==4">
                        <tr class="status4">
                            <td style="display: none"><c:out value="${svc.svcNurid}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.svcStatus}"></c:out></td>
                            <td>已成交</td>
                            <td>
                                <a class="btn btn-success btn-sm">去评价</a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading">
            <a href="">我的要求</a>
        </div>
        <div class="panel-body">
        </div>
    </div>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
    $(document).ready(function(){
        $(".panel").each(function(){
            $(this).children(".panel-body").hide();
        });

        $(".panel-heading").each(function(){
            $(this).click(function(){

                if($(this).parents(".panel").children(".panel-body").css("display") != "none"){
                    $(this).parents(".panel").children(".panel-body").slideUp();
                }else{
                    $(this).parents(".panel").children(".panel-body").slideDown();
                }
            });

        });

    });
</script>
</html>
