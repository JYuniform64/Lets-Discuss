<%@ page language="java" import="java.util.*, com.group.jsp.*" 
         contentType="text/html; charset=utf-8"
%>
<%
    request.setCharacterEncoding("utf-8");
    String classid = request.getParameter("classid");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String question_type = request.getParameter("question_type");
    // need api to judge whether a session corresponds to a teacher
    boolean isTeacher = false;
    int type = 0;
    if (question_type.equals("post")) type = 1;

    if (classid == null || (content == null && title == null)) {
        response.sendRedirect("index.jsp");
    }

    Question question = Question.makeNewQuestion(Integer.parseInt(classid),
            title, content, Question.parseTags(""), Question.parseType(type), isTeacher);
    DbInstance.insertQuestion(question);
 
    response.sendRedirect("QApage.jsp?classid="+classid);
%>