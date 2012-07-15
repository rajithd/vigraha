<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <script src="resources/java_scripts/jquery-1.7.min.js"></script>
    <script src="resources/java_scripts/bootstrap-dropdown.js"></script>
    <script src="resources/java_scripts/bootstrap-carousel.js"></script>

    <link href="resources/Style/global.css" rel="stylesheet" type="text/css" media="all" />
    <link href="resources/Style/bootstrap.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap-responsive.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="resources/Style/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
</head>
    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <jsp:include page="common/header.jsp"/>

        <div id="container">
            <div id="subContainer">
                <jsp:include page="common/header-bar.jsp"/>
                <br />
                <ul class="breadcrumb">
                    <li class="active">Home</li>
                </ul>
                <div class="span9">
                    <div id="myCarousel" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="resources/images/1.png" alt="">
                                <div class="carousel-caption">
                                    <h4>Vigraha</h4>
                                    <p>What is Vigraha ?
                                        Analyze Caller Detail Records(CDR) and produce output based on dynamic rules.
                                        Subscriber Profiling.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/3.png" alt="">
                                <div class="carousel-caption" >
                                    <h4>CDR (Call Detail Record)</h4>
                                    <p>What is CDR analyzer ?
                                        Process CDR records and produced only useful outputs to telecommunication companies.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/4.png" alt="">
                                <div class="carousel-caption" >
                                    <h4>CDR (Call Detail Record)</h4>
                                    <p>What is CDR analyzer ?
                                        Process CDR records and produced only useful outputs to telecommunication companies.
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/2.png" alt="">
                                <div class="carousel-caption">
                                    <h4>To Whom it is useful ?</h4>
                                    <p>This is a framework intended for telecommunication companies with custom configurations that will suit them.
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