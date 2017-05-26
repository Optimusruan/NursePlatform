<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/20
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
<c:forEach items="${info}" var="item">
    <div class="itemContainer nurseList">
        <a href="nurseDetail?id=<c:out value="${item.nurId}"/>">
            <div class="itemImg">
                <c:choose>
                    <c:when test="${item.nurAvt!=null}">
                        <img src="<c:out value="${item.nurAvt}"/>"  alt="">
                    </c:when>
                    <c:otherwise>
                        <img src="assets/img/home1.jpg" alt="" width="155" height="200">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="itemInfo">
                <div>
                    <label>姓名</label>
                    <span><c:out value="${item.nurName}"/></span>
                </div>
                <div>
                    <label>星级</label>
                    <span>
                        <c:forEach begin="1" step="1" end="${item.nurRank}">
                            <i class="fa fa-star"></i>
                        </c:forEach>
                    </span>
                </div>
                <div>
                    <label>价格</label>
                    <span><c:out value="${item.nurPrice}"/>/天</span>
                </div>
            </div>
        </a>
    </div>
</c:forEach>
</div>
<div class="row pageNavi">
    <nav aria-label="Page navigation" class="pageNavi col-lg-6">
        <ul class="pagination">
            <li class="pre">
                <a href="#" aria-label="Previous"  onclick="return false;">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="post">
                <a href="#" aria-label="Next"  onclick="return false;">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    <input type="hidden" id="maxPage" value="<c:out value="${maxPage}"/>"/>
    <div class="morePage col-lg-6">
        <span>共 <c:out value="${maxPage}"/> 页，跳转到 <input type="number" id="inputPage" pattern="[0-9]"> 页</span>
        <button id="toPage" class="btn">确定</button>
    </div>
</div>
<script src="assets/js/layer/layer.js"></script>
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
        str += "<li class='disabled more'><a href='#' onclick='return false;' >....</a></li>";
        $(".pre").after(str);
    }

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
            load(Number(now) + 1);
        }
    });

    //加载内容
    function load(temp) {
        if(ajaxLocker) {
            ajaxLocker = false;
            $("#list").html("<img src=\"assets/img/loading.gif\" alt=\"\" width=\"300\" style='position: absolute;left: 350px;'>")
            $.ajax({
                url: "nurseList",
                timeout:15000,
                data: {
                    current: temp,
                    priceCond:$("#priceCond").val(),
                    rankCond:$("#rankCond").val(),
                    nurseName:$("#nurseName").val(),
                    addCond:$("#addCond").val(),
                    startTime:$("#startTime").val(),
                    order: $("#order").val()
                },
                success: function (data) {
                    $("#list").html(data);
                    now = temp;
                    loadPageNavigation();
                    checkPost();
                    checkPre();
                    if(Number(now)<6)
                    {
                        $(".active").removeClass("active");
                        $(".allNurse:eq("+(temp-1)+")").addClass("active");
                    }
                    ajaxLocker = true;

                },
                error:function (xhr) {
                    console.log(xhr);
                    if(xhr.statusText=="timeout"){
                        $("#list").remove();
                        alert("连接超时，请检查网路");

                    }
                    ajaxLocker=true;
                }
            });
        }
    }

    //判断是否到头
    function checkPre() {

        if (Number(now) == 1) {
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
            $(".post").removeClass("disabled")
        }

    }

    //处理直接页数跳转
    $("#toPage").on("click", function () {
        var page = $("#inputPage").val();
        if (page != "" && Number(page) > 0 && Number(page) <= maxPage) {
            load(page);
        }
    });

    //重新加载分页的导航栏
    function loadPageNavigation() {
        if(Number(now)>=4&&Number(now)<=5){
            $(".more").remove();
            $(".allNurse").remove();
            str = "";
            for(var i=1;i<=Number(now)+2;i++){
                str += "<li class=\"allNurse\"><a href=\"#\">" + i+ "</a></li>";
            }
            $(".pre").after(str);
            $(".allNurse:last").after("<li class='disabled more'><a href='#' onclick='return false;' >....</a></li>");
        }
        if(Number(now)>5){
            $(".more").remove();
            $(".allNurse").remove();
            str = "";
            for(var i = 0;i<2;i++){
                str += "<li class=\"allNurse\"><a href=\"#\">" + (i + 1) + "</a></li>";
            }
            str += "<li class='disabled more'><a href='#' onclick='return false;' >....</a></li>";
            if(Number(now)<maxPage-2) {
                for (var i = Number(now) - 2; i <= Number(now) + 2; i++) {
                    if (i == Number(now)) {
                        str += "<li class=\"allNurse  active\"><a href=\"#\">" + i + "</a></li>";
                    }
                    else {
                        str += "<li class=\"allNurse\"><a href=\"#\">" + i + "</a></li>";
                    }
                }
                str += "<li class='disabled more'><a href='#' onclick='return false;' >....</a></li>";
            }
            else {
                for (var i = maxPage - 4; i <= maxPage; i++) {
                    if (i == Number(now)) {
                        str += "<li class=\"allNurse  active\"><a href=\"#\">" + i + "</a></li>";
                    }
                    else {
                        str += "<li class=\"allNurse\"><a href=\"#\">" + i + "</a></li>";
                    }
                }
            }
            $(".pre").after(str);
        }
        //给新生成所有按钮绑定事件
        $(".allNurse").each(function () {
            $(this).on("click", function () {
                $(this).addClass("active").siblings().removeClass("active");
                var current = $(this).children().text();
                load(current);
            })
        });
    }
</script>