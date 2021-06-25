<%@ page language="java" import="java.util.*, com.group.jsp.*" 
         contentType="text/html; charset=utf-8"
%>
<%
    request.setCharacterEncoding("utf-8");
    try {
        int uid = UserCtrl.getUid(request.getSession());
        String classid = request.getParameter("classid");
        String qid = request.getParameter("qid");
        String content = request.getParameter("content");
        if (classid == null || qid == null || content == null) {
            response.sendRedirect("index.jsp");
        }

        int question_id = Integer.parseInt(qid);
        Answer answer = Answer.makeNewAnswer(question_id, new Date(), uid, content);
        DbInstance.insertAnswer(answer);
        DbInstance.add1ResponseCount(question_id);
        response.sendRedirect("QApage.jsp?classid=" + classid);
    } catch (IllegalArgumentException i) {
        response.sendRedirect("login.html");
        return;
    }
%>