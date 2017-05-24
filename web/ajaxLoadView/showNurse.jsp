<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/21
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${info}" var="item">
    <div class="itemContainer">
        <div class="itemImg" style="float: left;">
            <img src="<c:out value="${item.nurAvt}"/> " alt="">
        </div>
        <div class="itemInfo" style="float: right">
            <div><h4>姓名：<c:out value="${item.nurName}"/></h4></div>
            <div>等级
                <c:forEach begin="1" end="${item.nurRank}">
                    <i class="fa fa-star fa-1x" aria-hidden="true" style="color: #E91E63"></i>
                </c:forEach >
            </div>
            <div>年龄：<c:out value="${item.nurAge}"/></div>
            <div>籍贯：<c:out value="${item.nurAdd}"/></div>
            <div>学历：<c:out value="${item.nurEdu}"/></div>
            <div class="rank"><a href="nurseDetail?id=${item.nurId}" style="color: white;text-decoration:none;">查看详情</a></div>
        </div>
    </div>
</c:forEach>