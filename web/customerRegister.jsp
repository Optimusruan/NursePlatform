<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/5/17
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>客户注册</title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">


    <style type="text/css">
        body{
            /*background:url(assets/img/pinkback.jpeg);*/
            background-size: cover;
        }
        .form-control{
            border: 0px solid transparent;
            box-shadow: none;
        }
        .fa{
            bottom: -10px;
        }
        .distp{
            width: 140px;
            float: left;
        }
        #distpicker{
            margin-bottom: 50px;
        }



    </style>
</head>
<body>
<div class="register-container container">
    <div class="block">
        <h1>Register Now!客戶注册</h1>
        <br>
        <div class="card-panel col-lg-6 col-lg-offset-3">
            <form class="register-form" method="post" action="register">
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-user prefix"></i>
                    <div class="col-lg-11">
                        <input id="cus_name" class="form-control" name="cus_name" placeholder="姓名"  type="text"></div>
                    <div id="name-error" class="error"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-address-card prefix"></i>
                    <div class="col-lg-11">
                        <input id="cus_idno" class="form-control" name="cus_idno" placeholder="身份证号" type="number">
                    </div>
                    <div id="idno-error" class="error"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-phone prefix"></i>
                    <div class="col-lg-11">
                        <input id="cus_contact" class="form-control" name="cus_contact" placeholder="联系方式" type="number">
                    </div>
                    <div id="contact-error" class="error"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-location-arrow prefix"></i>
                    <div class="col-lg-11">
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
                        <input id="cus_add" class="form-control" name="cus_add" placeholder="详细地址" type="text">
                        <input id="cus_pos" name="cus_pos" type="hidden" >
                    </div>
                    <div id="add-error" class="error"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-user prefix"></i>
                    <div class="col-lg-11">
                        <input id="cus_uname" class="form-control invalid" name="cus_uname" placeholder="用户名" type="text">
                    </div>
                    <div id="user-error" class="error error-username"></div>
                </div>
                <div class="row form-group margin">
                    <i class="col-lg-1 fa fa-key prefix"></i>
                    <div class="col-lg-11">
                        <input id="cus_pwd" class="form-control" name="cus_pwd" placeholder="请输入密码" type="password">
                    </div>
                    <div id="password-error" class="error"></div>
                </div>
                <div class="row">
                    <div class="input-field col" id="bt">
                        <input name="usertype" value="cus" type="hidden">
                        <button class="btn col-lg-2 col-lg-offset-3" id="submit_btn">注册</button>
                        <p class="">&nbsp已有账号? <a href="login.jsp" class="btn">登录</a></p>
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
    $("#cus_add").focus(function(){
        var option1=$("#province option:selected");  //获取选中的项
        var option2=$("#city option:selected");  //获取选中的项
        var option3=$("#district option:selected");  //获取选中的项
        halfAdd = option1.val()+option2.val()+option3.val();
        $("#cus_add").val(halfAdd);
    });
    //调用高德api获取详细地址坐标
    $("#cus_add").blur(function(){
        var add = $("#cus_add").val();
        $.ajax({
            url:"http://restapi.amap.com/v3/geocode/geo",
            data:{
                key:"907340d4068b2e15e4e5ddd40c48c1e4",
                address:add
            },
            type:"json",
            dataType:'JSONP',
            success:function(data){
                var geocodes = data.geocodes[0];
                var location = geocodes.location;
                $("#cus_pos").val(location);
            }
        })
    })
</script>
</body>
</html>
