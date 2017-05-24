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
    <title>月嫂列表</title>
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

        .itemImg {
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

        #toPage {
            background: #fff;
            border-color: #ddd;

        }

        #toPage:hover {
            border-color: deeppink;
            color: deeppink;
        }

        .morePage > span > input {
            border: 1px solid deeppink;
            outline: deeppink;
        }

        .search {
            text-align: center;
            margin-top: 10px;
        }

        .search button {
            margin-left: -36px;
            font-size: 1.5em;
            padding: 5px;
            margin-top: -3px;
            border-radius: 0;
            color: white;
            background: deeppink;
        }

        .search button:hover {
            color: white;
        }

        .search input {
            height: 36px;
            width: 600px;
            border: 2px solid deeppink;
            outline: deeppink;
        }

        .search input:focus {
            border: 2px solid deeppink;
        }

        .pagination > .active > a {
            background: deeppink;
            border-color: deeppink;
            color: white;
        }

        .pagination > .active > a:hover {
            background: deeppink;
            border-color: deeppink;
        }

        .pagination > li > a {
            color: deeppink;
        }

        .pagination > li > a:focus, .pagination > li > a:hover, .pagination > li > span:focus, .pagination > li > span:hover {
            color: deeppink;
        }

        .condition {
            margin: 15px 0;
        }

        .condition-container {
            border: 1px solid #ddd;
            margin-top: -1px;
        }

        .condition-head {
            background: #D3D4D3;
            font-weight: bold;
            font-size: 1.1em;
            float: left;
            padding: 8px 15px;
        }

        .condition-info {
            padding: 8px 15px;
            float: left;
        }

        .condition-item > a:link, .condition-item > a:visited {
            color: deeppink;
            text-decoration: none;
        }

        .hide {
            display: none;
        }

        .add > a:link, .add > a:hover, .add > a:visited {
            text-decoration: none;
            color: deeppink;
            border: 1px solid deeppink;
        }

        .add > a {
            display: block;
            float: left;
            margin: 4px 10px;
        }

        .add > a > i {
            background: deeppink;
            color: white;
            display: inline-block;
            font-size: 1.25em;
            padding: 5px;
        }

        .add > a > span {
            padding: 3px 6px;
            display: inline-block;
        }

        .deeppink {
            background: deeppink;
            color: white;
            font-weight: normal;
        }
    </style>
</head>
<body>
<div class="container" style="margin: 0 auto;width: 1000px;position: relative">
    <%--搜索栏--%>
    <div class="search row">
        <input type="text" id="nurseName" value="" placeholder="输入月嫂名字"/>
        <button class=" btn fa fa-search" id="search" style="height: auto"></button>
    </div>
    <%--筛选条件栏--%>
    <div class="condition row " id="condition">
        <div class="condition-container row">
            <div class="condition-head deeppink">筛 选 条 件</div>
            <div class="">
                <div class="add" id="allCondition">

                </div>
            </div>
        </div>
        <div class="condition-container row" data-id="rank" id="rank">
            <div class="condition-head">星 级</div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">一星</a></div>
            </div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">二星</a></div>
            </div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">三星</a></div>
            </div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">四星</a></div>
            </div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">五星</a></div>
            </div>
        </div>
        <div class="condition-container row" data-id="price" id="price">
            <div class="condition-head">价 格</div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">0-100</a></div>
            </div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">101-200</a></div>
            </div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">201-300</a></div>
            </div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">301-400</a></div>
            </div>
            <div class="condition-info">
                <div class="condition-item"><a href="" onclick="return false;">401-500</a></div>
            </div>
        </div>
    </div>
    <%--结果显示--%>
    <div class="row" id="list">
        <img src="assets/img/loading.gif" alt="" style="left: 350px;position: absolute;" width="300">
    </div>
    <%--条件收集区--%>
    <input type="hidden" id="priceCond" value=""/>
    <input type="hidden" id="rankCond" value=""/>

    <%--当前页面--%>
    <input type="hidden" id="current" value="1"/>
    <%--<input type="hidden" id="maxPage" value="3"/>--%>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>

    //首次加载
    $(document).ready(loadContent());

    //加载内容
    function loadContent() {
        $.ajax({
            url: "nurseList",
            data: {
                current: 1,
                nurseName: $("#nurseName").val(),
                priceCond: $("#priceCond").val(),
                rankCond: $("#rankCond").val()
            },
            success: function (data) {
                $("#list").html(data);
            }
        });
    }
    $("#search").on("click", function () {
       loadContent();
    })

    $(".condition-item>a").each(function () {
        $(this).on("click", function () {
            var content = $(this).text();
            var id = $(this).parent().parent().parent().attr("data-id");
            $(this).parent().parent().parent().addClass("hide");
            $("#allCondition").append("<a href='#' onclick='del(this);return false;' data-id=" + id + "><span>" + content + "</span><i class='fa fa-close'></i></a>");
            $("#" + id + "Cond").val(content);
            loadContent();
        })
    });

    //删除条件
    function del(obj) {
        var id = obj.getAttribute("data-id");
        $("#" + id).removeClass("hide");
        $("#" + id + "Cond").val("");
        loadContent();
        obj.remove();
    }

    //加载内容
    function loadContent() {
        $("#list").html("<img src=\"assets/img/loading.gif\" alt=\"\" width=\"300\" style='position: absolute;left: 350px;'>")
        $.ajax({
            url: "nurseList",
            timeout:5000,
            data: {
                current: 1,
                nurseName: $("#nurseName").val(),
                priceCond: $("#priceCond").val(),
                rankCond: $("#rankCond").val()
            },
            success: function (data) {
                $("#list").html(data);
            },
            error:function(xhr){
                console.log(xhr);
                if(xhr.statusText=="timeout"){
                    alert("连接超时，请检查网路");
                    $("#list").remove();
                }
            }
        });
    }
</script>
</body>
</html>
