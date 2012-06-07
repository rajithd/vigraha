<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> <!----- accordion js -------->

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

    <script src="java scripts/bootstrap-dropdown.js"></script>		<!------------------- DropDown Menu js ----------------------------------------->

<script src="http://code.jquery.com/jquery-1.7.min.js"></script>	<!------------------------ datepicker js ----------------------------->

    <script type="text/javascript" src="java scripts/bootstrap-datepicker.js"></script>

    <script>
    $(function(){
        window.prettyPrint && prettyPrint();
        $('#dp1').datepicker({
            format: 'mm-dd-yyyy'
        });
        $('#dp2').datepicker();
        $('#dp3').datepicker();


        var startDate = new Date(2012,1,20);
        var endDate = new Date(2012,1,25);
        $('#dp4').datepicker()
                .on('changeDate', function(ev){
                    if (ev.date.valueOf() > endDate.valueOf()){
                        $('#alert').show().find('strong').text('The start date can not be greater then the end date');
                    } else {
                        $('#alert').hide();
                        startDate = new Date(ev.date);
                        $('#startDate').text($('#dp4').data('date'));
                    }
                    $('#dp4').datepicker('hide');
                });
        $('#dp5').datepicker()
                .on('changeDate', function(ev){
                    if (ev.date.valueOf() < startDate.valueOf()){
                        $('#alert').show().find('strong').text('The end date can not be less then the start date');
                    } else {
                        $('#alert').hide();
                        endDate = new Date(ev.date);
                        $('#endDate').text($('#dp5').data('date'));
                    }
                    $('#dp5').datepicker('hide');
                });
    });
    </script>

    <script type="text/javascript" src="java scripts/bootstrap.js"></script>			<!------------------------ timepicker js ------------------------>

    <script type="text/javascript" src="java scripts/bootstrap-timepicker-0.3.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $('.modal-timepicker').timepicker({
                defaultTime: 'current',
                minuteStep: 15,
                disableFocus: true,
                template: 'modal'
            });
            $('.dropdown-timepicker').timepicker({
                defaultTime: 'current',
                minuteStep: 15,
                disableFocus: true,
                template: 'dropdown'
            });

        });
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
       <fmt:message key="promotion.title"/>
    </title>

    <link href="../resources/Style/style.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/jquery.datepick.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/datepicker.less" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/timepicker.css" type="text/css" rel="stylesheet" />

    <style type="text/css">
        <!--
        .style1 {color: #7C1099}
        .style2 {font-size: 36px}
        .style4 {font-family: Arial, Helvetica, sans-serif}
        -->
    </style>

    <style type="text/css">						<!----------------------- timepicker css ------------------------------->
    body {
        padding-bottom: 40px;
        position: relative;
        padding-top: 50px;
    }
    </style>

    <style type="text/css"> 					<!----------------------- accordian css ------------------------------->

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
<div class="navbar">											 <!--Navigation Bar-->
    <div class="navbar-inner">
        <div class="container">

            <ul class="nav">

                <a class="brand" href="#">Vigraha</a>
                <li class="active">

                    <a href="#">Home</a>
                </li>
                <li><a href="registration">Register</a></li>
                <li><a href="home">Sign In</a></li>
            </ul>
            <form:form class="navbar-search pull-right">
                <input type="text" class="search-query" placeholder="Search">
            </form:form>

            <ul class="nav">
                <li class="dropdown">
                    <a href="#"	class="dropdown-toggle"	 data-toggle="dropdown">Login<b class="caret"></b></a>
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

<div id="header-bar">				<!-- Header Bar -->
    <img src="../resources/Images/66.png" />
</div>

<br />
<br />
<br />

<div class="container">			<!------------------------- Container ---------------------------->

<div class="content">

<br />

<div class="container-fluid">

<div class="row-fluid">

<div class="span3">			<!------------------------------- accordian menu ----------------------------->

    <div class="urbangreymenu">

        <h3 class="headerbar"><a href="http://www.dynamicdrive.com/style/">Administrator</a></h3>
        <ul class="submenu">
            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C1/">Horizontal CSS Menus</a></li>
            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C2/">Vertical CSS Menus</a></li>
            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C4/">Image CSS</a></li>
            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C6/">Form CSS</a></li>
            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C5/">DIVs and containers</a></li>
            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C7/">Links & Buttons</a></li>
            <li><a href="http://www.dynamicdrive.com/style/csslibrary/category/C8/">Other</a></li>
            <li><a href="http://www.dynamicdrive.com/style/csslibrary/all/">Browse All</a></li>
        </ul>

        <h3 class="headerbar"><a href="http://www.javascriptkit.com">Data Loader</a></h3>
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

<!--<div class="span8">-->

<div class="offset2">		<!------------------------------- Promotion Form ------------------------------------->
    <div class="row">
        <div class="row">

            <div class="span8" style="background-color:#F4F4F4">
            <div class="offset1">
                <br />

                <form:form class="form-horizontal">
                    <fieldset>

                        <h3>Programme Name</h3> <br />


                        <div class="control-group">
                            <label for="programname" class="control-label">Programme Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="programname" name="programname" type="text" placeholder="Enter Programme Name">
                            </div>
                        </div>
                        <br />

                        <h3>Promotion Period</h3> <br />

                        <div class="control-group">
                            <label for="startdate" class="control-label">Start Date *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="startdate" name="startdate" type="text" placeholder="Enter Start Date">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!-- #BeginDate format:Am1 -->May 28, 2012<!-- #EndDate -->
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="starttime" class="control-label">Start Time *</label>
                            <div class="controls docs-input-sizes">
                                <!--<form>-->
                                <!--<input class="modal-timepicker" type="text" />
                              <span class="help-inline">Select Time</span>-->
                                <div class="input-append time">
                                    <input size="16" placeholder="Show as dropdown" class="dropdown-timepicker"  id="starttime" name="starttime" type="text" />
                                    <span class="add-on"><!--<i class="icon-th"></i>--><img src="../resources/Images/clock.png" width="16" height="18"/></span>
                                    <!--</form> -->
                                </div>
                            </div>
                        </div>

                        <br />


                        <div class="control-group">
                            <label for="enddate" class="control-label">End Date *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="enddate" name="enddate" type="text" placeholder="Enter End Date">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="endtime" class="control-label">End Time *</label>
                            <div class="controls docs-input-sizes">
                                <!--<form>-->
                                <!--<input class="modal-timepicker" type="text" />
                              <span class="help-inline">Select Time</span>-->

                                <div class="input-append time">
                                    <input size="16" placeholder="Show as dropdown" class="dropdown-timepicker" id="endtime" name="endtime" type="text" />
                                    <span class="add-on"><!--<i class="icon-th"></i>--><img src="../resources/Images/clock.png" width="16" height="18"/></span>
                                    <!--</form> -->
                                </div>
                                <!--</form> -->

                            </div>
                        </div>

                        <br />

                        <h3>Promotion Type</h3> <br />

                        <div class="control-group">
                            <label for="type" class="control-label">Type</label>
                            <div class="controls docs-input-sizes">
                                <select id="type" name="type">
                                    <option>SMS</option>
                                    <option>Voice call</option>
                                </select>
                            </div>
                        </div>

                        <h3>Promotion Based On</h3> <br />

                        <div class="control-group">
                            <label for="promotion" class="control-label">Promotion</label>
                            <div class="controls docs-input-sizes">
                                <select id="promotion" name="promotion">
                                    <option>SMS</option>
                                    <option>LBS</option>
                                    <option>Voice call</option>
                                    <option>GPRS</option>
                                    <option>USSD</option>
                                </select>
                            </div>
                        </div>
                        <br />

                        <h3>Promotion Number</h3> <br />

                        <div class="control-group">
                            <label for="promotionnumber" class="control-label">Promotion Number *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="promotionnumber" name="promotionnumber" type="text" placeholder="Enter Promotion Number">
                            </div>
                        </div>
                        <br />

                        <h3>Cycle Time</h3> <br />

                        <div class="control-group">
                            <div class="controls">
                                <label for="executetime" class="radio">
                                    <input type="radio" name="executetime" id="executetime" value="option1" checked="">
                                    &nbsp;&nbsp;&nbsp;
                                    Execute every &nbsp;
                                    <input class="span3" type="text" placeholder="Minutes"> </label>

                                <label for="executeatend" class="radio">
                                    <input type="radio" name="executeatend" id="executeatend" value="option1" checked="">
                                    &nbsp;&nbsp;&nbsp;
                                    Execute at the end of the Promotion Period</label>

                            </div>
                        </div>
                        <br />

                        <h3>Processing Restirction</h3>  <br />

                        <div class="control-group">
                            <label for="subscribers" class="control-label">Subscribers</label>
                            <div class="controls docs-input-sizes">
                                <select id="subscribers" name="subscribers">
                                    <option>Do not repeate subscribers</option>
                                    <option>Repeate subscribers</option>
                                </select>
                            </div>
                        </div>


                        <h3>Selection Mechanism</h3> <br />
                        <br />

                        <div class="control-group">
                            <label for="randomlyselect" class="control-label">Randomly Select</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="randomlyselect" name="randomlyselect" type="text" placeholder="Enter Mechanism">

                            </div>
                        </div>
                        <br />

                        <div class="control-group">

                            <label for="numberoffirstsubscribers" class="control-label">Number of First Subscribers</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="numberoffirstsubscribers" name="numberoffirstsubscribers" type="text" placeholder="Enter Mechanism">

                            </div>
                        </div>
                        <br />


                        <div class="control-group">

                            <label for="numberofsubscribers" class="control-label">Number of Subscribers </label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="numberofsubscribers" name="numberofsubscribers" type="text" placeholder="Enter Mechanism">
                                <br />

                                <div class="controls">
                                    <label for="whomade" class="control-label"> who made</label>
                                    <div class="controls docs-input-sizes">
                                        <input class="span3" id="whomade" name="whomade" type="text" placeholder="Enter Mechanism">


                                    </div>
                                </div>
                                <br />


                            </div>
                        </div>


                        <div class="controls">
                            <div class="controls">
                                <label for="call" class="control-label">Calls</label>
                                <div class="controls docs-input-sizes">
                                    <input class="span3" id="call" name="call" type="text" placeholder="Enter Mechanism">

                                </div>
                            </div>
                        </div>
                        <br />


                        <h4>Age Restriction</h4> <br />

                        <div class="controls">
                            <h5>Notification Message</h5> <br />
                        </div>



                        <div class="control-group">

                            <label for="smsmessage" class="control-label">SMS Message</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="smsmessage" name="smsmessage" type="text" placeholder="Enter Mechanism">

                            </div>
                        </div>
                        <br />

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save changes</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn">Cancel</button>
                        </div>
                    </fieldset>
                </form:form>
            </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>

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
</body>
</html>