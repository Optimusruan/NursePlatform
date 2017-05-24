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
        .panel-heading:hover{
            background: #EC2D6E;
        }
    </style>
</head>
<body>
<%--<%=session.getAttribute("id")%>--%>
<%--<c:out value="${id}"></c:out>--%>
<div class="container">
    <div class="panel">
        <div class="panel-heading">
            <a>我的信息</a>
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
                        <label class="col-lg-3">登录名:</label>
                        <div class="col-lg-9"><c:out value="${info.cusUname}"/></div>
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
                    <th>预约对象</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>价格（/天）</th>
                    <th>预约状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="svc" items="${services}">
                    <c:if test="${svc.svcPps=='1'}">
                        <tr class="status1">
                            <td><c:out value="${svc.nurName}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>待处理</td>
                            <td>
                                <a href="javascript:;" data-id="${svc.svcId}" class="btn btn-default btn-sm confirmRv" >确定预约</a>
                                <a href="javascript:;" data-id="${svc.svcId}" class="btn btn-danger btn-sm cancelRv" >取消预约</a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='0'}">
                        <tr class="status0">
                            <td><c:out value="${svc.nurName}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>等待月嫂处理</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='2'}">
                        <tr class="status2">
                            <td><c:out value="${svc.nurName}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>已被月嫂拒绝</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='3'}">
                        <tr class="status3">
                            <td><c:out value="${svc.nurName}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>已取消</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='4'}">
                        <tr class="status4">
                            <td><c:out value="${svc.nurName}"></c:out></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>已成交</td>
                            <td>
                                <a class="btn btn-warning btn-sm">去评价</a>
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
            <a href="searchNurse.jsp">筛选月嫂</a>
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

    $(".confirmRv").click(function () {
        var _this = this;
        var id = $(_this).data("id");

        $.ajax({
            url:"confirmRv",
            data:{
                id:id
            },
            success:function (data) {
                alert("确认成功");
                $(_this).parents("tr").removeClass("status2").addClass("status4");
                $(_this).parents("tr").children().eq(4).html("已成交");
                $(_this).parents("tr").children().eq(5).html("<a class='btn btn-warning btn-sm'>去评价</a>");
            },
            error:function () {
                alert("确认失败");
            }
        });
    });
    $(".cancelRv").click(function () {
        var _this = this;
        var id = $(_this).data("id");

        $.ajax({
            url:"cancelRv",
            data:{
                id:id
            },
            success:function () {
                alert("取消成功");
                $(_this).parents("tr").removeClass("status2").addClass("status3");
                $(_this).parents("tr").children().eq(4).html("客户取消");
                $(_this).parents("tr").children().eq(5).html("");
            },
            error:function () {
                alert("取消失败");
            }
        });
    });
</script>
</html>
