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
            position: relative;
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
            border-color: #e91e63;
            color: #e91e63;
        }

        .morePage > span > input {
            border: 1px solid #e91e63;
            outline: #e91e63;
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
            background: #e91e63;
        }

        .search button:hover {
            color: white;
        }

        #distpicker > .condition-container button {
            position: absolute;
            left: 283px;
            top: 2px;
            height: 71px;
            z-index: 999;
            font-size: 1.1em;
            line-height: 2em;
            background: white;
            border-color: #ddd;
            color: #ccc;
        }

        #distpicker > .condition-container button:hover {
            border-color: #e91e63;
            color: #e91e63;
        }

        .search input {
            height: 36px;
            width: 600px;
            border: 2px solid #e91e63;
            outline: #e91e63;
            padding-left: 10px;
        }

        .search input:focus {
            border: 2px solid #e91e63;
        }

        .pagination > .active > a {
            background: #e91e63;
            border-color: #e91e63;
            color: white;
        }

        .pagination > .active > a:hover {
            background: #e91e63;
            border-color: #e91e63;
        }

        .pagination > li > a {
            color: #e91e63;
        }

        .pagination > li > a:focus, .pagination > li > a:hover, .pagination > li > span:focus, .pagination > li > span:hover {
            color: #e91e63;
        }

        .condition {
            margin: 15px 0;
        }

        .condition-container {
            border: 1px solid #ddd;
            margin-top: -1px;
            position: relative;
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

        .condition-location > div > select {
            vertical-align: middle;
            margin: auto 0;
        }

        .condition-item > a:link, .condition-item > a:visited {
            color: #e91e63;
            text-decoration: none;
        }

        .address {
            display: inline-block;
            width: 20%;
            height: 32px;
            padding: 3px 12px;
            margin: 2px 10px;
            font-size: 13px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        }

        .hide {
            display: none;
        }

        .add > a:link, .add > a:hover, .add > a:visited {
            text-decoration: none;
            color: #e91e63;
            border: 1px solid #e91e63;
        }

        .add > a {
            display: block;
            float: left;
            margin: 4px 10px;
        }

        .add > a > i {
            background: #e91e63;
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
            background: #e91e63;
            color: white;
            font-weight: normal;
        }

        .order {
            border: 1px solid #ddd;
        }

        .order > ul {
            list-style: none;
            background: #D3D4D3;
            color: #aaa;
        }

        .order > ul > li {
            float: left;
        }

        .order > ul > li > a {
            display: block;
            padding: 8px 15px;
            border-right: 1px solid #D3D4D3;
        }

        .order > ul > li > a:link, .order > ul > li > a:visited {
            text-decoration: none;
            background: #D3D4D3;
            color: #aaa;

        }

        .order > ul > .active > a:link, .order > ul > .active > a:visited {
            color: #e91e63;
            background: white;
            border-right: 1px solid white;
        }

        .order-head {
            background: #D3D4D3;
            font-weight: bold;
            float: left;
            padding: 8px 15px;
        }

        .condition-time > button {
            margin-left: 10px;
            margin-top: 3px;
            height: 32px;
            background: white;
            color: #D3D4D3;
            border-color: #D3D4D3;
        }

        #map{
            height: 285px;
        }

        .map{
            padding-top: 15px;
         }
    </style>
</head>
<body>
<%@ include file="head.jsp" %>
<div class="container" style="margin: 0 auto;width: 1000px;position: relative">

    <%--搜索栏--%>
    <div class="search row">
        <input type="text" id="nurseName" value="" placeholder="输入月嫂名字"/>
        <button class=" btn fa fa-search" id="search" style="height: auto"></button>
    </div>

    <div class="col-lg-7">
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
        <div data-toggle="distpicker" id="distpicker">
            <div class="condition-container row" data-id="addressProvince" id="addressProvince">
                <div class="condition-head">省 份</div>
                <div class="condition-location">
                    <select id="province" data-province="所有省份" class="address"></select>
                </div>
                <button id="getAddress" class="btn">添&nbsp;&nbsp;加<br/>筛&nbsp;&nbsp;选</button>
            </div>
            <div class="condition-container row" data-id="addressCity" id="addressCity">
                <div class="condition-head">城 市</div>
                <div class="condition-location">
                    <select id="city" data-city="所有城市" class="address"></select>
                </div>
            </div>
        </div>
        <div class="condition-container row" data-id="time" id="time">
            <div class="condition-head">时 间</div>
            <div class="condition-time">
                <input type="text" id="selectTime" value="" class="address" placeholder="选择开始服务时间">
                <%--<button class="btn">点击选取时间</button>--%>
            </div>
        </div>
    </div>
    <div class="order row">
        <div class="order-head">排 序</div>
        <ul class="order-main">
            <li data-id="price">
                <a href="#" onclick="return false;" data-id="0">价格<i class="fa fa-sort-desc"></i></a>
            </li>
            <li data-id="rank">
                <a href="#" onclick="return false;" data-id="0">星级<i class="fa fa-sort-desc"></i></a>
            </li>
        </ul>
    </div>
    </div>

    <%--地图--%>
    <div class="col-lg-5 map">
        <div id="map"></div>

    </div>

    <%--结果显示--%>
    <div class="row" id="list">
        <img src="assets/img/loading.gif" alt="" style="left: 350px;position: absolute;" width="300">
    </div>

    <%--条件收集区--%>
    <input type="hidden" id="priceCond" value="" style="display: none"/>
    <input type="hidden" id="rankCond" value=""/>
    <input type="hidden" id="order" value=""/>
    <input type="hidden" id="addCond" value=""/>
    <input type="hidden" id="startTime" value=""/>

    <%--当前页数--%>
    <input type="hidden" id="current" value="1"/>
    <%--<input type="hidden" id="maxPage" value="3"/>--%>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/distpicker/distpicker.data.js"></script>
<script src="assets/js/distpicker/distpicker.js"></script>
<script src="assets/js/distpicker/main.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=354bcf086459b742f330894fc091b5bd"></script>
<script>

    //首次加载
    $(document).ready(loadContent());

    $("#search").on("click", function () {
        loadContent();
    });

    //添加条件
    $(".condition-item>a").each(function () {
        $(this).on("click", function () {
            var content = $(this).text();
            var id = $(this).parent().parent().parent().attr("data-id");
            $(this).parent().parent().parent().addClass("hide");
            $("#allCondition").append("<a href='#' onclick='del(this,1);return false;' data-id=" + id + "><span>" + content + "</span><i class='fa fa-close'></i></a>");
            $("#" + id + "Cond").val(content);
            loadContent();
        })
    });

    //删除条件
    function del(obj, type) {
        if (type == 1) {
            var id = obj.getAttribute("data-id");
            $("#" + id).removeClass("hide");
            $("#" + id + "Cond").val("");
        }
        if (type == 2) {
            $("#distpicker").removeClass("hide");
            $("#addCond").val("")
        }
        if (type == 3) {
            $("#time").removeClass("hide");
            $("#startTime").val("");
        }
        loadContent();
        obj.remove();
    }

    //加载内容
    function loadContent() {
        var cache = $("#list").html();
        $("#list").html("<img src=\"assets/img/loading.gif\" alt=\"\" width=\"300\" style='position: absolute;left: 350px;'>");
        $.ajax({
            url: "nurseList",
            timeout: 15000,
            data: {
                current: 1,
                nurseName: $("#nurseName").val(),
                priceCond: $("#priceCond").val(),
                rankCond: $("#rankCond").val(),
                addCond: $("#addCond").val(),
                startTime: $("#startTime").val(),
                order: $("#order").val()
            },
            success: function (data) {
                $("#list").html(data);
            },
            error: function (xhr) {
                console.log(xhr);
                if (xhr.statusText == "timeout") {
                    alert("连接超时，请检查网路");
                    $("#list").html(cache);
                }
            }
        });
    }

    //排序
    $(".order>ul>li").on("click", function () {
        var orderArr = ["fa-sort-desc", "fa-sort-asc"];
        var orderName = ["desc", "asc"];
        var clickNum = $(this).children("a").attr("data-id");
        $(this).children().children().removeClass(orderArr[clickNum]);
        $(this).children().children().addClass(orderArr[(Number(clickNum) + 1) % 2]);
        $(this).addClass("active");
        $("#order").val($(this).attr("data-id") + "-_-" + orderName[(Number(clickNum) + 1) % 2]);
        $(this).children("a").attr("data-id", (Number(clickNum) + 1) % 2);
        $(this).siblings().removeClass("active");
        loadContent();
    });

    //处理地址
    $("#getAddress").on("click", function () {
        var content = $("#province").val() + $("#city").val();
        if (content != null && content != "") {
            $("#addCond").val(content);
            $("#distpicker").addClass("hide");
            $("#allCondition").append("<a href='#' onclick='del(this,2);return false;'><span>" + content + "</span><i class='fa fa-close'></i></a>");
            loadContent();
        }
    });

    //处理日期
    var timeObj = $("#selectTime");
    var nowTime = "<c:out value="${nowTime}"/>";
    timeObj.on("focus", function () {
        $(this).attr("type", "date");
    });
    timeObj.on("blur", function () {
        $(this).attr("type", "text");
    });
    timeObj.on("change", function () {
        if ($(this).val() < nowTime) {
            $(this).val("");
            alert("无效时间，请重新选择");
        }
        else {
            $("#startTime").val($(this).val());
            $("#time").addClass("hide");
            $("#allCondition").append("<a href='#' onclick='del(this,3);return false;'><span>" + $(this).val() + "</span><i class='fa fa-close'></i></a>");
            $(this).val("");
            loadContent();
        }
    })
</script>
</body>
</html>
