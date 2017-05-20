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
        .itemContainer{
            float: left;
            margin: 15px;
        }
        .itemInfo{
            padding: 10px;
        }
        .nurseList a:link,.nurseList a:visited{
            color:black;
        }
        .nurseList{
            height:auto;
        }
        .pageNavi{
            position: absolute;
            right: 0;
        }
    </style>
</head>
<body>
<div class="container" style="margin: 0 auto;width: 960px;position: relative">
    <div class="row" id="condition">筛选条件</div>
    <div class="row nurseList" id="list">
        <img src="assets/img/loading.gif" alt="" width="300">
    </div>
    <div class="row">
        <nav aria-label="Page navigation" class="pageNavi">
            <ul class="pagination">
                <li class="pre">
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="allNurse"><a href="#">1</a></li>
                <li class="allNurse"><a href="#">2</a></li>
                <li class="allNurse"><a href="#">3</a></li>
                <li class="post">
                    <a href="#" aria-label="Next" >
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <%--<input type="hidden" id="maxPage" value="<c:out value="${maxPage}"/>"/>--%>
    <input type="hidden" id="maxPage" value="3"/>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>
    $(".allNurse:first").addClass("active");
    $(".pre").addClass("disabled");
    var now = 1;
    $.ajax({
        url: "nurseList",
        data: {
            current: 1,
            size: 10
        },
        success: function (data) {
            $("#list").html(data);
        }
    });
    $(".allNurse").each(function () {
        $(this).on("click",function () {
            $(this).addClass("active").siblings().removeClass("active");
            var current = $(this).children().text();
            $.ajax({
                url: "nurseList",
                data:{
                    size:10,
                    current:current
                },
                success: function (data) {
                    $(".nurseList").html(data);
                    now = current;
                    checkPre();
                    checkPost();
                }
            });
        })
    });
    $(".pre").on("click",function(){
        if(now!=1)
        {
            now--;
            load(now);

        }
    });
    $(".post").on("click",function(){
        if(now!=$("#maxPage").val())
        {
            now++;
            load(now);
        }
    });
    function load(temp) {
        $.ajax({
            url: "nurseList",
            data:{
                size:10,
                current:temp
            },
            success: function (data) {
                $(".nurseList").html(data);
                alert(temp);
                checkPost();
                checkPre();
                $(".active").removeClass("active");
                $(".allNurse:eq("+(temp-1)+")").addClass("active");
            }
        });
    }
    function checkPre() {

        if(now==1)
        {
            $(".pre").addClass("disabled");
        }
        else $(".pre").removeClass("disabled");
    }
    function checkPost() {
        if(now == $("#maxPage").val())
        {
            $(".post").addClass("disabled");
        }
        else {
            $(".post").removeClass("disable")
        }

    }
</script>
</body>
</html>
