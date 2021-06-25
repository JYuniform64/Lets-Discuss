<%@ page import="java.io.File" %>
<%@ page import="com.group.jsp.UploadFile" %>
<%@ page import="com.group.jsp.DbInstance" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lcxlh
  Date: 2021/06/25
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<UploadFile> fileList = DbInstance.getUploadFileList();
%>
<html>
<head>
    <title>Resource</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<script>
    $(document).ready(function () {
        $('#navbar').load('navbar.jsp');
    })
</script>
<body>
<div id="navbar">
</div>
<div id="content">
    <div class="m-auto w-50">
        <form action="./UploadApi" method="post" enctype="multipart/form-data">
            <label class="form-label" for="customFile">Upload Resource File</label>
            <input type="file" class="form-control" id="customFile" name="file" />
            <button type="submit" class="btn btn-primary mt-1" id="upload" name="upload">Upload</button>
        </form>
    </div>
    <div class="m-auto w-50 mt-3">
        <div class="list-group">
            <%for (UploadFile i:fileList){%>
                <a href=<%=i.url%> class="list-group-item list-group-item-action active">
                    <%=i.name%>
                </a>
            <%}%>
        </div>
    </div>
</div>
</body>
</html>
