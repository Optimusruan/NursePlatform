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
        }

        .itemInfo {
            padding: 10px;
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
    </style>
</head>
<body>
<div class="container" style="margin: 0 auto;width: 960px;position: relative">
    <div class="row" id="condition">筛选条件</div>
    <div class="row nurseList" id="list">
        <img src="assets/img/loading.gif" alt="" width="300">
    </div>
    <div class="row">
        <nav aria-label="Page navigation" class="pageNavi col-lg-6">
            <ul class="pagination">
                <li class="pre">
                    <a href="" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="post">
                    <a href="" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="morePage col-lg-6">
            <span>共 <c:out value="${maxPage}"/> 页，跳转到 <input type="number" id="inputPage" pattern="[0-9]"> 页</span>
            <button id="toPage">确定</button>
        </div>
    </div>
    <input type="hidden" id="maxPage" value="<c:out value="${maxPage}"/>"/>
    <input type="hidden" id="current" value="1"/>
    <%--<input type="hidden" id="maxPage" value="3"/>--%>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>
    var now = 1;
    var maxPage = $("#maxPage").val();
    var ajaxLocker = true;//防止ajax重复加载


    //渲染分页按钮
    if (maxPage <= 5) {
        var str = "";
        $(".pre").addClass("disabled");
        if (maxPage == 1) {
            $(".post").addClass("disabled");
        }
        str = str + "<li class=\"allNurse active\"><a href=\"#\">1</a></li>";
        for (var i = 1; i < maxPage; i++)
            str = str + "<li class=\"allNurse \"><a href=\"#\">" + (i + 1) + "</a></li>";
        $(".pre").after(str);
    }
    else {
        $(".pre").addClass("disabled");
        var str = "";
        str = str + "<li class=\"allNurse active\"><a href=\"#\">1</a></li>";
        for (var i = 1; i < 5; i++) {
                str = str + "<li class=\"allNurse\"><a href=\"#\">" + (i + 1) + "</a></li>";
        }
        str += "<li class='disabled more'><a href=''>....</a></li>";
        $(".pre").after(str);
    }


    //获得第一页内容
    $.ajax({
        url: "nurseList",
        data: {
            current: 1
        },
        success: function (data) {
            $("#list").html(data);
        }
    });


    //点击分页按钮加载该页内容
    $(".allNurse").each(function () {
        $(this).on("click", function () {
            $(this).addClass("active").siblings().removeClass("active");
            var current = $(this).children().text();
            load(current);
        })
    });


    //处理前后跳转
    $(".pre").on("click", function () {
        if (now != 1) {
            load(now - 1);
        }
    });
    $(".post").on("click", function () {
        if (now < maxPage) {
            load(now + 1);
        }
    });

    //加载内容
    function load(temp) {
        if(ajaxLocker) {
            ajaxLocker = false;
            $(".nurseList").html("<img src=\"assets/img/loading.gif\" alt=\"\" width=\"300\">")
            $.ajax({
                url: "nurseList",
                data: {
                    current: temp
                },
                success: function (data) {
                    $(".nurseList").html(data);
                    now = temp;
                    loadPageNavigation();
                    checkPost();
                    checkPre();
                    if(now<6)
                    {
                        $(".allNurse:eq("+(temp-1)+")").addClass("active");
                    }
                    ajaxLocker = true;

                },
                error:function () {
                  ajaxLocker=true;
                }
            });
        }
    }

    //判断是否到头
    function checkPre() {

        if (now == 1) {
            $(".pre").addClass("disabled");
        }
        else $(".pre").removeClass("disabled");
    }
    //判断是否到尾
    function checkPost() {
        if (now == $("#maxPage").val()) {
            $(".post").addClass("disabled");
        }
        else {
            $(".post").removeClass("disable")
        }

    }

    $("#toPage").on("click", function () {
        var page = $("#inputPage").val();
        if (page != "" && page > 0 && page <= maxPage) {
            load(page);
        }
    });
    function loadPageNavigation() {
//        alert(now);
        if(now>=4&&now<=5){
            $(".more").remove();
            $(".allNurse:last").after( "<li class=\"allNurse\"><a href=\"#\">"+(Number(now)+2)+"</a></li>");
            $(".allNurse:last").after("<li class='disabled more'><a href=''>....</a></li>");
        }
        if(now>5){
            $(".more").remove();
            $(".allNurse").remove();
            str = "";
            for(var i = 0;i<2;i++){
                str += "<li class=\"allNurse\"><a href=\"#\">" + (i + 1) + "</a></li>";
            }
            str += "<li class='disabled more'><a href=''>....</a></li>";
            if(now<maxPage-2) {
                for (var i = Number(now) - 2; i <= Number(now) + 2; i++) {
                    if (i == now) {
                        str += "<li class=\"allNurse  active\"><a href=\"#\">" + i + "</a></li>";
                    }
                    else {
                        str += "<li class=\"allNurse\"><a href=\"#\">" + i + "</a></li>";
                    }
                }
                str += "<li class='disabled more'><a href=''>....</a></li>";
            }
            else {
                for (var i = maxPage - 4; i <= maxPage; i++) {
                    if (i == now) {
                        str += "<li class=\"allNurse  active\"><a href=\"#\">" + i + "</a></li>";
                    }
                    else {
                        str += "<li class=\"allNurse\"><a href=\"#\">" + i + "</a></li>";
                    }
                }
            }
            $(".pre").after(str);
        }
        $(".allNurse").each(function () {
            $(this).on("click", function () {
                $(this).addClass("active").siblings().removeClass("active");
                var current = $(this).children().text();
                load(current);
            })
        });
    }
</script>
</body>
</html>
