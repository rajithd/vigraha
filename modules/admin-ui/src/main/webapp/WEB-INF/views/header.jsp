<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div class="navbar">											 <!----------------------- Navigation Bar -------------------------------->
    <div class="navbar-inner">
        <div class="container">

            <ul class="nav">

                <a class="brand" href="#">Vigraha</a>
                <li class="active">

                    <a href="#">Home</a>
                </li>
                <li><a href="admin-registration">Register</a></li>
                <li><a href="home">Sign In</a></li>
            </ul>
            <form:form class="navbar-search pull-right">
                <input type="text" class="search-query" placeholder="Search">
            </form:form>

            <ul class="nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrator <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">User Privilages</a></li>
                        <li><a href="#">Authuntication</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>

            </ul>

        </div>
    </div>
</div>

<div id="header-bar">				<!-------------------------- Header Bar ----------------------------------->

    <img src="resources/Images/43.png" />

</div>

<br />
<br />
<br />
</body>
</html>