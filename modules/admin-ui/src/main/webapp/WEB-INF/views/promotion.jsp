<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="resources/java_scripts/jquery-1.7.min.js"></script>
    <script src="resources/java_scripts/bootstrap-dropdown.js"></script>
    <script src="resources/java_scripts/bootstrap-datepicker.js"></script>
    <script src="resources/java_scripts/bootstrap_datepicker_format.js"></script>
    <script type="text/javascript" src="resources/java_scripts/bootstrap-timepicker-0.3.js"></script>
    <script src="resources/java_scripts/bootstrap-timepicker-format.js"></script>
    <script src="resources/java_scripts/bootstrap-popover.js"></script>
    <script type="text/javascript" src="resources/java_scripts/jquery.min.js"></script>
    <script type="text/javascript" src="resources/java_scripts/jquery.ui.core.js"></script>
    <script type="text/javascript" src="resources/java_scripts/jquery.ui.datepicker.js"></script>
    <script type="text/javascript" src="resources/java_scripts/customjs.js"></script>

    <link href="resources/Style/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
    <link href="resources/Style/global.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="resources/Style/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link href="resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet"/>
    <link href="resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="resources/Style/bootstrap-responsive.min.css" type="text/css" rel="stylesheet"/>
    <link href="resources/Style/datepicker.css" type="text/css" rel="stylesheet"/>
    <link href="resources/Style/datepicker.less" type="text/css" rel="stylesheet"/>
    <link href="resources/Style/timepicker.css" type="text/css" rel="stylesheet"/>

    <title>Promotion</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset="50">

<jsp:include page="common/header.jsp"/>
<div id="container">

<div id="subContainer">
<jsp:include page="common/header-bar.jsp"/>
<br/>

<ul class="breadcrumb">
    <li>
        <a href="Welcome_Page.html">Home</a> <span class="divider">/</span>
    </li>
    <li class="active">Promotion Programme</li>
    <span class="divider">/</span>
    <li class="active">Promotion Form</li>
</ul>

<div class="row">
<div class="span22 offset1">

<!--<div class="offset1">-->
<div class="row">
<div class="row">

<div class="span8">

    <h3 style="color:#858585" align="center">Promotion Form</h3>
    <hr/>

</div>

<div class="span8" style="background-color:#FFF">

<form class="form-horizontal" method="post">
<fieldset>

<div class="row-fluid">
<div class="span12">

<div class="row-fluid">
    <div class="span6">

        <span style="margin-left:20px; color:#a9a9a9; font-size:18px">Company Information</span>

    </div>

    <div class="span6" align="right">
        <span style="color: #a9a9a9; margin-left:20px; font-size:10px;">Note:</span>
        <span style="color: red; font-size:12px;"> * </span>
        <span style="color: #a9a9a9; font-size:10px;">Indicates a required field</span>

        <br/>

    </div>
</div>

<hr/>

<br/>

<div class="row-fluid">
    <div class="span6">


        <div class="control-group">
            <label class="control-label">Company Code <span style="color: red;"> * </span> :</label>

            <div class="controls docs-input-sizes">
                <select name="companyCode">
                    <c:forEach items="${companyTypes}" var="company">
                        <option value="<c:out value="${company.regNo}"/>"
                                selected="selected">${company.companyName}(${company.regNo})
                        </option>
                    </c:forEach>

                </select>
            </div>
        </div>

    </div>
</div>


<hr/>
<span style="margin-left:20px; color:#a9a9a9; font-size:18px">Promotion Information</span>
<hr/>

<br/>

<div class="row-fluid">
    <div class="span6">

        <div class="control-group">
            <label class="control-label">Promotion Name <span style="color: red;"> * </span> :</label>

            <div class="controls docs-input-sizes">
                <input class="large" size="25" type="text" placeholder="Enter Programme Name" name="promotionName">
            </div>
        </div>

    </div>
</div>

<hr/>
<span style="margin-left:20px; color:#a9a9a9; font-size:18px">Promotion Period</span>
<hr/>

<br/>

<div class="row-fluid">
    <div class="span6">

        <div class="control-group">
            <label class="control-label">Start Date <span style="color: red;"> * </span> :</label>

            <div class="controls docs-input-sizes">

                    <input type="text" name="startDate" id="datepicker1" onchange="datePickAlertNeutralize()">
                    <span class="add-on"><i class="icon-calendar"></i></span>


            </div>
        </div>

    </div>

    <div class="span6">

        <div class="control-group">
            <label class="control-label">Start Time <span style="color: red;"> * </span> :</label>

            <div class="controls docs-input-sizes">

                    <input class="dropdown-timepicker" size="16" style="width:100px" placeholder="HH:MM"
                           type="text" name="startTime"/>
            </div>
        </div>

    </div>
</div>

<div class="row-fluid">
    <div class="span6">

        <div class="control-group">
            <label class="control-label">End Date <span style="color: red;"> * </span> :</label>

            <div class="controls docs-input-sizes">
                <input type="text" name="endDate" id="datepicker2" onchange="datePickAlertNeutralize()">
            </div>
        </div>

    </div>

    <div class="span6">

        <div class="control-group">
            <label class="control-label">End Time <span style="color: red;"> * </span> :</label>

            <div class="controls docs-input-sizes">
                    <input size="16" placeholder="HH:MM" style="width:100px" class="dropdown-timepicker"
                           type="text" name="endTime"/>
            </div>
        </div>

    </div>
</div>

<hr/>

<div class="row-fluid">
    <div class="span6">

        <span style="margin-left:20px; color:#a9a9a9; font-size:18px">Promotion Based On</span>

        <span style="float:right; color:#a9a9a9">|</span>

    </div>


    <div class="span6">

        <span style="margin-right:20px; color:#a9a9a9; font-size:18px">Promotion Number</span>

    </div>
</div>

<hr/>

<div class="row-fluid">
    <div class="span6">

        <div class="control-group">
            <div class="controls">

                <label class="checkbox">SMS <span style="color: red;"> * </span><input type="checkbox"
                                                                                       value="sms" name="basedOn[sms]"> </label>

                <label class="checkbox">LBS <span style="color: red;"> * </span><input type="checkbox"
                                                                                       value="lbs" name="basedOn[lbs]"> </label>

                <label class="checkbox">Voice Call <span style="color: red;"> * </span><input type="checkbox"
                                                                                              value="voicecall" name="basedOn[voicecall]">
                </label>

                <label class="checkbox">GPRS <span style="color: red;"> * </span><input type="checkbox"
                                                                                        value="gprs" name="basedOn[gprs]"> </label>

                <label class="checkbox">USSD <span style="color: red;"> * </span><input type="checkbox"
                                                                                        value="ussd" name="basedOn[ussd]"> </label>

            </div>
        </div>

    </div>

    <div class="span6">

        <div class="control-group">
            <label class="control-label">Promotion Number <span style="color: red;"> * </span> :</label>

            <div class="controls docs-input-sizes">
                <input class="large" size="25" type="text" placeholder="Enter Promotion Number" name="promotionNumber">
            </div>
        </div>

    </div>
</div>

<hr/>

<div class="row-fluid">
    <div class="span6">

        <span style="margin-left:20px; color:#a9a9a9; font-size:18px">Cycle Time</span>

        <span style="float:right; color:#a9a9a9">|</span>

    </div>


    <div class="span6">

        <span style="margin-right:20px; color:#a9a9a9; font-size:18px">Processing Restriction</span>

    </div>
</div>

<hr/>

<div class="row-fluid">
    <div class="span6">

            <div class="control-group">
                <div class="controls">

                    <label class="radio">
                        <input type="radio" name="cycleType" value="option1" checked="">
                        &nbsp;&nbsp;&nbsp;
                        Execute every &nbsp;
                        <input size="10" style="width:50px" type="text" class="span2" placeholder="Hours" name="cycleTime"> </label>
                    <br/>

                    <label class="radio">
                        <input type="radio" name="cycleType" value="option1" checked="">
                        &nbsp;&nbsp;&nbsp;
                        Execute at Specific Time&nbsp;&nbsp;
                        <input size="16" placeholder="Show as dropdown"
                               style="width:100px; margin-top:10px; margin-left:15px"
                               class="dropdown-timepicker" type="text" name="cycleTime"/>

                    </label> <br/>

                    <label class="radio">
                        <input type="radio" name="cycleType" value="option1" checked="">
                        &nbsp;&nbsp;&nbsp;
                        Execute at the end of the </label><label style="margin-left:34px">Promotion Period</label>

                </div>
            </div>
    </div>

    <div class="span6">
            <div class="control-group">
                <div class="controls">

                    <label class="radio">
                        <input type="radio" name="processingRestriction" value="doNotRepeat" >
                        &nbsp;&nbsp;&nbsp;
                        Do not Repeat Subscribers</label> <br/>

                    <label class="radio" style="margin-top:10px">
                        <input type="radio" name="processingRestriction" value="repeat">
                        &nbsp;&nbsp;&nbsp;
                        Repeat Subscribers</label>

                </div>
            </div>
    </div>
</div>

<hr/>

<div class="row-fluid">
    <div class="span6">

        <span style="margin-left:20px; color:#a9a9a9; font-size:18px">Selection Mechanism</span>

    </div>
</div>
<hr/>

<div class="row-fluid">
    <div class="span6">

            <div class="control-group">
                <div class="controls">

                    <label class="radio">
                        <input type="radio" name="selectMechanism" value="random" checked="">
                        &nbsp;&nbsp;&nbsp;
                        Randomly Select</label>

                    <label class="radio">
                        <input type="radio" name="selectMechanism" value="firstSubscribers" checked="">
                        &nbsp;&nbsp;&nbsp;
                        Number of First Subscribers</label>

                    <label class="radio">
                        <input type="radio" name="selectMechanism" value="all" checked="">
                        &nbsp;&nbsp;&nbsp;
                        All Subscribers</label>

                </div>
            </div>

    </div>


</div>

<hr/>

<div class="row-fluid">
    <div class="span6">

        <span style="margin-left:20px; color:#a9a9a9; font-size:18px">Notification Message</span>

    </div>
</div>

<hr/>

<div class="row-fluid">
    <div class="span6">

        <div class="control-group">
            <label class="control-label" for="textarea">SMS Message</label>

            <div class="controls">
                <textarea class="input-xlarge" id="textarea" rows="4" name="smsMessage"></textarea>
            </div>
        </div>

    </div>
</div>

</div>
</div>

<div class="well">

    <button type="submit" class="btn btn-primary" rel="popover" title="Save Administrator">Submit</button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button class="btn" rel="popover" title="Cancel Registration">Cancel</button>

</div>

</fieldset>
</form>

</div>
</div>
</div>
</div>
</div>
</div>

</div>

</div>
<br/>
<br/>
<jsp:include page="common/footer.jsp"/>

</body>

</html>
