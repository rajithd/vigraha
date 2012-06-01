<%--
  Created by IntelliJ IDEA.
  User: Thejani
  Date: 5/31/12
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
       <fmt:message key="promotion.title"/>
    </title>

    <link href="../resources/Style/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../resources/Style/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="../resources/Style/style.css" rel="stylesheet" type="text/css" />
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
                <li><a href="Registration form.html">Register</a></li>
                <li><a href="Login Page.html">Sign In</a></li>
            </ul>
            <form class="navbar-search pull-right">
                <input type="text" class="search-query" placeholder="Search">
            </form>

            <ul class="nav">
                <li class="dropdown">
                    <a href="#"	class="dropdown-toggle"	 data-toggle="dropdown">Login<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div id="header-bar">				<!-- Header Bar -->
    <img src="../resources/Images/header_bar.png" />
</div>

<br />
<br />
<br />
<br />


<div class="offset2">		<!-- Registration Form -->
    <div class="row">
        <div class="row">
            <div class="span6">
                <br />
                <form class="form-horizontal">
                    <fieldset>

                        <h3>Programme Name</h3> <br />


                        <div class="control-group">
                            <label class="control-label">Programme Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Programme Name">
                            </div>
                        </div>
                        <br />

                        <h3>Promotion Period</h3> <br />

                        <div class="control-group">
                            <label class="control-label">Start Date *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Start Date">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!-- #BeginDate format:Am1 -->May 28, 2012<!-- #EndDate -->
                            </div>
                        </div>
                        <br />


                        <div class="control-group">
                            <label class="control-label">End Date *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter End Date">
                            </div>
                        </div>
                        <br />

                        <h3>Promotion Type</h3> <br />

                        <div class="control-group">
                            <div class="controls">
                                <label class="checkbox">SMS *<input type="checkbox" id="optionsCheckbox1" value="option1"> </label>

                                <label class="checkbox">Voice Call *<input type="checkbox" id="optionsCheckbox2" value="option1"> </label>

                            </div>
                        </div>
                        <br />

                        <h3>Promotion Based On</h3> <br />

                        <div class="control-group">
                            <div class="controls">
                                <label class="checkbox">SMS *<input type="checkbox" id="optionsCheckbox3" value="option1"> </label>

                                <label class="checkbox">LBS *<input type="checkbox" id="optionsCheckbox4" value="option1"> </label>

                                <label class="checkbox">Voice Call *<input type="checkbox" id="optionsCheckbox5" value="option1"> </label>

                                <label class="checkbox">GPRS *<input type="checkbox" id="optionsCheckbox6" value="option1"> </label>

                                <label class="checkbox">USSD *<input type="checkbox" id="optionsCheckbox7" value="option1"> </label>

                            </div>
                        </div>
                        <br />

                        <h3>Promotion Number</h3> <br />

                        <div class="control-group">
                            <label class="control-label">Promotion Number *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Promotion Number">
                            </div>
                        </div>
                        <br />

                        <h3>Cycle Time</h3> <br />

                        <div class="control-group">
                            <div class="controls">
                                <label class="radio">
                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                    &nbsp;&nbsp;&nbsp;
                                    Execute every &nbsp;
                                    <input class="span3" type="text" placeholder="Minutes"> </label>

                                <label class="radio">
                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option1" checked="">
                                    &nbsp;&nbsp;&nbsp;
                                    Execute at the end of the Promotion Period</label>

                            </div>
                        </div>
                        <br />

                        <h3>Processing Restirction</h3>  <br />

                        <div class="control-group">
                            <div class="controls">
                                <label class="checkbox">Do not Repeat Subscribers<input type="checkbox" id="optionsCheckbox8" value="option1"> </label>

                                <label class="checkbox">Repeat Subcribers<input type="checkbox" id="optionsCheckbox9" value="option1"> </label>

                            </div>
                        </div>
                        <br />


                        <h3>Selection Mechanism</h3> <br />
                        <br />

                        <div class="control-group">
                            <label class="control-label">Randomly Select</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Mechanism">

                            </div>
                        </div>
                        <br />

                        <div class="control-group">

                            <label class="control-label">Number of First Subscribers</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Mechanism">

                            </div>
                        </div>
                        <br />


                        <div class="control-group">

                            <label class="control-label">Number of Subscribers </label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Mechanism">
                                <br />

                                <div class="controls">
                                    <label class="control-label"> who made</label>
                                    <div class="controls docs-input-sizes">
                                        <input class="span3" type="text" placeholder="Enter Mechanism">


                                    </div>
                                </div>
                                <br />


                            </div>
                        </div>


                        <div class="controls">
                            <div class="controls">
                                <label class="control-label">Calls</label>
                                <div class="controls docs-input-sizes">
                                    <input class="span3" type="text" placeholder="Enter Mechanism">

                                </div>
                            </div>
                        </div>
                        <br />


                        <h4>Age Restriction</h4> <br />

                        <div class="controls">
                            <h5>Notification Message</h5> <br />
                        </div>



                        <div class="control-group">

                            <label class="control-label">SMS Message</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Mechanism">

                            </div>
                        </div>
                        <br />

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">Save changes</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn">Cancel</button>
                        </div>
                    </fieldset>
                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>