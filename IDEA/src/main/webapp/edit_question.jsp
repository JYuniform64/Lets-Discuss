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
        <input type="text" name="title" class="form-control" placeholder="Write the title of your question here.">
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
    <div class="form-check form-check-inline">
    <input class="form-check-input" type="radio" name="question_type" id="inlineRadio1" value="question" checked="checked">
    <label class="form-check-label" for="inlineRadio1">question</label>
    </div>
    <div class="form-check form-check-inline">
    <input class="form-check-input" type="radio" name="question_type" id="inlineRadio2" value="post">
    <label class="form-check-label" for="inlineRadio2">post</label>
    </div>
    <button id="submit_btn" class="btn btn-primary col-2 float-right" type="submit">Submit</button>
    <script>
        const textarea = document.getElementById('edit');
        textarea.addEventListener('keyup', rendermd);

        function nl2br (str, is_xhtml) {
            var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br ' + '/>' : '<br>';
            return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
        }
        document.getElementById('submit_btn').onclick = function () {
            document.getElementById('edit').value = nl2br(document.getElementById('edit').value, false);
        }
    </script>
</form>