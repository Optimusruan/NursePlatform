<%--suppress ALL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/26
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="calendar row">
    <table class="col-lg-3 col-lg-offset-3">
        <tr class="thisMonth">
            <td colspan="7"></td>
        </tr>
        <tr class="year-month">
            <td class="to" id="perMonth"><a href="#" onclick="preMonth();return false;">&laquo;</a></td>
            <td colspan="5" class="content"></td>
            <td class="to" id="nextMonth"><a href="#" onclick="nextMonth();return false;">&raquo;</a></td>
        </tr>
        <tr class="calendar-head">
            <th>日</th>
            <th>一</th>
            <th>二</th>
            <th>三</th>
            <th>四</th>
            <th>五</th>
            <th>六</th>
        </tr>
    </table>
    <input type="hidden" id="yearMonth" value="">
    <div class="calendar-info col-lg-3">
        开始时间：<input type="text" id="start" value="" class="showInfo" disabled>
        结束时间：<input type="text" id="end" value="" class="showInfo" disabled>
        服务天数：<input type="text" id="showSum" value="" class="showInfo" disabled>
        <button id="smAppointment" class="btn hidden">提交申请</button>
    </div>
    <div class="col-lg-3"></div>
</div>
<script>
    var timeStr = "<c:out value="${time}"/>";
    var date = new Date();
    var day = date.getFullYear();
    var year = date.getFullYear();
    var month = date.getMonth();
    var periodId = ["start", "end"];
    var periodContent = ["", "", 0];
    var maxDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    //初始化
    date.setFullYear(year, month, 1);
    checkLeap();
    loadCalendar();


    //判断闰年
    function checkLeap() {
        if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
            maxDay[1] = 29;
        }
        else {
            maxDay[1] = 28
        }
    }

    //加载日历
    function loadCalendar() {
        var nowDate = new Date();
        var str = "";
        var nextLine = true;
        var firstLine = true;
        $(".calendar-main").remove();
        checkLeap();
        for (var i = 1; i <= maxDay[date.getMonth()]; i++) {
            if (nextLine) {
                str += "<tr class='calendar-main'>";
                nextLine = false;
            }
            if (firstLine) {
                for (var j = 0; j < date.getDay(); j++) {
                    str += ("<td class='close'><a href='#' onclick='clickDay(this);return false;' class='close' data-id='0'> </a></td>");
                }
                firstLine = false;
            }
            if (nowDate.getFullYear() > year || (nowDate.getFullYear() === year && nowDate.getMonth() > month) || (nowDate.getFullYear() === year && nowDate.getMonth() === month && nowDate.getDate() > i)) {
                str += ("<td class='close'><a href='#' onclick='clickDay(this);return false;' class='close' data-id='0'>" + Number(i) + "</a></td>");
            }
            else {
                var temp = year + "-" + (Number(month) + 1) + "-" + i;
                if (temp == $("#start").val() || temp == $("#end").val()) {
                    str += ("<td class='open'><a href='#' onclick='clickDay(this);return false;' data-id='2' class='active' id=" + temp + ">" + Number(i) + "</a></td>");
                }
                else {
                    str += ("<td class='open'><a href='#' onclick='clickDay(this);return false;' data-id='1' id=" + temp + ">" + Number(i) + "</a></td>");
                }
            }
            if ((i + date.getDay()) % 7 === 0) {
                str += "</tr>";
                nextLine = true;
                $("table").append(str);
                str = "";
                if (i === maxDay[date.getMonth()]) {
                    break;
                }
            }
            if (i === maxDay[date.getMonth()]) {
                while ((i + date.getDay()) % 7 !== 0) {
                    str += "<td class='close'> </td>";
                    i++;
                }
                str += "</tr>";
                $("table").append(str);
                str = "";
            }
        }
        $(".thisMonth>td").text(date.getMonth() + 1);
        $(".year-month>.content").text(year + "年" + (date.getMonth() + 1) + "月");
        var strMonth = month <= 8 ? "0" + (Number(month) + 1) : (Number(month) + 1);
        $("#yearMonth").val(year + "" + strMonth);
        checkBusy();
    }

    //处理日期进位和退位
    function checkDate() {
        if (month < 0) {
            year--;
            month += 12
        }
        else if (month > 11) {
            year++;
            month -= 12;
        }
    }

    //下个月
    function nextMonth() {
        month++;
        checkDate();
        date.setFullYear(year, month, 1);
        loadCalendar();
    }

    //上个月
    function preMonth() {
        month--;
        checkDate();
        date.setFullYear(year, month, 1);
        loadCalendar();
    }

    //检查时间是否被占用
    function checkBusy() {
        var allPeriod = timeStr.split("-_-");
        var currentYearMonth = $("#yearMonth").val();
        for (var i = 0; i < allPeriod.length; i++) {
            var oneOfPeriod = allPeriod[i].split("|");
            $(".calendar-main>td").each(function () {
                var tempDay = $(this).children().text();
                var tempDate = "";
                if (Number(tempDay) < 10) {
                    tempDate = currentYearMonth + "0" + tempDay;
                }
                else {
                    tempDate = currentYearMonth + "" + tempDay;
                }
                if (tempDate >= oneOfPeriod[0] && tempDate <= oneOfPeriod[1]) {
                    $(this).removeClass("open");
                    $(this).addClass("close");
                    $(this).children().addClass("close");
                    $(this).attr("data-id", 0);
                }
            })
        }
    }

    //处理点击日期的事件
    function clickDay(Tobj) {
        var obj = $(Tobj);
        var dataId = obj.attr("data-id");
        var id = year + "-" + (Number(month) + 1) + "-" + obj.text();

        if (dataId == 1 && periodContent[2] == 0) {
            obj.addClass("active");
            obj.attr("data-id", 2);
            for (var i = 0; i < 2; i++) {
                if (periodContent[i] == "") {
                    $("#" + periodId[i]).val(id);
                    periodContent[i] = id;
                    break;
                }
            }

        } else if (dataId == 2) {
            obj.removeClass("active");
            obj.attr("data-id", 1);
            $("#showSum").val("");
            if (id == $("#end").val()) {
                $("#end").val("");
                periodContent[1] = "";
            }
            else if (id == $("#start").val()) {
                $("#start").val("");
                periodContent[0] = "";
            }
        }
        checkEmpty();
        checkCorrectTime();
        if (periodContent[2] == 1) {
            compute();
            $("#smAppointment").removeClass("hidden");
        }
        else {
            $("#smAppointment").addClass("hidden");
        }
    }

    //检查是否填完
    function checkEmpty() {
        var isEmpty = false;
        for (var i = 0; i < 2; i++) {
            if (periodContent[i] == "") {
                isEmpty = true;
                break;
            }
        }
        if (isEmpty) {
            periodContent[2] = 0;
        }
        else {
            periodContent[2] = 1;
        }
    }

    //确保时间段正确
    function checkCorrectTime() {
        var start = $("#start").val();
        var end = $("#end").val();
        if (start != "" && end != "") {
            if (start > end) {
                $("#start").val(end);
                $("#end").val(start);
                temp = periodContent[0];
                periodContent[0] = periodContent[1];
                periodContent[1] = temp;
            }
        }
    }

    //计算天数
    function compute() {
        var start = periodContent[0];
        var end = periodContent[1];
        var startArr = start.split("-");
        var endArr = end.split("-");
        var sum = 0;
        var flag = true;
        while (flag) {
            sum++;
            endArr[2]--;
            if (endArr[2] == 0) {
                endArr[1]--;
                if (endArr[1] == 0) {
                    endArr[0]--;
                    endArr[1] = Number(endArr[1]) + 12;
                }
                endArr[2] = Number(endArr[2]) + maxDay[endArr[1] - 1];
            }
            if (startArr[0] == endArr[0] && startArr[1] == endArr[1] && startArr[2] == endArr[2]) {
                flag = false;
            }
        }
        $("#showSum").val(sum);
    }

    $("#smAppointment").on("click", function () {
        var obj = $(this);
        $.ajax({
            url: "appoint",
            data: {
                opt: 1,
                id: "<c:out value="${id}"/>",
                startTime:$("#start").val(),
                endTime:$("#end").val()
            },
            success: function (data) {
                if (data == "error") {
                    alert("预约失败，请重试");
                }
                else if (data == "login") {
                    alert("请先登录");
                }
            }
        });
    })
</script>
