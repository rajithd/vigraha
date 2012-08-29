<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
     <script src="resources/java_scripts/jquery-1.7.min.js"></script>
     <script src="resources/java_scripts/bootstrap-dropdown.js"></script>
     <script src="resources/java_scripts/bootstrap-carousel.js"></script>
     <script src="resources/java_scripts/bootstrap-datepicker.js"></script>
     <script src="resources/java_scripts/bootstrap_datepicker_format.js"></script>
     <script src="resources/java_scripts/bootstrap-popover.js"></script>

     <link href="resources/Style/global.css" rel="stylesheet" type="text/css" media="all" />
     <link href="resources/Style/bootstrap.css" type="text/css" rel="stylesheet" />
     <link href="resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
     <link href="resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link href="resources/Style/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
     <link href="resources/Style/datepicker.css" type="text/css" rel="stylesheet" />
     <link href="resources/Style/datepicker.less" type="text/css" rel="stylesheet" />

     <title>
         <fmt:message key="admin.registration.title"/>
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
                 <a href="welcome"><fmt:message key="admin.registration.home.path"/> </a> <span class="divider">/</span>
             </li>
             <li class="active"><fmt:message key="admin.registration.admin.path"/> </li><span class="divider">/</span>
             <li class="active"><fmt:message key="admin.registration.admin.reg.form.path"/> </li>
         </ul>

         <div class="row">
             <div class="span22 offset1">

                 <div class="row">
                     <div class="row">

                         <div class="span8">

                             <h3 style="color:#858585" align="center"><fmt:message key="admin.registration.admin.reg.form.title"/> </h3>
                             <hr />

                         </div>

                         <div class="span8" style="background-color:#FFF">

                         <form class="form-horizontal" method="post">
                             <fieldset>

                                 <div class="row-fluid">
                                     <div class="span12">

                                         <div class="row-fluid">
                                             <div class="span6">

                                                 <span style="margin-left:20px; color:#a9a9a9; font-size:18px"><fmt:message key="admin.registration.personal.infor.subheader"/> </span>

                                             </div>

                                             <div class="span6" align="right">


                                                 <span style="color: #a9a9a9; margin-left:20px; font-size:10px;"><fmt:message key="admin.registration.note.text"/> </span>
                                                 <span style="color: red; font-size:12px;"> * </span>
                                                 <span style="color: #a9a9a9; font-size:10px;"><fmt:message key="admin.registration.indicate.a.required.field.msg"/> </span>

                                                 <br />

                                             </div>
                                         </div>

                                         <hr />

                                         <br />

                                         <div class="row-fluid">

                                             <div class="span6">

                                                 <div class="control-group">
                                                     <label class="control-label" style="font-size:14px"><fmt:message key="admin.registration.nic.no.label"/> <span style="color: red;"> * </span> :</label>
                                                     <div class="controls docs-input-sizes">
                                                         <input class="large" size="25" type="text" placeholder="Enter NIC No" name="id">
                                                     </div>
                                                 </div>

                                             </div>


                                         </div>


                                         <hr />
                                         <span style="margin-left:20px; color:#a9a9a9; font-size:18px"><fmt:message key="admin.registration.signin.infor.subheader"/> </span>
                                         <hr />

                                         <br />

                                         <div class="row-fluid">
                                             <div class="span6">

                                                 <div class="control-group">
                                                     <label class="control-label" style="font-size:14px"><fmt:message key="admin.registration.username.label"/> <span style="color: red;"> * </span> :</label>
                                                     <div class="controls docs-input-sizes">
                                                         <input class="large" size="25" type="text" placeholder="Enter User Name" name="username">
                                                     </div>
                                                 </div>

                                             </div>
                                         </div>

                                         <div class="row-fluid">
                                             <div class="span6">

                                                 <div class="control-group">
                                                     <label class="control-label" style="font-size:14px"><fmt:message key="admin.registration.password.label"/> <span style="color: red;"> * </span> :</label>
                                                     <div class="controls docs-input-sizes">
                                                         <input class="large" size="25" type="text" placeholder="Enter Password" name="password">
                                                     </div>
                                                 </div>

                                             </div>

                                             <div class="span6">

                                                 <div class="control-group">
                                                     <label class="control-label" style="font-size:14px"><fmt:message key="admin.registration.confirm.password.label"/> <span style="color: red;"> * </span> :</label>
                                                     <div class="controls docs-input-sizes">
                                                         <input class="large" size="25" type="text" placeholder="Enter Confirm Password">
                                                     </div>
                                                 </div>

                                             </div>
                                         </div>

                                         <div class="well">

                                             <button type="submit" class="btn btn-primary" rel="popover" title="Save Administrator"><fmt:message key="admin.registration.savechanges.button"/> </button>
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             <button class="btn" rel="popover" title="Cancel Registration"><fmt:message key="admin.registration.cancel.button"/> </button>

                                         </div>
                                         </div>
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

 <br />
 <br />
        <jsp:include page="common/footer.jsp"/>
 </body>
</html>
