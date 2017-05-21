<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/20
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach items="${info}" var="item">
    <div class="itemContainer">
        <a href="nurseDetail?id=<c:out value="${item.nurId}"/>">
            <div class="itemImg">
                <c:choose>
                    <c:when test="${item.nurAvt!=null}">
                        <img src="<c:out value="${item.nurAvt}"/> " alt="">
                    </c:when>
                    <c:otherwise>
                        <img src="assets/img/home1.jpg" alt="" width="150" height="200">
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
                    <span><c:out value="${item.nurRank}"/></span>
                </div>
            </div>
        </a>
    </div>
</c:forEach>


