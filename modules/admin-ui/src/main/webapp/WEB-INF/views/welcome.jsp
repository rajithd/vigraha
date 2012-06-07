<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>	<!----- accordion js -------->

<script type="text/javascript" src="java scripts/ddaccordion.js"></script>

<script type="text/javascript">

    ddaccordion.init({
        headerclass: "headerbar", //Shared CSS class name of headers group
        contentclass: "submenu", //Shared CSS class name of contents group
        revealtype: "mouseover", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
        mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
        collapseprev: true, //Collapse previous content (so only one open at any time)? true/false
        defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc] [] denotes no content
        onemustopen: true, //Specify whether at least one header should be open always (so never all headers closed)
        animatedefault: false, //Should contents open by default be animated into view?
        persiststate: true, //persist state of opened contents within browser session?
        toggleclass: ["", "selected"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
        togglehtml: ["", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
        animatespeed: "normal", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
        oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
            //do nothing
        },
        onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
            //do nothing
        }
    })

</script>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
        <fmt:message key="welcome.title"/>
    </title>

    <script src="http://code.jquery.com/jquery-1.7.min.js"></script>

    <script src="java scripts/bootstrap-carousel.js"></script>		<!-- Image Slide Show -->

    <script src="java scripts/bootstrap-dropdown.js"></script>		<!-- DropDown Menu -->


    <link href="../resources/Style/style.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />

    <style type="text/css">
        <!--
        .style1 {color: #7C1099}
        .style2 {font-size: 36px}
        .style4 {font-family: Arial, Helvetica, sans-serif}
        -->
    </style>

    <style type="text/css"> <!--accordian-->

.urbangreymenu{
        width: 190px; /*width of menu*/
    }

    .urbangreymenu .headerbar{
        font: bold 13px Verdana;
        color: white;
        /*background: #606060 url(arrowstop.gif) no-repeat 8px 6px; *//*last 2 values are the x and y coordinates of bullet image*/
        margin-bottom: 0; /*bottom spacing between header and rest of content*/
        text-transform: uppercase;
        padding: 7px 0 7px 31px; /*31px is left indentation of header text*/
    }

    .urbangreymenu .headerbar a{
        text-decoration: none;
        color: white;
        display: block;
    }

    .urbangreymenu ul{
        list-style-type: none;
        margin: 0;
        padding: 0;
        margin-bottom: 0; /*bottom spacing between each UL and rest of content*/
    }

    .urbangreymenu ul li{
        padding-bottom: 2px; /*bottom spacing between menu items*/
    }

    .urbangreymenu ul li a{
        font: normal 12px Arial;
        color: black;
        background: #E9E9E9;
        display: block;
        padding: 5px 0;
        line-height: 17px;
        padding-left: 8px; /*link text is indented 8px*/
        text-decoration: none;
    }

    .urbangreymenu ul li a:visited{
        color: black;
    }

    .urbangreymenu ul li a:hover{ /*hover state CSS*/
        color: white;
        background: black;
    }

    </style>

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
                <li><a href="Registration form.html">Register</a></li>
                <li><a href="Login Page.html">Sign In</a></li>
            </ul>
            <form class="navbar-search pull-right">
                <input type="text" class="search-query" placeholder="Search">
            </form>

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

    <img src="../resources/Images/header_bar.png" />

</div>

<br />
<br />
<br />

<div class="container">			<!------------------------- Container ---------------------------->

    <div class="content">

        <br />

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="span3">

                    <!--accordian-->

                    <div class="urbangreymenu">

                        <h3 class="headerbar"><a href="http://www.dynamicdrive.com/style/">Administrator</a></h3>
                        <ul class="submenu">
                            <li><a href="promotion">Promotion Program</a></li>
                            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C2/">Vertical CSS Menus</a></li>
                            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C4/">Image CSS</a></li>
                            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C6/">Form CSS</a></li>
                            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C5/">DIVs and containers</a></li>
                            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C7/">Links & Buttons</a></li>
                            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C8/">Other</a></li>
                            <li><a href="http://www.dynamicdrive.com/style/csslibrary/all/">Browse All</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="http://www.javascriptkit.com">Promotions</a></h3>
                        <ul class="submenu">
                            <li><a href="http://www.javascriptkit.com/cutpastejava.shtml" >Free JavaScripts</a></li>
                            <li><a href="http://www.javascriptkit.com/javatutors/">JavaScript tutorials</a></li>
                            <li><a href="http://www.javascriptkit.com/jsref/">JavaScript Reference</a></li>
                            <li><a href="http://www.javascriptkit.com/dhtmltutors/">DHTML & CSS</a></li>
                            <li><a href="http://www.javascriptkit.com/howto/">Web Design</a></li>
                            <li><a href="http://www.javascriptkit.com/java/">Free Java Applets</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="http://www.javascriptkit.com">Reporting</a></h3>
                        <ul class="submenu">
                            <li><a href="http://www.javascriptkit.com/cutpastejava.shtml" >Free JavaScripts</a></li>
                            <li><a href="http://www.javascriptkit.com/javatutors/">JavaScript tutorials</a></li>
                            <li><a href="http://www.javascriptkit.com/jsref/">JavaScript Reference</a></li>
                            <li><a href="http://www.javascriptkit.com/dhtmltutors/">DHTML & CSS</a></li>
                            <li><a href="http://www.javascriptkit.com/howto/">Web Design</a></li>
                            <li><a href="http://www.javascriptkit.com/java/">Free Java Applets</a></li>
                        </ul>

                    </div>


                </div>

                <div class="container">

                    <div class="span9">		<!--image-slideshow-->

                        <div id="myCarousel" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="../resources/Images/4.png" alt="">
                                    <div class="carousel-caption">
                                        <h4>Vigraha</h4>
                                        <p>What is Vigraha ?
                                            Analyze CDR records and produce output based on dynamic rules.
                                            Subscriber Profiling.
                                        </p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="../resources/Images/6.png" alt="">
                                    <div class="carousel-caption">
                                        <h4>CDR (Call Detail Record)</h4>
                                        <p>What is CDR analyzer ?
                                            Process CDR records and produced only useful outputs to telecommunication companies.
                                        </p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="../resources/Images/9.png" alt="">
                                    <div class="carousel-caption">
                                        <h4>To Whom it is useful ?</h4>
                                        <p>This is a framework intended for telecommunication companies with custom configurations that will suit them.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                        </div>

                    </div>

                </div>			<!-- Container -->


            </div>
        </div>

        <hr />						<!------------------------ footer ------------------------------------------->

        <footer class="container">

            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&copy; 2012 by <a href="#">Vigraha</a>
                • Powered by <a href="#">SLIIT</a>
                • <a href="#">Alright reserved</a> by <a href="#">Vigraha</a>
            <p></p>

        </footer>

    </div>
</div>
</body>
</html>