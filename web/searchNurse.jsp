<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .itemContainer {
            float: left;
            margin: 15px;
            background: #ddd;
        }

        .itemInfo {
            padding: 10px;
        }
        .itemImg{
            margin: 10px;
        }
        .nurseList a:link, .nurseList a:visited {
            color: black;
            text-decoration: none;
        }

        .nurseList {
            height: auto;
        }

        .pageNavi {
            text-align: center;
        }

        .morePage {
            display: inline-block;
            text-align: center;
            margin: 20px 0;
        }
        #toPage{
            background: #fff;
            border-color: #ddd;

        }
        #toPage:hover{
            border-color: deeppink;
            color: deeppink;
        }
        .morePage>span>input{
            border: 1px solid deeppink;
            outline:deeppink;
        }
        .search{
            text-align: center;
            margin-top: 10px;
        }
        .search button{
            margin-left: -36px;
            font-size: 1.5em;
            padding: 5px;
            margin-top: -3px;
            border-radius: 0;
            color: white;
            background: deeppink;
        }
        .search button:hover{
            color: white;
        }
        .search input{
            height: 36px;
            width: 600px;
            border: 2px solid deeppink;
            outline:deeppink;
        }
        .search input:focus{
            border: 2px solid deeppink;
        }
        .pagination>.active>a{
            background: deeppink;
            border-color: deeppink;
            color: white;
        }
        .pagination>.active>a:hover{
            background: deeppink;
            border-color: deeppink;
        }
        .pagination>li>a{
            color: deeppink;
        }
        .pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover{
            color: deeppink;
        }
    </style>
</head>
<body>
<div class="container" style="margin: 0 auto;width: 1000px;position: relative">
    <div class="search row">
        <input type="text" id="nurseName" value="" placeholder="输入月嫂名字"/>
        <button class=" btn fa fa-search" id="search" style="height: auto"></button>
    </div>
    <div class="row" id="condition">筛选条件</div>
    <div class="row" id="list">
        <img src="assets/img/loading.gif" alt="" width="300">
    </div>

    <input type="hidden" id="current" value="1"/>
    <%--<input type="hidden" id="maxPage" value="3"/>--%>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>

    //获得第一页内容
    $.ajax({
        url: "nurseList",
        data: {
            current: 1,
            nurseName:$("#nurseName").val(),
            cond:""
        },
        success: function (data) {
            $("#list").html(data);
        }
    });
    $("#search").on("click",function(){
        $.ajax({
            url: "nurseList",
            data: {
                current: 1,
                nurseName:$("#nurseName").val(),
                cond:""
            },
            success: function (data) {
                $("#list").html(data);
            }
        });
    })

</script>
</body>
</html>
