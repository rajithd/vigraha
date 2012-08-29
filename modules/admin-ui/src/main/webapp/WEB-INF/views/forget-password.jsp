<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta charset='utf-8'>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
    <title>
        <fmt:message key="forget.password.title"/>
    </title>
    <meta content='' name='description'>
    <meta content='' name='author'>
    <meta content='width=device-width, initial-scale=1.0' name='viewport'>
    <link href='/app/images/favicon-32.png' rel='shortcut icon' type='image/png'>
    <link href="resources/Style/overpass.css" media="all" rel="stylesheet" type="text/css" />
    <script src="resources/java_scripts/modernizr.min.js" type="text/javascript"></script>
    <meta name="csrf-param" content="authenticity_token"/>
    <meta name="csrf-token" content="iclzi38MWARQHg3by4BybNaR9+9gjN&#x2F;dhQGqSW2gYt4="/>

    <link href="resources/Style/common.css" media="all" rel="stylesheet" type="text/css" />
    <link href="resources/Style/site.css" media="all" rel="stylesheet" type="text/css" />
    <link href="resources/Style/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="resources/Style/bootstrap-responsive.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        <!--
        .style1 {color: #7C1099}
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
                            <img src="resources/images/logo.png" width="400px" style="position:relative" />
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
                            <div class='ribbon-content'><fmt:message key="forget.password.vigraha.logo.header"/> </div>
                            <div class='ribbon-left'></div>
                        </h1>

                        <div id='login-form'>
                            <form accept-charset="UTF-8" action="/app/login" class="form-horizontal formtastic web_user" id="new_web_user" method="post"><div style="margin:0;padding:0;display:inline">
                                <input name="utf8" type="hidden" value="&#x2713;" />
                                <input name="authenticity_token" type="hidden" value="iclzi38MWARQHg3by4BybNaR9+9gjN/dhQGqSW2gYt4=" /></div>
                                <input name='redirectUrl' type='hidden' value='/app/console'>


                                <div class="string optional control-group" id="web_user_rhlogin_input">
                                    <label for="web_user_rhlogin" class="control-label style1"><fmt:message key="forget.password.email.address.label"/> </label>
                                    <div class="controls"> <input autofocus="autofocus" class="" id="web_user_rhlogin" name="web_user[rhlogin]" placeholder=""
                                                                  type="text" />
                                    </div>
                                </div>

                                <!--<div class="password optional control-group" id="web_user_password_input">
                                    <label for="web_user_password" class="control-label style1">Password</label>
                                        <div class="controls"><input class="" id="web_user_password" name="web_user[password]" type="password" />
                                            <p class="help-block"><a href="/app/account/password/new" class="style1">Forgot your password?</a></p>
                                        </div>
                                </div>
                                -->
                                <fieldset class="form-actions"><input class="btn create" id="web_user_submit" name="commit" type="submit" value="Send" />


                                    <!--<span class="style1">or
                 <a href="Registration form.html">create an account</a></span>-->
                                </fieldset></form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--java scripts-->

<script src="resources/java_scripts/jquery.min.js" type="text/javascript"></script>
<script src="resources/java_scripts/rails.js" type="text/javascript"></script>
<script src="resources/java_scripts/plugins.js" type="text/javascript"></script>
<script src="resources/java_scripts/jquery.cookie.js" type="text/javascript"></script>
<script src="resources/java_scripts/jquery.validate.min.js" type="text/javascript"></script>
<script src="resources/java_scripts/form.js" type="text/javascript"></script>


<script src="resources/java_scripts/tracking.js" type="text/javascript"></script>
<script src="resources/java_scripts/s_code.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript"><!--
s.pageName="openshift | login | show"
s.server=""
s.channel=""
s.heir1=""
s.pageType=""
s.prop1=""
s.prop2=""
s.prop3=""
s.prop4=""
s.prop5=""
/* Conversion Variables */
s.campaign=""
s.state=""
s.zip=""
s.events=""
s.products=""
s.purchaseID=""
s.eVar1=""
s.eVar2=""
s.eVar3=""
s.eVar4=""
s.eVar5=""
s.eVar8=""
s.eVar51=""
s.eVar27=""
s.eVar28=""
s.eVar29=""
/************* DO NOT ALTER ANYTHING BELOW THIS LINE ! **************/
var s_code=s.t();if(s_code)document.write(s_code)//--></script>
<script language="JavaScript" type="text/javascript"><!--
if(navigator.appVersion.indexOf('MSIE')>=0)document.write(unescape('%3C')+'\!-'+'-')
//--></script><noscript><img src="http://redhat.122.2o7.net/b/ss/redhatopenshift/1/H.23.3--NS/0"
                             height="1" width="1" border="0" alt="" /></noscript><!--/DO NOT REMOVE/-->
<!-- End SiteCatalyst code version: H.23.3. -->

</body>
</html>