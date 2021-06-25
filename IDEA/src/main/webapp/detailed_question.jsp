<%-- This jsp file is used for loadding a specified question and its corresponding answers of 'Q&A' page. --%>
<%@ page language="java" import="java.util.*, java.text.SimpleDateFormat, com.group.jsp.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.SQLException" %>

<%
    request.setCharacterEncoding("utf-8");
    if (request.getParameter("qid") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    String qid = request.getParameter("qid");
    if (request.getParameter("classid") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    String classid = request.getParameter("classid");
    Question question = DbInstance.getQuestionById(Integer.parseInt(qid));
    List<Answer> answer_list = DbInstance.getAnswerListByQuestionId(question.id);
    if (question == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    DbInstance.add1ViewCount(question.id);
    question.view_count += 1;
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
%>

<div id="question" class="row">
    <div class="d-flex">
        <div id="question_title" class="p-2 flex-grow-1">
            <h2><%=question.title%></h2>
        </div>
        <div id="write_answer" class="p-2">
            <input class="btn btn-primary" type="button" value="Write Answer">
        </div>
    </div>
    <div id="question_info" class="small">
        <span id="question_create_date">Question Created: <%=simpleDateFormat.format(question.create_date)%></span>
        <span id="question_edit_date">Modified: <%=simpleDateFormat.format(question.modified_date)%></span>
        <span id="question_view">View: <%= question.view_count %></span>
    </div>
    <br><br>
    <hr />
    <div class="col-md-1">
        <div class="upvotejs" id="q<%=question.id%>">
            <a class="upvote" title="This is good stuff. Vote it up! (Click again to undo)"></a>
            <span class="count" title="Total number of votes"><%=question.good_question_count%></span>
            <a class="downvote"
                title="This is not useful. Vote it down. (Click again to undo)"></a>
            <a class="star" title="Mark as favorite. (Click again to undo)"></a>
        </div>
        <script>Upvote.create('q<%=question.id%>');</script>
        <!-- Shit... It cannot work properly. Wait for further debugging. Reference: https://github.com/janosgyerik/upvotejs -->
    </div>
    <div class="col-md-11">
        <div class="render">
            <%--might be buggy.--%>
            <%=question.content%>
        </div>
    </div>
</div>
<div id="substitute">
<div id="answer_header">
    <hr>
    <h2>Answers</h2>
    <br>
</div>
<% for (Answer answer: answer_list) {%>
<div id="answers_id" class="row">
    <div class="col-md-1">
        <div class="upvotejs" id="a<%=answer.id%>">
            <a class="upvote" title="This is good stuff. Vote it up! (Click again to undo)"></a>
            <span class="count" title="Total number of votes">1</span>
            <a class="downvote"
                title="This is not useful. Vote it down. (Click again to undo)"></a>
        </div>
        <script>Upvote.create('a<%=answer.id%>');</script>
    </div>
    <div class="col-md-11">
        <div class="render">
            <%--might be buggy.--%>
            <%=answer.content%>
        </div>
        <br>
        <div id="answer_info" class="d-flex">
            <div class="p-2 flex-grow-1">
                <a href="#">comment</a>
            </div>
            <div class="p-2">
                Answered by: <a id="username" href="#"><%=DbInstance.getUserById(answer.user_id).name%></a>
            </div>
        </div>
        <hr>
    </div>
</div>
<%}%>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.0.1/highlight.min.js"
        integrity="sha512-W7EehcwtSbRF63FIQlXEOOd5mnq0Et0V0nUOvwcUvjnCKgOLLYbqriQxEQSp63sfrkryxIg/A/O8v8O18QwQCQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.0.1/styles/a11y-dark.min.css"
      integrity="sha512-Vj6gPCk8EZlqnoveEyuGyYaWZ1+jyjMPg8g4shwyyNlRQl6d3L9At02ZHQr5K6s5duZl/+YKMnM3/8pDhoUphg=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/markdown-it-latex2img@latest/dist/markdown-it-latex2img.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/markdown-it@11.0.0/dist/markdown-it.min.js"
        crossorigin="anonymous"></script>
<script>
    var md = window.markdownit();
    md.use(window.markdownitLatex2img);
    var blocks = document.getElementsByClassName('render');
    [].forEach.call(blocks, function (block) {
        block.innerHTML = md.render(block.innerText);
    });
    hljs.highlightAll();

    document.getElementById('write_answer').onclick = function() {
        $('#substitute').load('edit_answer.jsp?classid=<%=classid%>&qid=<%=qid%>');
    }
</script>
