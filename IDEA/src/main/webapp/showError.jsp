<%--
  Created by IntelliJ IDEA.
  User: lcxlh
  Date: 2021/06/25
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage = "true" %>

<html>
<head>
    <title>Show Error Page</title>
</head>

<body>
<h1>Opps...</h1>
<p>Sorry, an error occurred.</p>
<p>Here is the exception stack trace: </p>
<pre><% exception.printStackTrace(response.getWriter()); %></pre>
</body>

</html>
