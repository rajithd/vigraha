<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>  <!----- accordion js -------->

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


<script type="text/javascript" src="java scripts/bootstrap-typeahead.js"></script>	<!---------------- Auto complete text js --------------->

<script src="java scripts/bootstrap-dropdown.js"></script>		<!------------------- DropDown Menu js ----------------------------------------->

    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>
       <fmt:message key="registration.title"/>
    </title>

    <link href="../resources/Style/style.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/jquery.datepick.css" type="text/css" rel="stylesheet" />
    <link href="../resources/Style/datepicker.less" type="text/css" rel="stylesheet" />

    <style type="text/css">
        <!--
        .style1 {color: #7C1099}
        .style2 {font-size: 36px}
        .style4 {font-family: Arial, Helvetica, sans-serif}
        -->
    </style>

    <style type="text/css"> <!----------------------- accordian css ------------------------------->

    .urbangreymenu{
        width: 190px; /*width of menu*/
    }

    .urbangreymenu .headerbar{
        font: bold 13px Verdana;
        color: white;
        background: #606060 url(arrowstop.gif) no-repeat 8px 6px; /*last 2 values are the x and y coordinates of bullet image*/
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
<div class="navbar">
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

<div id="header-bar">					<!------------------------- Header Bar ---------------------------------->
    <img src="../resources/Images/28.png" />
</div>

<br />
<br />
<br />


<div class="container">			<!------------------------- Container ---------------------------->

<div class="content">

<br />

<div class="container-fluid">
<div class="row-fluid">

<div class="span3">				<!------------------------------- accordian menu ----------------------------->

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



<div class="offset2">
    <div class="row">
        <div class="row">

            <div class="span8" style="background-color:#F4F4F4">
            <div class="offset1">
                <br />

                <form:form class="form-horizontal">			<!------------------------ registration form ------------------------------------------->
                    <fieldset>

                        <h3>Personal Information</h3>

                        <div class="control-group">
                            <label for="firstname" class="control-label">First Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="firstname" name="firstname" type="text" placeholder="Enter First Name">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="lastname" class="control-label">Last Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="lastname" name="lastname" type="text" placeholder="Enter Last Name">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="mobilenumber" class="control-label">Moblie Number *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="mobilenumber" name="mobilenumber" type="text" placeholder="Enter Mobile No">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="yearofbirth" class="control-label">Year of Birth *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="yearofbirth" name="yearofbirth" type="text" placeholder=".Enter Year of Birth">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="profession" class="control-label">Profession</label>
                            <div class="controls docs-input-sizes">
                                <select id="profession" name="profession">
                                    <option>something</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>

                        <h3>Sign In Information</h3>

                        <div class="control-group">
                            <label for="username" class="control-label">User Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="username" name="username" type="text" placeholder="Enter User Name">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="password" class="control-label">Password *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="password" name="password" type="text" placeholder="Enter Password">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label class="control-label">Confirm Password *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Confirm Password">
                            </div>
                        </div>

                        <h3>Security Information</h3>

                        <div class="control-group">
                            <label for="securityquestion" class="control-label">Security question *</label>

                            <div class="controls docs-input-sizes">

                                <select id="securityquestion" name="securityquestion">

                                    <option>Mother's Maiden name</option>
                                    <option>First Maths teacher</option>
                                    <option>Childhood best friend</option>
                                </select>
                                <br />
                                <br />

                                <label class="control-label"></label>
                                <input class="span3" type="text" placeholder="Enter Security question" />
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="nic" class="control-label">National Identity Card Number *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="nic" name="nic" type="text" placeholder="Enter National Identity Card Number">
                            </div>
                        </div>

                        <h3>Location Information</h3>

                        <div class="control-group">
                            <label class="control-label" for="address">Address</label>
                            <div class="controls">
                                <textarea class="input-xlarge" id="address" name="address" rows="4"></textarea>
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="country" class="control-label">Country</label>
                            <div class="controls docs-input-sizes">
                                <select id="country" name="country">
                                    <option>something</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="province" class="control-label">Province</label>
                            <div class="controls docs-input-sizes">
                                <select id="province" name="province">
                                    <option>something</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="city" class="control-label">City / State</label>
                            <div class="controls docs-input-sizes">
                                <select id="city" name="city">
                                    <option>something</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                        </div>

                        <br />
                        <div class="control-group">
                            <div class="controls">
                                <label class="checkbox">
                                    <input type="checkbox" id="optionsCheckbox" value="option1">
                                    I Agree with Terms and Conditions
                                </label>
                            </div>
                        </div>
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