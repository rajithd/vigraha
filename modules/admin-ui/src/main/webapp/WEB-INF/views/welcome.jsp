<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="resources/java_scripts/jquery-1.7.min.js"></script>
    <script src="resources/java_scripts/bootstrap-dropdown.js"></script>
    <script src="resources/java_scripts/bootstrap-carousel.js"></script>

    <link href="resources/Style/global.css" rel="stylesheet" type="text/css" media="all" />
    <link href="resources/Style/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />

    <title>
        <fmt:message key="welcome.title"/>
    </title>

</head>
    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <jsp:include page="common/header.jsp"/>

        <div id="container">
            <div id="subContainer">
                <jsp:include page="common/header-bar.jsp"/>
                <br />
                <ul class="breadcrumb">
                    <li class="active"><fmt:message key="welcome.home.path"/> </li>
                </ul>
                <div class="span9">
                    <div id="myCarousel" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="resources/images/1.png" alt="">
                                <div class="carousel-caption">
                                    <h4><fmt:message key="welcome.vigraha.header"/> </h4>
                                    <p><fmt:message key="welcome.what.is.vigraha.text"/>
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/3.png" alt="">
                                <div class="carousel-caption" >
                                    <h4><fmt:message key="welcome.cdr.text"/> </h4>
                                    <p><fmt:message key="welcome.what.is.cdr.analizer"/>
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/4.png" alt="">
                                <div class="carousel-caption" >
                                    <h4><fmt:message key="welcome.cdr.text"/></h4>
                                    <p><fmt:message key="welcome.what.is.cdr.analizer"/>
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/2.png" alt="">
                                <div class="carousel-caption">
                                    <h4><fmt:message key="welcome.to.whome.it.is.useful"/> </h4>
                                    <p><fmt:message key="welcome.this.is.a.framework"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <br />
        <jsp:include page="common/footer.jsp"/>

    </body>
</html>