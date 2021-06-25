<%@ page language="java" import="java.util.*, com.group.jsp.*" 
         contentType="text/html; charset=utf-8"
%>
<%
    request.setCharacterEncoding("utf-8");
    int uid = UserCtrl.getUid(request.getSession());
    String classid = request.getParameter("classid");
    String qid = request.getParameter("qid");
    String content = request.getParameter("content");
    if (classid == null || qid == null || content == null) {
        response.sendRedirect("index.jsp");
    }

    Answer answer = Answer.makeNewAnswer(Integer.parseInt(qid), new Date(), uid, content);
    DbInstance.insertAnswer(answer);

    response.sendRedirect("QApage.jsp?classid="+classid);
%>