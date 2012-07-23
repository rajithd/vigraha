<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>
        <fmt:message key="login.error.title"/>
    </title>
    <link href="resources/Style/common.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="resources/Style/site.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="resources/Style/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="resources/Style/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>


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
                            <img src="resources/images/logo.png" width="400px" style="position:relative" />
                        </div>
                        <!--<div class='brand-text'><strong>Vigraha</strong>
                        </div>-->
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
                            <div class='ribbon-content'><fmt:message key="login.error.vigraha.logo.header"/> </div>
                            <div class='ribbon-left'></div>
                        </h1>

                        <div id='login-form'>
                            <form:form accept-charset="UTF-8" action="/app/login" class="form-horizontal formtastic web_user" id="new_web_user" method="post"><div style="margin:0;padding:0;display:inline">
                                <input name="utf8" type="hidden" value="&#x2713;" />
                                <input name="authenticity_token" type="hidden" value="iclzi38MWARQHg3by4BybNaR9+9gjN/dhQGqSW2gYt4=" /></div>
                                <input name='redirectUrl' type='hidden' value='/app/console'>


                                <h4 style="color:#F00"><fmt:message key="login.error.login.not.successful.label"/> </h4>

                                <a href="login">
                                    <fieldset class="form-actions"><input class="btn create" id="web_user_submit" name="commit" type="submit" value="Sign in" />



                                <!--<span class="style1">or
                <a href="Registration form.html">create an account</a></span>-->
                                </fieldset>
                            </a>
                            </form:form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--java scripts-->

<script src="resources/java_scripts/jquery.min.js" type="text/javascript"></script>
<script src="resources/java_scripts/jquery.validate.min.js" type="text/javascript"></script>
<script src="resources/java_scripts/form.js" type="text/javascript"></script>

</body>
</html>