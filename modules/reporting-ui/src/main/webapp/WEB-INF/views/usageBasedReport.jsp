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

    <title>Usage Based Report</title>
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
                    <li class="active">Usage Based Reports</li><span class="divider">/</span>
                    <li class="active">Usage Based Report Form</li>
                </ul>
            <div class="row">
                <div class="span22 offset1">

                    <!--<div class="offset1">-->
                    <div class="row">
                        <div class="row">

                            <div class="span8">

                                <h3 style="color:#858585" align="center">Usage Based Report Form</h3>
                                <hr />

                            </div>

                            <div class="span8" style="background-color:#FFF">
                            <!--<div class="offset1">-->
                            <!--<br />-->

                            <form class="form-horizontal" method="get" action="<%= request.getContextPath( ) + "/frameset" %>" target="_blank">
                                <fieldset>
                                    <input type='hidden' name='__report' value="report/yearly_based_usage_report.rptdesign">
                                    <div class="row-fluid">
                                        <div class="span12">


                                            <div class="row-fluid">
                                                <div class="span6">


                                                    <div class="control-group">
                                                        <label class="control-label">Year <span style="color: red;"> * </span> :</label>
                                                        <div class="controls docs-input-sizes">
                                                            <select id="select01">
                                                                <option>2012</option>
                                                                <option>2011</option>
                                                                <option>2010</option>
                                                                <option>2009</option>
                                                                <option>2008</option>
                                                                <option>2007</option>
                                                                <option>2006</option>
                                                                <option>2005</option>
                                                                <option>2004</option>
                                                                <option>2003</option>
                                                                <option>2002</option>
                                                                <option>2001</option>
                                                                <option>2000</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>



                                            <div class="row-fluid">
                                                <div class="span6">
                                                    <div class="well">

                                                        <div class="control-group">
                                                            <label class="control-label">Channels <span style="color: red;"> * </span> :</label>
                                                            <div class="controls">

                                                                <label class="checkbox">SMS <span style="color: red;"> * </span><input type="checkbox" id="optionsCheckbox" value="option1"> </label>

                                                                <label class="checkbox">LBS <span style="color: red;"> * </span><input type="checkbox" id="optionsCheckbox" value="option1"> </label>

                                                                <label class="checkbox">Voice Call <span style="color: red;"> * </span><input type="checkbox" id="optionsCheckbox" value="option1">
                                                                </label>

                                                                <label class="checkbox">GPRS <span style="color: red;"> * </span><input type="checkbox" id="optionsCheckbox" value="option1"> </label>

                                                                <label class="checkbox">USSD <span style="color: red;"> * </span><input type="checkbox" id="optionsCheckbox" value="option1"> </label>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>



                                            <div class="row-fluid">
                                                <div class="span6">

                                                    <div class="control-group">
                                                        <label class="control-label">Show Report <span style="color: red;"> * </span> :</label>
                                                        <div class="controls">

                                                            <label class="checkbox"><input type="checkbox" id="optionsCheckbox" value="option1"> </label>



                                                        </div>
                                                    </div>

                                                </div>
                                            </div>



                                            <div class="well">

                                                <!--<div class="form-actions">-->
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button class="btn" rel="popover" title="Cancel">Cancel</button>
                                                <!--</div>-->

                                            </div>

                                </fieldset>
                            </form>	<!------------------------ registration form end ------------------------------------------->

                        </div>
                    </div>
                </div>
            </div>
            <!--</div>-->

        </div>		<!-- span 22 -->
    </div>		<!-- row -->


    </div>		<!-- subcontainer end -->

</body>
</html>