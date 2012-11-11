<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="welcome">Vigraha</a>

            <div class="nav-collapse">
                <sec:authorize ifAnyGranted="ROLE_SUPER_ADMIN">
                    <ul class="nav">
                        <li class="divider-vertical"></li>
                    </ul>


                    <ul class="nav">
                        <li class="dropdown" style="text-align: left">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrator <b class="caret"></b></a>
                            <ul class="dropdown-menu">

                                <li><a href="admin-registration">Create New Admin</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Modify / Delete Admin</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Change Password</a></li>
                                <li class="divider"></li>

                            </ul>
                        </li>
                    </ul>
                </sec:authorize>


                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <ul class="nav">
                    <li class="divider-vertical"></li>
                </ul>


                <ul class="nav">
                    <li class="dropdown" style="text-align: left">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Company <b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li><a href="company-registration">Create New Company</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Modify / Delete Company</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Change Password</a></li>
                            <li class="divider"></li>

                        </ul>
                    </li>
                </ul>
                </sec:authorize>

                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <ul class="nav">
                    <li class="divider-vertical"></li>
                </ul>

                <ul class="nav">
                    <li class="dropdown" style="text-align: left">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Promotion Programme <b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li><a href="promotion">Create new Promotion</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Edit / Search Promotion</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Promotion Programme Report</a></li>

                        </ul>
                    </li>
                </ul>
                </sec:authorize>

                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <ul class="nav">
                    <li class="divider-vertical"></li>
                </ul>

                <ul class="nav">
                    <li class="dropdown" style="text-align: left">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Loyalty Programme <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="loyalty">Create new Loyalty</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Edit / Search Loyalty</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Loyalty Programme Report</a></li>

                        </ul>
                    </li>
                </ul>
                </sec:authorize>

                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <ul class="nav">
                    <li class="divider-vertical"></li> <!-- vertical line | -->
                </ul>

                <ul class="nav">
                    <li class="dropdown" style="text-align: left">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tenure Programme<b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li><a href="tenure">Create new Tenure</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Edit / Search Tenure</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Tenure Programme Report</a></li>

                        </ul>
                    </li>
                </ul>
                </sec:authorize>

                <ul class="nav">
                    <li class="divider-vertical"></li> <!-- vertical line | -->
                </ul>

                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                    <ul class="nav">
                        <li class="divider-vertical"></li> <!-- vertical line | -->
                    </ul>

                    <ul class="nav">
                        <li class="dropdown" style="text-align: left">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Usage Based Reports<b class="caret"></b></a>
                            <ul class="dropdown-menu">

                                <li><a href="yearly-usage-based-report">Yearly Usage Based Report</a></li>
                                <li class="divider"></li>
                                <li><a href="monthly-usage-based-report">Monthly Usage based Report</a></li>
                            </ul>
                        </li>
                    </ul>
                </sec:authorize>


                <ul class="nav pull-right">
                    <li class="dropdown" style="text-align: left">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <b class="caret"></b></a>
                        <ul class="dropdown-menu">

                            <li><a href="#">Edit Profile</a></li>
                            <li class="divider"></li>
                            <li><a href=<c:url value="/j_spring_security_logout"/>>Sign Out</a></li>

                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</div>

<br />
<br />
<br />


</body>
</html>