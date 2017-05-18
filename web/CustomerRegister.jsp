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
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

</head>
<body>
<form:form>
    <div class="form-group">
        <label class="col-lg-3" for="name">姓名：</label>
        <input type="text" class="col-lg-9 form-control" id="name" name="name"/>
    </div>
</form:form>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
