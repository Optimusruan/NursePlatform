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
    <style>
        .calendar {
            font-family: sans-serif;
        }

        .calendar > table {
            background: #dff0d8;
            opacity: 0.9;
            position: relative;
            display: inline-block;
            padding: 10px;
        }

        .calendar-head > th, .calendar-main > td {
            width: 40px;
            height: 40px;
            text-align: center;
            font-size: 1.3em;
            margin: 0;
            position: relative;
        }

        .calendar-main > .open > a {
            display: inline-block;
            width: 100%;
            height: 100%;
            padding-top: 5px;

        }

        .calendar a:link, .calendar a:visited {
            text-decoration: none;
            color: black;
        }

        .calendar-main > .open > a:hover {
            background: #e91e63;
            color: white;
            opacity: 1;
        }

        .calendar-info {
            display: inline-block;
            position: relative;
        }

        .thisMonth {
            position: absolute;
            font-size: 11em;
            text-align: center;
            left: 0;
            top: 64px;
            z-index: -1;
            color: pink;
        }

        .thisMonth > td {
            width: 300px;
        }

        .year-month {
            text-align: center;
        }

        .year-month > .to {
            display: inline-block;
            font-size: 1.2em;
            padding: 0 10px 0 10px;
        }

        .year-month > .content {
            font-size: 1.2em;
        }

        .close {
            background: #D3D4D3;
            opacity: 0.5;
            float: none;
            font-weight: normal;
        }

        .close:hover {
            cursor: not-allowed;
        }

        .calendar .active {
            background: #e91e63;
            color: white;
            opacity: 1;
        }

        .showInfo {
            display: block;
            width: 100%;
            text-align: center;
            font-size: 1.5em;
        }

        .calendar-info > button,.calendar-info>button:visited {
            margin-top: 15px;
            text-align: center;
            font-size: 1.1em;
            background: white;
            border-color: #ddd;
            color: #ccc;
            width: 100%;
        }

        .calendar-info > button:hover {
            border-color: #e91e63;
            color: #e91e63;
        }
    </style>
</head>
<body>
<%@ include file="head.jsp" %>

<div class="container" style="font-size: 1.25em;line-height: 1.7em">
    <div class="panel">
        <div class="panel-heading">月嫂信息</div>
        <div class="row">
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
                    <label class="col-lg-3">联系方式</label>
                    <div class="col-lg-9">
                        <button id="showContact" class="btn btn-success">点击查看</button>
                    </div>
                </div>
                <div class="row">
                    <label class="col-lg-3">住址</label>
                    <div class="col-lg-9"><c:out value="${info.nurAdd}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">星级</label>
                    <div class="col-lg-9"><c:out value="${info.nurRank}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">口碑</label>
                    <div class="col-lg-9"><c:out value="${info.nurRpt}"/></div>
                </div>
                <div class="row">
                    <label class="col-lg-3">价格</label>
                    <div class="col-lg-9"><c:out value="${info.nurPrice}"/></div>
                </div>
            </div>
            <div class="col-lg-6" style="text-align: center;">
                <div class="row" >
                    <c:choose>
                        <c:when test="${info.nurAvt!=null}">
                            <img src="<c:out value="${info.nurAvt}"/>" alt="">
                        </c:when>
                        <c:otherwise>
                            <img src="assets/img/home1.jpg" alt="" class="col-lg-8" c style="margin: 5px">
                        </c:otherwise>
                    </c:choose>
                <div class="row" style="text-align: center">
                    <c:if test="${appoint}">
                        <button id="appoint" class="btn btn-warning" style="width: 50%;" data-id="1">我要预约</button>
                    </c:if>
                    <c:if test="${!appoint}">
                        <button id="appoint" class="btn btn-danger" style="width: 50%;" data-id="0">取消预约</button>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <div class="panel select-time">

    </div>
</div>

<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>
    $("#showContact").on("click", function () {
        var obj = $(this);
        $.ajax({
            url: "showTel",
            data: {
                id: "<c:out value="${info.nurId}"/>"
            },
            success: function (data) {
                if (data == "No way")
                    alert("登陆后再试");
                else if( data =="typeError"){
                    alert("只有用户能查看");
                }
                else {
                    obj.after(data);
                    obj.remove();
                }
            }
        })
    });
    $("#appoint").on("click", function () {
        var obj = $(this);
        var temp = obj.text();
        if (obj.attr("data-id") == 1) {
            obj.toggleClass("disabled");
            obj.text("请选择时间");
            $.ajax({
                url: "dateService",
                data: {
                    id: "<c:out value="${info.nurId}"/>"
                },
                success: function (data) {
                    $(".select-time").html(data);
                },
                error: function () {
                    obj.toggleClass("disabled");
                    obj.text(temp);
                }
            });
        }
        else if(obj.attr("data-id")==0){
            $.ajax({
                url: "appoint",
                data: {
                    opt: 0,
                    id: "<c:out value="${info.nurId}"/>",
                    startTime:$("#start").val(),
                    endTime:$("#end").val()
                },
                success: function (data) {
                    if (data == "error") {
                        alert("取消失败，请重试");
                    }
                    else if (data == "login") {
                        alert("请先登录");
                    }
                    else if(data=="success"){
                        alert("取消成功");
                        window.location.href="nurseDetail?id=<c:out value="${info.nurId}"/>";
                    }
                }
            });
        }
    });

</script>
</body>
</html>