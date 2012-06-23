<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <!--<script type="text/javascript"; src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js";></script>-->	<!----- accordion js -------->

    <script type="text/javascript" src="resources/java_scripts/jquery.min.js"></script>

    <script type="text/javascript" src="resources/java_scripts/ddaccordion.js"></script>

    <script type="text/javascript" src="resources/java_scripts/jquery.min.js"></script>

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

    <style type="text/css">
        <!------------------------------------- accordian ------------------------------------------------>

        .urbangreymenu{
            width: 190px; /*width of menu*/
        }

        .urbangreymenu .headerbar{
            font: bold 13px Verdana;
            color: white;
            background-color:#666; /*last 2 values are the x and y coordinates of bullet image*/
            margin-bottom: 5px; /*bottom spacing between header and rest of content*/
            text-transform: uppercase; /*31px is left indentation of header text*/
            padding-top: 7px;
            padding-right: 0;
            padding-bottom: 7px;
            padding-left: 31px;
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


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
        <fmt:message key="welcome.title"/>
    </title>

    <script src="http://code.jquery.com/jquery-1.7.min.js"></script>

    <script src="resources/java_scripts/bootstrap-carousel.js"></script>		<!-- Image Slide Show -->

<script src="resources/java_scripts/bootstrap-dropdown.js"></script>		<!-- DropDown Menu -->

    <link href="resources/Style/style.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />


    <style type="text/css">
        <!--
        .style1 {color: #7C1099}
        .style2 {font-size: 36px}
        .style4 {font-family: Arial, Helvetica, sans-serif}
        -->
    </style>

</head>
<body>
<jsp:include page="header.jsp"/>


<div class="container">			<!------------------------- Container ---------------------------->

    <div class="content">

        <br />

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="span3">

                    <!------------------------------------------------------------ accordian ------------------------------------------------->

                    <div class="urbangreymenu">

                        <h3 class="headerbar"><a href="#">Administrator</a></h3>
                        <ul class="submenu">
                            <li><a href="promotion">Add Promotion</a></li>
                            <li><a href="#">Search Programme</a></li>
                            <li><a href="admin-registration">Create New Administrator</a></li>
                            <li><a href="company-registration">Create New Company</a></li>
                            <li><a href="forget-password">Change password</a></li>
                            <li><a href="#">Modify/Delete admin account</a></li>
                            <li><a href="home">Logout</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="#">Promotion Program</a></h3>
                        <ul class="submenu">
                            <li><a href="#">Promotion Programe report - Yearly</a></li>
                            <li><a href="#">Promotion Programe report - Monthly</a></li>
                            <li><a href="#">Promotion Programe report - Daily</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="#">Loyality Program</a></h3>
                        <ul class="submenu">
                            <li><a href="#" >Loyality Program report - Yearly</a></li>
                            <li><a href="#">Loyality Program report - Monthly</a></li>
                            <li><a href="#">Loyality Program report - Daily</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="#">Tenure Program Reports</a></h3>
                        <ul class="submenu">
                            <li><a href="#" >Tenure Program report - Yearly</a></li>
                            <li><a href="#">Tenure Program report - Monthly</a></li>
                            <li><a href="#">Tenure Program report - Daily</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="#">Subscriber Details User Management</a></h3>
                        <ul class="submenu">
                            <li><a href="#" >Tenure Program report - Yearly</a></li>
                            <li><a href="#">Tenure Program report - Monthly</a></li>
                            <li><a href="#">Tenure Program report - Daily</a></li>
                        </ul>


                    </div>


                </div>			<!----- accordian end ------->

                <div class="container">

                    <div class="span9">		<!----------------- image-slideshow ------------------->

                        <div id="myCarousel" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="resources/Images/1.png" alt="">
                                    <div class="carousel-caption">
                                        <h4>Vigraha</h4>
                                        <p>What is Vigraha ?
                                            Analyze Caller Detail Records(CDR) and produce output based on dynamic rules.
                                            Subscriber Profiling.
                                        </p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="resources/Images/13.png" alt="">
                                    <div class="carousel-caption" >
                                        <h4>CDR (Call Detail Record)</h4>
                                        <p>What is CDR analyzer ?
                                            Process CDR records and produced only useful outputs to telecommunication companies.
                                        </p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="resources/Images/6.png" alt="">
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

                </div>			<!------ Container end -------------->


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