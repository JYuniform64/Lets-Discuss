<%@ page language="java" import="com.group.jsp.DbInstance, com.group.jsp.Question" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <style>
        .wrap {
            overflow: hidden;
            position: absolute;
            z-index: -1;
            width: 100%;
            height: 100%;
        }

        canvas {
            width: 100%;
            height: 100%;
        }

        #HQ {
            border: royalblue 3px solid;
        }
    </style>
    <title>Let's Discuss</title>
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
    <div class="wrap">
        <canvas id="bubble"></canvas>
    </div>

    <div class="w-50 m-auto rounded px-4 py-3 mt-2" id="HQ">
        <h2>Hot Questions</h2>
        <ul class="list-group">
            <%for (Question i: DbInstance.getTop10Question()) { %>
            <a href="<%=String.format("QApage.jsp?classid=%d&qid=%d", i.class_id, i.id) %>"
                       class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex justify-content-between">
                    <h5 class="mb-1"><%=i.title%></h5>
                    <small><%=i.create_date%></small>
                </div>
                <p class="mb-1"><%=DbInstance.getClassById(i.class_id).name%></p>
                <small><%=(i.tags.length == 0)?"":i.tags[0]%></small>
            </a>
            <%}%>
        </ul>
    </div>

</div>
<script src="js/bubble.js"></script>
<!-- TODO: footer -->
</body>

</html>