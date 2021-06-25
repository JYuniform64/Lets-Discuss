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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
            integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
            crossorigin="anonymous"></script>
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
        <form action="./UploadApi" method="post" enctype="multipart/form-data" onsubmit="return check()">
            <label class="form-label" for="customFile">Upload Resource File</label>
            <input type="file" class="form-control" id="customFile" name="file" />
            <button type="submit" class="btn btn-primary mt-1" id="upload" name="upload">Upload</button>
        </form>
    </div>
    <div class="m-auto w-50 mt-3">
        <div class="list-group">
            <%for (UploadFile i:fileList){%>
                <a href="<%=i.url%>" class="list-group-item list-group-item-action active">
                    <%=i.name%>
                </a>
            <%}%>
        </div>
    </div>
</div>
</body>
<script>
    function check() {
        if(document.getElementById("customFile").files.length == 0) {
            alert("You have not select any file yet!");
            return false;
        }
        return true;
    }
</script>
</html>
