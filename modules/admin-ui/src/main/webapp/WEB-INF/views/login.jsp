<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title><fmt:message key="login.title"/></title>

    <link href="../../resources/Style/common.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="../../resources/Style/site.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="../../resources/Style/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/Style/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>

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
                    <div class='brand-image'>
                        <img src="../../resources/Images/logo.png" width="400px" style="position:relative"/>
                    </div>
                </div>
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
                            <div class='ribbon-content'><fmt:message key="login.vigraha.logo.header"/> </div>
                            <div class='ribbon-left'></div>
                        </h1>

                        <div id='login-form'>
                            <form action="<c:url value="/j_spring_security_check" />" class="form-horizontal formtastic web_user" id="new_web_user" method="post">

                                <div class="string optional control-group" id="web_user_rhlogin_input">
                                    <label for="web_user_rhlogin" class="control-label style1">Login</label>
                                    <div class="controls"> <input autofocus="autofocus" class="" id="web_user_rhlogin" name="j_username" placeholder=""
                                                                  type="text" />
                                    </div>
                                </div>

                                <div class="password optional control-group" id="web_user_password_input">
                                    <label for="web_user_password" class="control-label style1">Password</label>
                                    <div class="controls"><input class="" id="web_user_password" name="j_password" type="password" />
                                        <p class="help-block"><a href="forget-password" class="style1">Forgot your password?</a></p>
                                    </div>
                                </div>
                                <fieldset class="form-actions"><input class="btn create" id="web_user_submit" name="commit" type="submit" value="Sign in"/>
                                </fieldset></form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="common/footer.jsp"/>

<script src="../../resources/java_scripts/jquery.min.js" type="text/javascript"></script>
<script src="../../resources/java_scripts/jquery.validate.min.js" type="text/javascript"></script>
<script src="../../resources/java_scripts/form.js" type="text/javascript"></script>

</body>
</html>
