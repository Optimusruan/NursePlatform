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

        .status5 {
            background-color: darkgrey;
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
</head>
<body>
<%--<%=session.getAttribute("id")%>--%>
<%--<c:out value="${id}"></c:out>--%>
<%--<%=session.getAttribute("type")%>--%>
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
                <tr>
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
                            <td><a href="nurseDetail?id=${svc.svcNurid}"><c:out value="${svc.nurName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>待处理</td>
                            <td>
                                <a href="javascript:;" data-id="${svc.svcId}" class="btn btn-default btn-sm confirmRv">确定预约</a>
                                <a href="javascript:;" data-id="${svc.svcId}" class="btn btn-danger btn-sm cancelRv">取消预约</a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='0'}">
                        <tr class="status0">
                            <td><a href="nurseDetail?id=${svc.svcNurid}"><c:out value="${svc.nurName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>等待月嫂处理</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='2'}">
                        <tr class="status2">
                            <td><a href="nurseDetail?id=${svc.svcNurid}"><c:out value="${svc.nurName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>已被月嫂拒绝</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='3'}">
                        <tr class="status3">
                            <td><a href="nurseDetail?id=${svc.svcNurid}"><c:out value="${svc.nurName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>已取消</td>
                            <td></td>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='4'}">
                        <tr class="status4">
                            <td><a href="nurseDetail?id=${svc.svcNurid}"><c:out value="${svc.nurName}"></c:out></a>
                            </td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>已成交</td>
                            <td>
                                <a class="btn btn-warning btn-sm" data-toggle="modal"
                                   data-target="#comment${svc.svcId}">去评价</a>
                            </td>
                            <div class="modal fade" id="comment${svc.svcId}" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">评价服务</h4>
                                        </div>
                                        <div class="modal-body" style="padding: 30px;">
                                            <div class="row">
                                                <label class="col-lg-3">专业程度：</label>
                                                <p class="stars col-lg-9"></p>
                                            </div>
                                            <div class="row">
                                                <label class="col-lg-3">服务态度：</label>
                                                <div class="form-group col-lg-6">
                                                    <input type="radio" value="1" name="rpt">极差
                                                    <input type="radio" value="2" name="rpt">差评
                                                    <input type="radio" value="3" name="rpt">一般
                                                    <input type="radio" value="4" name="rpt">好评
                                                    <input type="radio" value="5" name="rpt">极好
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label class="col-lg-3">评价：</label>
                                                <textarea class="col-lg-9 form-control comment-content"
                                                          style="width: 400px;"></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <a data-id="${svc.svcId}" class="btn btn-warning comment-btn">提交</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </tr>
                    </c:if>
                    <c:if test="${svc.svcPps=='5'}">
                        <tr class="status5">
                            <td><a href="nurseDetail?id=${svc.svcNurid}"><c:out value="${svc.nurName}"></c:out></a></td>
                            <td><c:out value="${svc.svcStart}"></c:out></td>
                            <td><c:out value="${svc.svcEnd}"></c:out></td>
                            <td><c:out value="${svc.nurPrice}"></c:out></td>
                            <td>评价成功</td>
                            <td></td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading">
            <a href="searchNurse">筛选月嫂</a>
        </div>
        <div class="panel-body">
        </div>
    </div>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/raty/jquery.raty.js"></script>
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

        $(".stars").raty({score: 1});

    });

    $(".confirmRv").click(function () {
        var _this = this;
        var id = $(_this).data("id");
        if (confirm("确认预约会取消其余时间冲突的预约，继续吗")) {
            $.ajax({
                url: "confirmRv",
                data: {
                    id: id
                },
                success: function (data) {
                    alert("确认成功");
                    $(_this).parents("tr").removeClass("status2").addClass("status4");
                    $(_this).parents("tr").children().eq(4).html("已成交");
                    $(_this).parents("tr").children().eq(5).html("<a class='btn btn-warning btn-sm'>去评价</a>");
                },
                error: function () {
                    alert("确认失败");
                }
            });
        }
    });
    $(".cancelRv").click(function () {
        var _this = this;
        var id = $(_this).data("id");

        $.ajax({
            url: "cancelRv",
            data: {
                id: id
            },
            success: function () {
                alert("取消成功");
                window.location.reload();
                $(_this).parents("tr").removeClass("status2").addClass("status3");
                $(_this).parents("tr").children().eq(4).html("客户取消");
                $(_this).parents("tr").children().eq(5).html("");
            },
            error: function () {
                alert("取消失败");
            }
        });
    });
    $(".comment-btn").click(function () {
        var id = $(this).data("id");
        var ele = $(this).parents(".modal-content");
        var tr = $(this).parents("tr");
        var attitude = $('input[name="rpt"]:checked', ele).val();
        var level = $('.score', ele).val();
        var comment = $(".comment-content", ele).val();

        $.ajax({
            url: "comment",
            data: {
                id: id,
                level: level,
                attitude: attitude,
                comment: comment
            },
            success: function () {
                $(".modal").modal("hide");
                alert("评价成功");
                $(tr).removeClass("status4").addClass("status5");
                $(tr).children().eq(4).html("评价成功");
                $(tr).children().eq(5).html("");
            }
        })
    })
</script>
</html>
