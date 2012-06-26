<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <!--<script type="text/javascript"; src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>-->  <!----- accordion js -------->

    <script type="text/javascript" src="../resources/java_scripts/jquery.min.js"></script>

    <script type="text/javascript" src="../resources/java_scripts/ddaccordion.js"></script>

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

    <script src="../resources/java_scripts/jquery-1.7.min.js"></script>	<!------------------------ datepicker js ----------------------------->

    <script type="text/javascript" src="../resources/java_scripts/bootstrap-datepicker.js"></script>

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


    <script type="text/javascript" src="../resources/java_scripts/bootstrap-typeahead.js"></script>	<!---------------- Auto complete text js --------------->

<script src="../resources/java_scripts/bootstrap-dropdown.js"></script>		<!------------------- DropDown Menu js ----------------------------------------->

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        margin-bottom: 5px; /*bottom spacing between header and rest of content*/
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
<jsp:include page="header.jsp"/>


<div class="container">			<!------------------------- Container ---------------------------->

    <div class="content">

        <br />

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="span3">				<!------------------------------- accordian menu ----------------------------->

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

                </div>



                <div class="offset2">
                    <div class="row">
                        <div class="row">

                            <div class="span8">

                                <h2>Administrator Registration Form</h2>

                                <hr />

                            </div>

                            <div class="span8" style="background-color:#F4F4F4">
                            <div class="offset1">
                                <br />

                                <form:form class="form-horizontal">			<!------------------------ registration form ------------------------------------------->
                    <fieldset>

                        <h3>Personal Information</h3>

                        <div class="control-group">
                            <label for="fullname" class="control-label">Full Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="fullname" name="fullname" type="text" placeholder="Enter First Name">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="mobileno" class="control-label">Mobile Number *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="mobileno" name="mobileno" type="text" placeholder="Enter Last Name">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label for="id" class="control-label">ID *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" id="id" name="id" type="text" placeholder="Enter Mobile No">
                            </div>
                        </div>
                        <br />


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

<jsp:include page="footer.jsp"/>
</body>
</html>