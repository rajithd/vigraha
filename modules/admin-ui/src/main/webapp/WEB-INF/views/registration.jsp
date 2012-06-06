
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
            <form:form class="navbar-search pull-right">
                <input type="text" class="search-query" placeholder="Search">
            </form:form>

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
                <form:form class="form-horizontal">
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
</body>
</html>