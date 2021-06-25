<%-- This jsp file is used for loadding '#main' when clicking 'Ask' button in 'Q&A' page. --%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>

<%
    request.setCharacterEncoding("utf-8");
    if (request.getParameter("classid") == null)
        response.sendRedirect("index.jsp");
    String classid = request.getParameter("classid");
%>

<form action="question_handler.jsp?classid=<%=classid%>" method="POST">
    <div class="input-group mb-3">
        <span class="input-group-text" id="title">Title</span>
        <input type="text" class="form-control" placeholder="Write the title of your question here." name="title">
    </div>
    <div class="input-group">
        <span class="input-group-text">Content</span>
        <textarea id="edit" class="form-control font-monospace"
            placeholder="Write the content of your question here. Markdown supported."
            rows="15" name="content"></textarea>
    </div>
    <div id="show"
        style="margin: 2em 10px; border: 1px black solid; border-radius: 5px; height: 15em; overflow-y: scroll;">
    </div>
    <button id="submit_btn" class="btn btn-primary col-2 float-right" type="submit">Submit Question</button>
    <script>
        const textarea = document.getElementById('edit');
        textarea.addEventListener('keyup', rendermd);
    </script>
</form>