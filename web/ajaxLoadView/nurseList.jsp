<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/20
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${info}" var="item">
<div class="itemContainer">
    <div class="itemImg">
        <img src="<c:out value="${item.nurAvt}"/> " alt="">
    </div>
    <div class="itemInfo">
        <div><c:out value="${item.nurName}"/></div>      
        <div><c:out value="${item.nurRank}"/></div>
    </div>
</div>
</c:forEach>

