<%@ page import="com.group.jsp.UserCtrl" %>
<%@ page import="com.group.jsp.DbInstance" %>
<!-- Nav bar. Ajax loaded into every page. -->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop1" data-toggle="dropdown">
                    Classes
                </a>
                <!-- further modification: dynamic generate classes user attended -->
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Class 1</a>
                    <a class="dropdown-item" href="#">Class 2</a>
                    <a class="dropdown-item" href="#">Class 3</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">More</a>
                </div>
                <!-- end -->
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Class info</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Q&A</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Resource</a>
            </li>
        </ul>
    </div>
    <div class="mx-auto order-0">
        <a class="navbar-brand mx-auto" href="#">Let's Discuss</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    <%if (UserCtrl.isSignIn(request.getSession())) {%>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <a class="navbar-brand" href="#">
                <img src="https://i.stack.imgur.com/rYsym.png" style="width:40px;">
            </a>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">
                    <%= DbInstance.getUserById(UserCtrl.getUid(request.getSession())).name %>>
                </a>
                <!-- further modification: show differently whether login -->
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">personal space</a>
                    <a class="dropdown-item" href="#">setting</a>
                    <a class="dropdown-item" href="/LoginApi?method=logout">log out</a>
                </div>
                <!-- end -->
            </li>
        </ul>
    </div>
    <%} else {%>
    <div class="w-100 order-3 mr-1">
        <a class="nav-link ml-auto" href="login.html" style="width: 100px">Login</a>
    </div>
    <%}%>
</nav>