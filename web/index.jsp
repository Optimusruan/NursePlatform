<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/16
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="c" %>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <style>
        /*style="background-color:#FFB6C1"*/
        body {
            text-align: center;
        }

        .bloke {
            width: 80%;
            margin: 0 10% 0 10%;
            text-align: center;
        }

        .circle {
            border-radius: 40px;
            background: #E91E63;
            margin: 10px;
            width: 80px;
            height: 80px;
            padding: 10px;
        }

        #myCarousel {
            height: 400px;
            width: 100%;
            margin: 0;
            text-align: center;
        }

        .item {
            width: 100%;
            height: 400px;
            background: #E91E63;
        }

        .item img {
            width: 100%;
            height: 400px;
        }

        #istop {
            background-color: #E91E63;
            position: fixed;
            width: 50px;
            bottom: 40px;
            right: 20px;
            border: 8px double lightyellow;
            text-align: center;
        }

        hr {
            height: 10px;
            border: none;
            border-top: 1px dashed #E91E63;
        }

        #nurselist {
            position: relative;
        }

        .itemContainer {
            float: left;
            padding: 10px;
            margin: 10px;
            width: 364px;
            height: 280px;
            /*background: pink;*/
        }

        .rank {
            border-radius: 40px;
            background: #E91E63;
            padding: 5px;
            height: 30px;
            text-align: center;
        }

        .itemImg, .itemInfo {
            width: 160px;
            height: 240px;
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
<div id="istop"><a href="#top" style="color: white;text-decoration:none;"><i class="fa  fa-chevron-up fa-2x"
                                                                             aria-hidden="true"></i>返回顶部</a></div>
<%@ include file="head.jsp" %>
<div class="bloke">
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="assets/img/home1.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="assets/img/home2.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img src="assets/img/home3.jpg" alt="Third slide">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
            <div class="btn" style="margin: 190px 0">‹</div>
        </a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">
            <div class="btn" style="margin: 190px 0">›</div>
        </a>
    </div>

    <!-- 控制按钮 -->


    <script>
        $(function () {
            // 循环轮播到上一个项目
            $(".prev-slide").click(function () {
                $("#myCarousel").carousel('prev');
            });
            // 循环轮播到下一个项目
            $(".next-slide").click(function () {
                $("#myCarousel").carousel('next');
            });

        });
    </script>
    <div class="panel">
        <div class="table-responsive" id="services" style="width: 100%;height: 100%">
            <table class="table" style="border: 0">
                <thead>
                <tr colspan="5">
                    <h2>服务介绍</h2>
                </tr>
                </thead>
                <tbody>
                <tr align="center">
                    <td>
                        <div class="circle"><i class="fa fa-book fa-4x" aria-hidden="true"></i></div>
                        <p>产妇专业护理</p></td>
                    <td>
                        <div class="circle"><i class="fa fa-female fa-4x" aria-hidden="true"></i></div>
                        <p>产妇产后恢复</p></td>
                    <td>
                        <div class="circle"><i class="fa fa-coffee fa-4x" aria-hidden="true"></i></div>
                        <p>产妇生活护理</p></td>
                    <td>
                        <div class="circle"><i class="fa fa-heartbeat fa-4x" aria-hidden="true"></i></div>
                        <p>产妇心理护理</p></td>
                    <td>
                        <div class="circle"><i class="fa fa-medkit fa-4x" aria-hidden="true"></i></div>
                        <p>产妇疾病预防</p></td>

                </tr>
                <tr align="center">
                    <td>
                        <div class="circle"><i class="fa fa-pencil-square-o fa-4x" aria-hidden="true"></i></div>
                        <p>产妇带教培训</p></td>
                    <td>
                        <div class="circle"><i class="fa fa-bed fa-4x" aria-hidden="true"></i></div>
                        <p>新生儿生活照料</p></td>
                    <td>
                        <div class="circle"><i class="fa fa-umbrella fa-4x" aria-hidden="true"></i></div>
                        <p>新生儿疾病预防</p></td>
                    <td>
                        <div class="circle"><i class="fa fa-child fa-4x" aria-hidden="true"></i></div>
                        <p>新生儿早期促进</p></td>
                    <td>
                        <div class="circle"><i class="fa fa-stethoscope fa-4x" aria-hidden="true"></i></div>
                        <p>新生儿健康护理</p></td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>
    <div class="row">
        <div id="nurses" class="panel">
            <h2>优秀月嫂展示</h2>
            <div style="float: right;"><a href="searchNurse">查看更多 ></a></div>
            <hr>
            <div id="nurselist">

            </div>
        </div>
    </div>
    <div class="row">
        <div id="about" class="panel">
            <h2>关于我们</h2>
            <hr>
            <p>NursePlatform 实现了：</p>
            <p>1.月嫂与客户直接沟通，省去中介费</p>
            <p>2.根据客户要求智能匹配月嫂</p>
            <p>3.按条件精确查找月嫂</p>
            <p>4.月嫂与客户双向选择</p>
        </div>
    </div>
</div>
</body>
<script>
    $.ajax({
        url: "excellentNurses",
        data: {
            size: 8
            //偶数
        },
        success: function (data) {
            $("#nurselist").html(data);
        }
    })
</script>
</html>
