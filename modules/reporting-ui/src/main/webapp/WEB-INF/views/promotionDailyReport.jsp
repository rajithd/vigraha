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

                            <h3 style="color:#858585" align="center">Promotion Programme Report</h3>
                            <hr />

                        </div>

                        <div class="span8" style="background-color:#FFF">
                            <!--<div class="offset1">-->
                            <!--<br />-->

                            <form class="form-horizontal" method="get" action="<%= request.getContextPath( ) + "/frameset" %>" target="_blank"
                                  onsubmit="return promotionDailySelection(this);">
                                <fieldset>

                                    <br/>
                                    <input type='hidden' name='__report' value="report/promotion_daily_summery_report.rptdesign">
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

                                            <input type="text" name="startDate" id="datepicker1" onchange="datePickAlertNeutralize()">


                                        </div>
                                    </div>

                                    <br/>

                                    <div class="control-group">
                                        <label class="control-label">Programme End Date *</label>

                                        <div class="controls docs-input-sizes">
                                                <input type="text" name="endDate" id="datepicker2" onchange="datePickAlertNeutralize()">
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