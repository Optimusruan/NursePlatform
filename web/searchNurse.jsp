<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/20
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <style>
        .itemContainer{
            float: left;
            margin: 20px;
        }
        .itemInfo{
            padding: 10px;
        }
        .nurseList a:link,.nurseList a:visited{
            color:black;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row" id="condition">筛选条件</div>
    <div class="row nurseList" id="list"><img src="assets/img/loading.gif" alt="" width="300"></div>
    <div class="row">分页功能</div>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>
    $.ajax({
        url: "nurseList",
        data: {
            current: 1,
            size: 10
        },
        success: function (data) {
            $("#list").html(data);
        }
    })
</script>
</body>
</html>
