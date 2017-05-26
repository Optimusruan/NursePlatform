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
    body {
        text-align: center;
    }

    .status0 {
        background-color: #f06292;
    }

    .status1 {
        background-color: #f48fb1;
    }

    .status2 {
        background-color: #f8bbd0;
    }

    .status3 {
        background-color: #ff5177;
    }

    .status4 {
        background-color: #e91e63;
    }

    .panel-heading {
        width: auto;
        height: auto;
        text-align: center;
        background: #E91E63;
        border-radius: 10px;
        margin: 10px;
        padding: 10px;
    }

    .panel-heading a {
        font-size: 2em;
        color: white;
    }

    .panel-heading a:hover {
        color: lightyellow;
        text-decoration: none;
    }

    .panel-heading:hover {
        background: #EC2D6E;
    }

    .container {
        margin-top: 10%;
    }
</style>
<body>
<%@ include file="head.jsp" %>
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
                        <label class="col-lg-3">姓名</label>
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
                        <div class="col-lg-12" style="text-align: center">
                            <a href="nurseRegister?opt=mod" id="modify" class="btn btn-warning"
                               style="width: 50%;">修改信息</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading"><a>我的服务</a></div>
        <div class="panel-body">
            <table class="table">
                <thead>
                <tr>
                    <th>服务对象</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>预约状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${services}" var="svc">
                    <c:if test="${svc.svcPps=='0'}">
                        <tr class="status0">
                            <td><a href="customerDetail?id=${svc.svcCusid}"><c:out value="${svc.cusName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td>待处理</td>
                            <td>
                                <a href="javascript:;" data-id="${svc.svcId}" class="agreeRv btn btn-default btn-sm">同意服务</a>
                                <a href="javascript:;" data-id="${svc.svcId}" class="refuseRv btn btn-danger btn-sm">拒绝服务</a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='1'}">
                        <tr class="status1">
                            <td><a href="customerDetail?id=${svc.svcCusid}"><c:out value="${svc.cusName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td>已同意等待客户处理</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='2'}">
                        <tr class="status2">
                            <td><a href="customerDetail?id=${svc.svcCusid}"><c:out value="${svc.cusName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td>已拒绝</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='3'}">
                        <tr class="status3">
                            <td><a href="customerDetail?id=${svc.svcCusid}"><c:out value="${svc.cusName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td>已被客户取消</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='4'}">
                        <tr class="status4">
                            <td><a href="customerDetail?id=${svc.svcCusid}"><c:out value="${svc.cusName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td>已成交</td>
                            <td>
                                <a class="btn btn-success btn-sm">查看评价</a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $(".panel").each(function () {
            $(this).children(".panel-body").hide();
        });

        $(".panel-heading").each(function () {
            $(this).click(function () {

                if ($(this).parents(".panel").children(".panel-body").css("display") != "none") {
                    $(this).parents(".panel").children(".panel-body").slideUp();
                } else {
                    $(this).parents(".panel").children(".panel-body").slideDown();
                }
            });

        });

    });
    $(".agreeRv").click(function () {
        var _this = this;
        var id = $(_this).data("id");

        $.ajax({
            url: "agreeRv",
            data: {
                id: id
            },
            success: function () {
                alert("接受预约");
                $(_this).parents("tr").removeClass("status0").addClass("status1");
                $(_this).parents("tr").children().eq(3).html("月嫂同意");
                $(_this).parents("tr").children().eq(4).html("");
            },
            error: function () {
                alert("取消失败");
            }
        });
    });
    $(".refuseRv").click(function () {
        var _this = this;
        var id = $(_this).data("id");

        $.ajax({
            url: "cancelRv",
            data: {
                id: id
            },
            success: function () {
                alert("取消成功");
                $(_this).parents("tr").removeClass("status0").addClass("status2");
                $(_this).parents("tr").children().eq(3).html("月嫂拒绝");
                $(_this).parents("tr").children().eq(4).html("");
            },
            error: function () {
                alert("取消失败");
            }
        });
    });
</script>
</html>
