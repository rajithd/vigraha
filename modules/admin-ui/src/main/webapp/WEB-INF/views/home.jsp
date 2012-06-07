<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset='utf-8'>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
    <title>
        <fmt:message key="home.title"/>
    </title>
    <meta content='' name='description'>
    <meta content='' name='author'>
    <meta content='width=device-width, initial-scale=1.0' name='viewport'>

    <link href="../resources/Style/common.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="../resources/Style/site.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="../resources/Style/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="../resources/Style/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>


    <style type="text/css">
        <!--
        .style1 {
            color: #7C1099
        }

        -->
    </style>
</head>
<body class='simple login show'>

<header>
    <div class='section-top' id='top'>
        <div class='container'></div>
    </div>
    <nav class='section-nav' id='nav'>
        <div class='navbar'>
            <div class='container'>
                <div class='brand'>
                    <a href="/app/">
                        <div class='brand-image'>
                            <img src="../resources/Images/Vigraha Logo final.png" width="400px"
                                 style="position:relative"/>
                        </div>
                    </a></div>
            </div>
        </div>
    </nav>

</header>

<div class='section-striped' id='content'>
    <div class='container'>
        <div>
            <div class='row row-flush-right'>
                <div class='offset2 column-content grid-wrapper'>
                    <div class='span8 span-flush-right'>
                        <h1 class='ribbon'>
                            <div class='ribbon-content'>Sign in to Vigraha</div>
                            <div class='ribbon-left'></div>
                        </h1>

                        <div id='login-form'>
                            <form:form action="" class="form-horizontal formtastic web_user" id="new_web_user" method="post">
                                <form:form class="form-horizontal formtastic web_user" id="new_web_user" method="post">

                                <div class="string optional control-group" id="web_user_rhlogin_input">
                                    <label for="username" class="control-label style1">Login</label>

                                    <div class="controls"><input autofocus="autofocus" class="" id="username"
                                                                 name="username" placeholder=""
                                                                 type="text"/>
                                    </div>
                                </div>

                                <div class="password optional control-group" id="web_user_password_input">
                                    <label for="password" class="control-label style1">Password</label>

                                    <div class="controls"><input class="" id="password"
                                                                 name="password" type="password"/>

                                        <p class="help-block"><a href="forget-password" class="style1">Forgot
                                            your password?</a></p>
                                    </div>
                                </div>

                                <fieldset class="form-actions">
                                    <button type="submit" class="btn btn-primary">Sign in</button>
	<span class="style1">or
		<a href="registration">create an account</a></span>
                                </fieldset>
                                </form:form>
                            </form:form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js" type="text/javascript"></script>
</body>
</html>


