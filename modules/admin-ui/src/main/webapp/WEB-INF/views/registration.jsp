<%--
  Created by IntelliJ IDEA.
  User: Thejani
  Date: 5/31/12
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>
       <fmt:message key="registration.title"/>
    </title>

    <link href="../resources/Style/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../resources/Style/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="../resources/Style/style.css" rel="stylesheet" type="text/css" />


    <title>

    </title>
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

<div id="header-bar">
    <img src="../resources/Images/28.png" />
</div>

<br />
<br />
<br />
<br />


<div class="offset2">
    <div class="row">
        <div class="row">
            <div class="span6">
                <br />
                <form class="form-horizontal">
                    <fieldset>

                        <h3>Personal Information</h3>

                        <div class="control-group">
                            <label class="control-label">First Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter First Name">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label class="control-label">Last Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Last Name">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label class="control-label">Moblie Number *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Mobile No">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label class="control-label">Year of Birth *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder=".Enter Year of Birth">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label class="control-label">Profession</label>
                            <div class="controls docs-input-sizes">
                                <select id="select01">
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
                            <label class="control-label">User Name *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter User Name">
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label class="control-label">Password *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter Password">
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
                            <label class="control-label">Security question *</label>

                            <div class="controls docs-input-sizes">

                                <select id="select02">

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
                            <label class="control-label">National Identity Card Number *</label>
                            <div class="controls docs-input-sizes">
                                <input class="span3" type="text" placeholder="Enter National Identity Card Number">
                            </div>
                        </div>

                        <h3>Location Information</h3>

                        <div class="control-group">
                            <label class="control-label" for="textarea">Address</label>
                            <div class="controls">
                                <textarea class="input-xlarge" id="textarea" rows="4"></textarea>
                            </div>
                        </div>
                        <br />

                        <div class="control-group">
                            <label class="control-label">Country</label>
                            <div class="controls docs-input-sizes">
                                <select id="select03">
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
                            <label class="control-label">Province</label>
                            <div class="controls docs-input-sizes">
                                <select id="select04">
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
                            <label class="control-label">City / State</label>
                            <div class="controls docs-input-sizes">
                                <select id="select05">
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
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>