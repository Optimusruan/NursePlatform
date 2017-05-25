<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/19
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>月嫂信息</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>
<%--<%=session.getAttribute("id")%>--%>
<%--<c:out value="${id}"></c:out>--%>
<div class="container" style="font-size: 1.25em;line-height: 1.7em">
    <div class="panel">
        <div class="panel-heading">月嫂信息</div>
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
                <div class="row">
                    <label class="col-lg-3">联系方式</label>
                    <div class="col-lg-9"><button id="showContact" class="btn btn-success">点击查看</button></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">住址</label>
                    <div class="col-lg-9"><c:out value="${info.nurAdd}"/> </div>
                </div>
                <div class="row">
                    <label class="col-lg-3">口碑</label>
                    <div class="col-lg-9"></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">价格</label>
                    <div class="col-lg-9"><c:out value="${info.nurPrice}"/></div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row"><img src="" alt=""></div>
                <div class="row" style="text-align: center">
                    <button id="modify" class="btn btn-warning" style="width: 50%;">我要预约</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>
    $("#showContact").on("click",function () {
        var obj= $(this)
       $.ajax({
           url:"showTel",
           data:{
               id:"<c:out value="${info.nurId}"/>"
           },
           success:function (data) {
               obj.after(data);
               obj.remove();
           }
       })
    });
</script>
</body>
</html>