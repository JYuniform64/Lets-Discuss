<%-- This jsp file is used for loadding '#substitute' when clicking 'Write Answer' button in 'Q&A' page. --%>
<%@ page language="java" import="java.util.*, com.group.jsp.*" contentType="text/html; charset=utf-8"%>

<%
    request.setCharacterEncoding("utf-8");
    if (request.getParameter("classid") == null)
        response.sendRedirect("index.jsp");
    String classid = request.getParameter("classid");
    if (request.getParameter("qid") == null)
        response.sendRedirect("index.jsp");
    String qid = request.getParameter("qid");
%>

<hr>
<div style="height: 4em;">
    <h2>Write Your Answer...</h2>
</div>
<form action="answer_handler.jsp?classid=<%=classid%>&qid=<%=qid%>" method="POST">
    <div class="input-group">
        <span class="input-group-text">Content</span>
        <textarea id="edit" class="form-control font-monospace"
            placeholder="Write the content of your answer here. Markdown supported." rows="15"
            name="content"></textarea>
    </div>
    <div id="show"
        style="margin: 2em 10px; border: 1px black solid; border-radius: 5px; height: 15em; overflow-y: scroll;">
    </div>
    <button id="submit_btn" class="btn btn-primary col-2 float-right" type="submit">Submit</button>
    <script>
        const textarea = document.getElementById('edit');
        textarea.addEventListener('keyup', rendermd);
    </script>
</form>