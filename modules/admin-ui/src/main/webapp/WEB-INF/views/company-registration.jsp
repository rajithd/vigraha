<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="resources/java_scripts/jquery-1.7.min.js"></script>
    <script src="resources/java_scripts/bootstrap-dropdown.js"></script>
    <script src="resources/java_scripts/bootstrap-carousel.js"></script>
    <script src="resources/java_scripts/bootstrap-datepicker.js"></script>
    <script src="resources/java_scripts/bootstrap_datepicker_format.js"></script>

    <link href="resources/Style/global.css" rel="stylesheet" type="text/css" media="all" />
    <link href="resources/Style/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/datepicker.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/datepicker.less" type="text/css" rel="stylesheet" />

    <title>
        <fmt:message key="company.register.title"/>
    </title>
</head>
<body data-spy="scroll" data-target=".subnav" data-offset="50">

    <jsp:include page="common/header.jsp"/>

    <div id="container">

        <div id="subContainer">

            <div id="header-bar">

                <img src="resources/images/header_bar.png" />
            </div>

            <br />

            <ul class="breadcrumb">
                <li>
                    <a href="welcome"><fmt:message key="company.register.home.path"/> </a> <span class="divider">/</span>
                </li>
                <li class="active"><fmt:message key="company.register.admin.path"/> </li><span class="divider">/</span>
                <li class="active"><fmt:message key="company.register.company.register.form.path"/> </li>
            </ul>

            <div class="offset1">
                <div class="row">
                    <div class="row">

                        <div class="span8">

                            <h3><fmt:message key="company.register.company.register.form.header"/> </h3>

                            <hr />

                        </div>

                        <div class="span8" style="background-color:#F4F4F4">
                        <div class="offset1">
                            <br />

                            <form:form class="form-horizontal">
                                <fieldset>



                                    <h3><fmt:message key="company.register.company.infor.subheader"/> </h3>

                                    <br />

                                    <div class="control-group">
                                        <label for="companyname" class="control-label"><fmt:message key="company.register.company.name.label"/> *</label>
                                        <div class="controls docs-input-sizes">
                                            <input class="span3" id="companyname" name="companyname" type="text" placeholder="Enter First Name">
                                        </div>
                                    </div>

                                    <br />

                                    <div class="control-group">
                                        <label for="regno" class="control-label"><fmt:message key="company.register.company.reg.no.label"/> *</label>
                                        <div class="controls docs-input-sizes">
                                            <input class="span3" id="regno" name="regno" type="text" placeholder="Enter Last Name">
                                        </div>
                                    </div>

                                    <br />

                                    <div class="control-group">
                                        <label for="tele1" class="control-label"><fmt:message key="company.register.company.tele.no1.label"/> *</label>
                                        <div class="controls docs-input-sizes">
                                            <input class="span3" id="tele1" name="tele1" type="text" placeholder="Enter Mobile No">
                                        </div>
                                    </div>

                                    <br />

                                    <div class="control-group">
                                        <label for="tele2" class="control-label"><fmt:message key="company.register.company.tele.no2.label"/> *</label>
                                        <div class="controls docs-input-sizes">
                                            <input class="span3" id="tele2" name="tele2" type="text" placeholder="Enter Mobile No">
                                        </div>
                                    </div>

                                    <br />

                                    <div class="control-group">
                                        <label for="email" class="control-label"><fmt:message key="company.register.company.email.address.label"/> *</label>
                                        <div class="controls docs-input-sizes">
                                            <input class="span3" id="email" name="email" type="text" placeholder="Enter Mobile No">
                                        </div>
                                    </div>

                                    <br />

                                    <div class="control-group">
                                        <label class="control-label" for="address"><fmt:message key="company.register.company.address.label"/> </label>
                                        <div class="controls">
                                            <textarea class="input-xlarge" id="address" name="address" rows="4"></textarea>
                                        </div>
                                    </div>

                                    <br />

                                    <h3><fmt:message key="company.register.signin.infor.subheader"/> </h3>

                                    <br />

                                    <div class="control-group">
                                        <label for="username" class="control-label"><fmt:message key="company.register.username.label"/> *</label>
                                        <div class="controls docs-input-sizes">
                                            <input class="span3" id="username" name="username" type="text" placeholder="Enter User Name">
                                        </div>
                                    </div>

                                    <br />

                                    <div class="control-group">
                                        <label for="password" class="control-label"><fmt:message key="company.register.password.label"/> *</label>
                                        <div class="controls docs-input-sizes">
                                            <input class="span3" id="password" name="password" type="text" placeholder="Enter Password">
                                        </div>
                                    </div>

                                    <br />

                                    <div class="control-group">
                                        <label class="control-label"><fmt:message key="company.register.confirm.password.label"/> *</label>
                                        <div class="controls docs-input-sizes">
                                            <input class="span3" type="text" placeholder="Enter Confirm Password">
                                        </div>
                                    </div>

                                    <br />

                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-primary"><fmt:message key="company.register..save.changes.button"/> </button>
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

    <br />
    <br />
    <jsp:include page="common/footer.jsp"/>
</body>
</html>

