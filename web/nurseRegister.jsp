<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/5/17
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>月嫂注册</title>

    <meta charset="utf-8">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">

    <style type="text/css">
        body {
            /*background:url(assets/img/pinkback.jpeg);*/
            background-size: cover;
        }

        .form-control {
            border: 0 solid transparent;
            box-shadow: none;
        }

        .fa {
            bottom: -10px;
        }

        .distp {
            width: 140px;
            float: left;
        }

        #distpicker {
            margin-bottom: 50px;
        }
    </style>
</head>
<body>
<div class="register-container container">
    <div class="block">
        <h1><c:out value="${title}"></c:out></h1>
        <br>
        <div class="card-panel col-lg-6 col-lg-offset-3">
            <form class="register-form" method="post" action="register">
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-user prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_name" class="form-control" name="nur_name" placeholder="姓名" type="text"
                               value="<c:out value="${info.nurName}"></c:out>">
                    </div>
                    <div id="name-error" class="error"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-address-card prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_idno" class="form-control" name="nur_idno" placeholder="身份证号" type="number"
                               value="<c:out value="${info.nurIdno}"></c:out>">
                    </div>
                    <div id="idno-error" class="error"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-phone prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_contact" class="form-control" name="nur_contact" placeholder="联系方式" type="number"
                               value="<c:out value="${info.nurContact}"></c:out>"/>
                    </div>
                    <div id="contact-error" class="error"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-question prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_age" class="form-control" name="nur_age" placeholder="年龄" type="number"
                               value="<c:out value="${info.nurAge}"></c:out>"/>
                    </div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-mortar-board prefix"></i>
                    <div class="col-lg-11">
                        <label>学历</label>
                        <div>
                            <select id="nur_edu" class="form-control distp" name="nur_edu"
                                    value="<c:out value="${info.nurEdu}"></c:out>"/>
                            <option value="高中">高中</option>
                            <option value="初中">初中</option>
                            <option value="小学">小学</option>
                            <option value="本科">本科</option>
                            <option value="其他">其他</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-map-marker prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_origin" class="form-control" name="nur_origin" placeholder="籍貫" type="hidden">
                        <label>籍贯</label>
                        <div data-toggle="distpicker" id="originpicker" class="form-group">
                            <select id="oprovince" class="form-control distp" data-province="---- 选择省 ----"></select>
                            <select id="ocity" class="form-control distp" data-city="---- 选择市 ----"></select>
                        </div>
                        <script type="text/javascript">
                            $("#odistpicker").distpicker();
                        </script>
                    </div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-location-arrow prefix"></i>
                    <div class="col-lg-11">
                        <label>住址</label>
                        <div data-toggle="distpicker" id="distpicker" class="form-group">
                            <select id="province" class="form-control distp" data-province="---- 选择省 ----"></select>
                            <select id="city" class="form-control distp" data-city="---- 选择市 ----"></select>
                            <select id="district" class="form-control distp" data-district="---- 选择区 ----"></select>
                        </div>
                        <script type="text/javascript">
                            $("#distpicker").distpicker();
                        </script>
                    </div>
                    <div class="col-lg-11 col-lg-offset-1">
                        <input id="nur_add" class="form-control" name="nur_add" placeholder="详细地址" type="text"
                               value="<c:out value="${info.nurAdd}"></c:out>"/>
                        <input id="nur_pos" name="nur_pos" type="hidden">
                    </div>
                    <div id="add-error" class="error"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-star prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_rank" class="form-control" name="nur_rank" placeholder="等级" type="number"
                               value="<c:out value="${info.nurRank}"></c:out>"/>
                    </div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-money prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_price" class="form-control" name="nur_price" placeholder="期望价格（每日）" type="number"
                               value="<c:out value="${info.nurPrice}"></c:out>"/>
                    </div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-user prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_uname" class="form-control invalid" name="nur_uname" placeholder="用户名"
                               type="text" value="<c:out value="${info.nurUname}"></c:out>"/>
                    </div>
                    <div id="user-error" class="error error-username"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-key prefix"></i>
                    <div class="col-lg-11">
                        <input id="nur_pwd" class="form-control" name="nur_pwd" placeholder="请输入密码" type="password">
                    </div>
                    <div id="password-error" class="error"></div>
                </div>
                <div class="row">
                    <div class="input-field col" id="bt">
                        <input name="opt" value="<c:out value="${opt}"></c:out>" type="hidden">
                        <input name="usertype" value="nurse" type="hidden">
                        <button class="btn col-lg-2 col-lg-offset-3" id="submit_btn"><c:out
                                value="${act}"></c:out></button>
                        <p <c:out value="${display}"></c:out>>&nbsp已有账号? <a href="login.jsp" class="btn">登录</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/distpicker/distpicker.data.js"></script>
<script src="assets/js/distpicker/distpicker.js"></script>
<script src="assets/js/distpicker/main.js"></script>
<script type="text/javascript">
    //获取distpicker省市区的值放到详细地址的开头
    $("#nur_add").focus(function () {
        var option1 = $("#province option:selected");
        var option2 = $("#city option:selected");
        var option3 = $("#district option:selected");
        halfAdd = option1.val() + option2.val() + option3.val();
        $("#nur_add").val(halfAdd);
    });
    //籍贯字段填充
    $(".odistp").blur(function () {
        var oprovince = $("#oprovince option:selected");
        var ocity = $("#ocity option:selected");
        $("#nur_origin").val(oprovince.val() + "|" + ocity.val());
    });
    //调用高德api获取详细地址坐标
    $("#nur_add").blur(function () {
        var add = $("#nur_add").val();
        $.ajax({
            url: "http://restapi.amap.com/v3/geocode/geo",
            data: {
                key: "907340d4068b2e15e4e5ddd40c48c1e4",
                address: add
            },
            type: "json",
            dataType: 'JSONP',
            success: function (data) {
                var geocodes = data.geocodes[0];
                var location = geocodes.location;
                $("#nur_pos").val(location);
            }
        })
    });
</script>
</body>
</html>
