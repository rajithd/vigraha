<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<!--<script type="text/javascript"; src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js";></script>-->
<!----- accordion js -------->

<script type="text/javascript" src="resources/java_scripts/jquery.min.js"></script>

<script type="text/javascript" src="resources/java_scripts/ddaccordion.js"></script>

<script type="text/javascript">

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

<script src="resources/java_scripts/bootstrap-dropdown.js"></script>
<!------------------- DropDown Menu js ----------------------------------------->

<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
<!------------------------ datepicker js ----------------------------->

<script type="text/javascript" src="resources/java_scripts/bootstrap-datepicker.js"></script>

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

<script type="text/javascript" src="resources/java_scripts/bootstrap.js"></script>
<!------------------------ timepicker js ------------------------>

<script type="text/javascript" src="resources/java_scripts/bootstrap-timepicker-0.3.js"></script>

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
<title>
    <fmt:message key="promotion.title"/>
</title>

<link href="resources/Style/style.css" type="text/css" rel="stylesheet"/>
<link href="resources/Style/bootstrap.css" type="text/css" rel="stylesheet"/>
<link href="resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet"/>
<link href="resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet"/>
<link href="resources/Style/jquery.ui.datepicker.css" type="text/css" rel="stylesheet"/>
<link href="resources/Style/datepicker.less" type="text/css" rel="stylesheet"/>
<link href="resources/Style/timepicker.css" type="text/css" rel="stylesheet"/>

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

<style type="text/css">                        <!--
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
timepicker css

-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-->
body {
    padding-bottom: 40px;
    position: relative;
    padding-top: 50px;
}
</style>

<style type="text/css">                     <!--
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
accordian css

-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-->

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
<jsp:include page="header.jsp"/>

<div class="container">            <!------------------------- Container ---------------------------->

<div class="content">

<br/>

<div class="container-fluid">

<div class="row-fluid">

<div class="span3">            <!------------------------------- accordian menu ----------------------------->

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

<!--<div class="span8">-->


<div class="offset2">        <!------------------------------- Promotion Form ------------------------------------->
<div class="row">
<div class="row">

<div class="span8">

    <h2>Promotion Form</h2> <!------------------------------- Main Title ------------------------------------->

    <hr/>

</div>

<div class="span8" style="background-color:#F4F4F4">
<div class="offset1">
<br/>

<form:form method="post" modelAttribute="promotion">
<fieldset>

<h3>Company Informations</h3> <br/>

<div class="control-group">
    <label for="companycode" class="control-label">Company Code *</label>

    <div class="controls docs-input-sizes">
        <form:select id="companycode" path="companyCode" items="${companyTypes}" itemValue="companyCode"
                     itemLabel="displayName">
        </form:select>
    </div>
</div>

<h3>Promotion Information</h3> <br/>


<div class="control-group">
    <label for="promotionname" class="control-label">Promotion Name *</label>

    <div class="controls docs-input-sizes">
        <form:input path="promotionName" class="span3" id="promotionname" type="text"
                    placeholder="Enter Programme Name"/>
    </div>
</div>

<br/>

<h3>Promotion Period</h3> <br/>

<div class="control-group">
    <label for="startdate" class="control-label">Start Date *</label>

    <div class="controls docs-input-sizes">

        <div class="input-append date" id="dp1" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
            <form:input path="startDate" class="dropdown-datepicker" id="startdate" name="startdate" size="16"
                        type="text" value="12-02-2012"
                        readonly=""/>
            <span class="add-on"><i class="icon-th"></i><!--<img src="Images/calendar.png" width="16"; height="18";/>--></span>

        </div>

    </div>
</div>

<div class="control-group">
    <label for="starttime" class="control-label">Start Time *</label>

    <div class="controls docs-input-sizes">
            <%--<span class="help-inline">Select Time</span>-->--%>
        <div class="input-append time" id="dp1">
            <form:input path="startTime" size="16" id="starttime" name="starttime"
                        type="text"/>
            <span class="add-on"><!--<i class="icon-th"></i>--><img src="resources/Images/clock.png" width="16"
                                                                    height="18"/></span>
        </div>
    </div>
</div>

<br/>


<div class="control-group">
    <label for="enddate" class="control-label">End Date *</label>

    <div class="controls docs-input-sizes">

        <div class="input-append date" id="dp2" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
            <form:input path="endDate" class="dropdown-datepicker" id="enddate" name="enddate" size="16" type="text"
                        value="12-02-2012"
                        readonly=""/>
            <span class="add-on"><i class="icon-th"></i><!--<img src="Images/calendar.png" width="16"; height="18";/>--></span>
        </div>


    </div>
</div>

<div class="control-group">
    <label for="endtime" class="control-label">End Time *</label>

    <div class="controls docs-input-sizes">
            <%--<span class="help-inline">Select Time</span>-->--%>

        <div class="input-append time" id="dp1">
            <form:input path="endTime" size="16" id="endtime" name="endtime"
                        type="text"/>
            <span class="add-on"><!--<i class="icon-th"></i>--><img src="resources/Images/clock.png" width="16"
                                                                    height="18"/></span>
        </div>

    </div>
</div>

<br/>

<h3>Promotion Based On</h3> <br/>

<div class="control-group">
    <div class="controls">

        <label for="sms" class="checkbox">SMS *
            <form:checkbox id="sms" path="basedOn[sms]" value="sms"/>
        </label>
        <label for="lbs" class="checkbox">LBS *
            <form:checkbox id="lbs" path="basedOn[lbs]" value="lbs"/>
        </label>
        <label for="voicecall" class="checkbox">Voice Call *
            <form:checkbox id="voicecall" path="basedOn[voicecall]" value="voicecall"/>
        </label>
        <label for="gprs" class="checkbox">GPRS *
            <form:checkbox id="gprs" path="basedOn[gprs]" value="gprs"/>
        </label>
        <label for="ussd" class="checkbox">USSD *
            <form:checkbox id="ussd" path="basedOn[ussd]" value="ussd"/>
        </label>

    </div>
</div>
<br/>

<h3>Promotion Number</h3> <br/>

<div class="control-group">
    <label for="promotionnumber" class="control-label">Promotion Number *</label>

    <div class="controls docs-input-sizes">
        <form:input path="promotionNumber" class="span3" id="promotionnumber" name="promotionnumber" type="text"
                    placeholder="Enter Promotion Number"/>
    </div>
</div>
<br/>

<h3>Cycle Time</h3> <br/>

<div class="control-group">
    <div class="controls">

        <label for="executeevery" class="radio">
            <form:radiobutton id="executeevery" path="cycleTime" value="executeEvery"/>
            &nbsp;&nbsp;&nbsp;
            Execute every &nbsp;
            <form:input path="hours" class="span2" type="text" placeholder="Hours"/> </label> <br/>


        <label for="specifictime" class="radio">
            <form:radiobutton id="specifictime" path="cycleTime" value="specificTime"/>
            &nbsp;&nbsp;&nbsp;
            Execute at Specific Time&nbsp;&nbsp;
            <form:input size="16" type="text" path="specificTime"/>

        </label> <br/>

        <label for="promotionend" class="radio">
            <form:radiobutton id="promotionend" path="cycleTime" value="promotionEnd"/>
            &nbsp;&nbsp;&nbsp;
            Execute at the end of the Promotion Period</label>

    </div>
</div>

<br/>

<h3>Processing Restirction</h3>  <br/>


<div class="control-group">
    <div class="controls">

        <label for="donotrepeate" class="radio">
            <form:radiobutton id="donotrepeate" path="processingRestriction" value="doNotRepeat"/>
            &nbsp;&nbsp;&nbsp;
            Do not Repeat Subscribers</label>

        <label for="repeate" class="radio">
            <form:radiobutton id="repeate" path="processingRestriction" value="repeat"/>
            &nbsp;&nbsp;&nbsp;
            Repeat Subcriberss</label>

    </div>
</div>

<br/>


<h3>Selection Mechanism</h3> <br/>


<div class="control-group">
    <div class="controls">

        <label for="random" class="radio">
            <form:radiobutton id="random" path="selectMechanism" value="random"/>
            &nbsp;&nbsp;&nbsp;
            Randomly Select</label>
        <form:input path="randomCount" class="span2" type="text" placeholder="Value"/> </label> <br/>

        <label for="firstsub" class="radio">
            <form:radiobutton id="firstsub" path="selectMechanism" value="firstSubscribers"/>
            &nbsp;&nbsp;&nbsp;
            Number of First Subscribers</label>
        <form:input path="randomCount1" class="span2" type="text" placeholder="Value"/> </label> <br/>

        <label for="all" class="radio">
            <form:radiobutton id="all" path="selectMechanism" value="all"/>
            &nbsp;&nbsp;&nbsp;
            All Subscribers</label>

    </div>
</div>

<br/>

<h3>Restriction</h3> <br/>

<form>

    <label class="control-label"><h5>Age Restriction</h5></label>

    <div class="control-group">
        <div class="controls docs-input-sizes">
            <form:input path="age1" class="span1" type="text" placeholder="Enter Age"/>
            &nbsp; To&nbsp;
            <form:input path="age2" class="span1" type="text" placeholder="Enter Age"/>
        </div>
    </div>
</form>
<br/>

<h3>Notification Message</h3> <br/>

<div class="control-group">
    <label class="control-label" for="smsmessage">SMS Message</label>

    <div class="controls">
        <form:textarea path="smsMessage" class="input-xlarge" id="smsmessage" name="smsmessage" rows="4"/>
    </div>
</div>
<br/>

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