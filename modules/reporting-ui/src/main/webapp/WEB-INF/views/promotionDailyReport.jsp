<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<%@ page isELIgnored="false" %>

    <script type="text/javascript" src="resources/javaScript/jquery.min.js"></script>

    <script type="text/javascript" src="resources/javaScript/ddaccordion.js"></script>

    <script type = "text/javascript" >

            ddaccordion.init({
                headerclass:"headerbar", //Shared CSS class name of headers group
                contentclass:"submenu", //Shared CSS class name of contents group
                revealtype:"mouseover", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
                mouseoverdelay:200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
                collapseprev:true, //Collapse previous content (so only one open at any time)? true/false
                defaultexpanded:[0], //index of content(s) open by default [index1, index2, etc] [] denotes no content
                onemustopen:true, //Specify whether at least one header should be open always (so never all headers closed)
                animatedefault:false, //Should contents open by default be animated into view?
                persiststate:true, //persist state of opened contents within browser session?
                toggleclass:["", "selected"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
                togglehtml:["", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
                animatespeed:"normal", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
                oninit:function (headers, expandedindices) { //custom code to run when headers have initalized
                    //do nothing
                },
                onopenclose:function (header, index, state, isuseractivated) { //custom code to run whenever a header is opened or closed
                    //do nothing
                }
            })

    </script>

    <script src="resources/javaScript/bootstrap-dropdown.js"></script>
    <!------------------- DropDown Menu js ----------------------------------------->

    <script src="http://code.jquery.com/jquery-1.7.min.js"></script>
    <!------------------------ datepicker js ----------------------------->

    <script type="text/javascript" src="resources/javaScript/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="resources/javaScript/javaScriptInPromotion.js"></script>

    <script>
        $(function () {
            window.prettyPrint && prettyPrint();
            $('#dp1').datepicker({
                format:'mm-dd-yyyy'
            });
            $('#dp2').datepicker();
            $('#dp3').datepicker();


            var startDate = new Date(2012, 1, 20);
            var endDate = new Date(2012, 1, 25);
            $('#dp4').datepicker()
                    .on('changeDate', function (ev) {
                        if (ev.date.valueOf() > endDate.valueOf()) {
                            $('#alert').show().find('strong').text('The start date can not be greater then the end date');
                        } else {
                            $('#alert').hide();
                            startDate = new Date(ev.date);
                            $('#startDate').text($('#dp4').data('date'));
                        }
                        $('#dp4').datepicker('hide');
                    });
            $('#dp5').datepicker()
                    .on('changeDate', function (ev) {
                        if (ev.date.valueOf() < startDate.valueOf()) {
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

    <script type="text/javascript" src="resources/javaScript/bootstrap.js"></script>
    <!------------------------ timepicker js ------------------------>

    <script type="text/javascript" src="resources/javaScript/bootstrap-timepicker-0.3.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $('.modal-timepicker').timepicker({
                defaultTime:'current',
                minuteStep:15,
                disableFocus:true,
                template:'modal'
            });
            $('.dropdown-timepicker').timepicker({
                defaultTime:'current',
                minuteStep:15,
                disableFocus:true,
                template:'dropdown'
            });

        });
    </script>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Vigraha</title>

    <link href="resources/style/style.css" type="text/css" rel="stylesheet"/>
    <link href="resources/style/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link href="resources/style/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="resources/style/bootstrap-responsive.css" type="text/css" rel="stylesheet"/>
    <link href="resources/style/jquery.ui.datepicker.css" type="text/css" rel="stylesheet"/>
    <link href="resources/style/datepicker.less" type="text/css" rel="stylesheet"/>
    <link href="resources/style/timepicker.css" type="text/css" rel="stylesheet"/>

    <style type="text/css">
        <!--
        .style1 {
            color: #7C1099
        }

        .style2 {
            font-size: 36px
        }

        .style4 {
            font-family: Arial, Helvetica, sans-serif
        }

        -->
    </style>

<style type="text/css"> 					<!----------------------- accordian css ------------------------------->

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

    .urbangreymenu {
        width: 190px; /*width of menu*/
    }

    .urbangreymenu .headerbar {
        font: bold 13px Verdana;
        color: white;
        background: #606060 url(arrowstop.gif) no-repeat 8px 6px; /*last 2 values are the x and y coordinates of bullet image*/
        margin-bottom: 5px; /*bottom spacing between header and rest of content*/
        text-transform: uppercase;
        padding: 7px 0 7px 31px; /*31px is left indentation of header text*/
    }

    .urbangreymenu .headerbar a {
        text-decoration: none;
        color: white;
        display: block;
    }

    .urbangreymenu ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        margin-bottom: 0; /*bottom spacing between each UL and rest of content*/
    }

    .urbangreymenu ul li {
        padding-bottom: 2px; /*bottom spacing between menu items*/
    }

    .urbangreymenu ul li a {
        font: normal 12px Arial;
        color: black;
        background: #E9E9E9;
        display: block;
        padding: 5px 0;
        line-height: 17px;
        padding-left: 8px; /*link text is indented 8px*/
        text-decoration: none;
    }

    .urbangreymenu ul li a:visited {
        color: black;
    }

    .urbangreymenu ul li a:hover {
        /*hover state CSS*/
        color: white;
        background: black;
    }

    </style>


</head>


<body>

<div class="navbar">
    <!------------------------------ -Navigation Bar ------------------------------------->

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

<div id="header-bar">                    <!------------------------- Header Bar ---------------------------------->
    <img src="resources/images/28.png"/>
</div>

<br/>
<br/>
<br/>


<div class="container">            <!------------------------- Container ---------------------------->

    <div class="content">

        <br/>

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="span3">
                    <!------------------------------- accordian menu ----------------------------->

                    <div class="urbangreymenu">

                        <h3 class="headerbar"><a href="#">Administrator</a></h3>
                        <ul class="submenu">
                            <li><a href="#">Edit Programme</a></li>
                            <li><a href="#">Search Programme</a></li>
                            <li><a href="#">Create New Administrator</a></li>
                            <li><a href="#">Change password</a></li>
                            <li><a href="#">Modify/Delete admin account</a></li>
                            <li><a href="#">Logout</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="#">Promotion Program</a></h3>
                        <ul class="submenu">
                            <!--<li><a href="#">Promotion Programe report - Yearly</a></li>-->
                            <li><a href="Promotion_report_monthly.html">Promotion Programe report - Monthly</a></li>
                            <li><a href="#">Promotion Programe report - Daily</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="#">Loyality Program</a></h3>
                        <ul class="submenu">
                            <li><a href="#">Loyality Program report - Yearly</a></li>
                            <li><a href="#">Loyality Program report - Monthly</a></li>
                            <li><a href="#">Loyality Program report - Daily</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="#">Tenure Program Reports</a></h3>
                        <ul class="submenu">
                            <li><a href="#">Tenure Program report - Yearly</a></li>
                            <li><a href="#">Tenure Program report - Monthly</a></li>
                            <li><a href="#">Tenure Program report - Daily</a></li>
                        </ul>

                        <h3 class="headerbar"><a href="#">Subscriber Details User Management</a></h3>
                        <ul class="submenu">
                            <li><a href="#">Tenure Program report - Yearly</a></li>
                            <li><a href="#">Tenure Program report - Monthly</a></li>
                            <li><a href="#">Tenure Program report - Daily</a></li>
                        </ul>


                    </div>

                </div>


                <div class="offset2">
                    <div class="row">
                        <div class="row">

                            <div class="span8">

                                <h3>Promotion Programme Report - Daily</h3>

                                <hr/>

                            </div>

                            <div class="span8" style="background-color:#F4F4F4">
                                <div class="offset1">
                                    <br/>

                                    <form class="form-horizontal" method="get" action="<%= request.getContextPath( ) + "/frameset" %>" target="_blank"
                                            onsubmit="return promotionDailySelection(this);">
                                        <fieldset>

                                            <br/>
                                            <input type='hidden' name='__report' value="report/sample.rptdesign">
                                            <input type='hidden' name='promotion_id' value="">


                                            <div class="control-group">
                                                <label class="control-label">Promotion Name *</label>

                                                <div class="controls docs-input-sizes">
                                                    <select name="promotion_id_selector">
                                                        <c:forEach items="${PromotionTypes}" var="promotion">
                                                            <option value="<c:out value="${promotion.promotionId}"/>"
                                                                    selected="selected">${promotion.promotionName}(${promotion.companyCode})
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <br/>

                                            <div class="control-group">
                                                <label class="control-label">Programme Start Date *</label>

                                                <div class="controls docs-input-sizes">
                                                    <div class="input-append date" id="dp1" data-date="12-02-2012"
                                                         data-date-format="dd-mm-yyyy">
                                                        <input class="span2" size="16" type="text" value="12-02-2012" name="start_date"
                                                               readonly="">
                                                        <span class="add-on"><i class="icon-th"></i></span>

                                                    </div>
                                                </div>
                                            </div>

                                            <br/>

                                            <div class="control-group">
                                                <label class="control-label">Programme End Date *</label>

                                                <div class="controls docs-input-sizes">
                                                    <div class="input-append date" id="dp2" data-date="12-02-2012"
                                                         data-date-format="dd-mm-yyyy">
                                                        <input class="span2" size="16" type="text" value="12-02-2012"
                                                               readonly="" name="end_date">
                                                        <span class="add-on"><i class="icon-th"></i></span>

                                                    </div>
                                                </div>
                                            </div>

                                            <br/>

                                            <div class="control-group">
                                                <label class="control-label">Programme Status</label>

                                                <div class="controls docs-input-sizes">
                                                    <select id="select01">
                                                        <option>Executed</option>
                                                        <option>Fail</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <br/>

                                            <div class="control-group">
                                                <div class="controls">
                                                    <label class="checkbox">Show report chart<input type="checkbox"
                                                                                                    id="optionsCheckbox"
                                                                                                    value="option1">
                                                    </label>


                                                </div>
                                            </div>
                                            <br/>

                                            <div class="form-actions">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button class="btn">Cancel</button>
                                            </div>


                                        </fieldset>
                                    </form>
                                    <!------------------------ registration form end ------------------------------------------->

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

</div>

<hr/>
<!------------------------ footer ------------------------------------------->

<footer class="container">


    <p class="pull-right"><a href="#">Back to top</a></p>

    <p>&copy; 2012 by <a href="#">Vigraha</a>
        • Powered by <a href="#">SLIIT</a>
        • <a href="#">Alright reserved</a> by <a href="#">Vigraha</a>

    <p></p>

</footer>


</body>
</html>