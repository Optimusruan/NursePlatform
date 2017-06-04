<%--
  Created by IntelliJ IDEA.
  User: wx
  Date: 2017/5/23
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</head>
<body>
<form action="uploadfile" method="post" enctype="multipart/form-data">
    <h2>文件上传</h2>
    文件:<input type="file" name="file" id="file"/><br/><br/>
    <%--<input type='file' name='file' id="file" class='upfile-temp' />--%>
    <input type="submit" value="上传"/>
<%--<button class="btn-uploadfile" accept="png/jpg" onsuccess="uploadcallback">上传文件</button>--%>
</form>

</body>
<script type="text/javascript">
</script>
</html>
