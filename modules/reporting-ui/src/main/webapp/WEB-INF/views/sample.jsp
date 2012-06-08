<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sample</title>
    <link href="resources/css/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/dialog.sdp.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="resources/javaScript/jquery.min.js"></script>
    <script type="text/javascript" src="resources/javaScript/ddaccordion.js"></script>
    <script type="text/javascript" src="resources/javaScript/JavaScript.js"></script>
    <script type="text/javascript" src="resources/javaScript/javaScriptInSdpJSP.js"></script>
    <script type="text/javascript" src="resources/javaScript/jquery.ui.core.js"></script>
    <script type="text/javascript" src="resources/javaScript/jquery.ui.datepicker.js"></script>
    <script type="text/javascript">
        var err1 = "err1";
        var err2 = "err2";
        var err3 = "err3";
        var err4 = "err4";
        var err5 = "err5";
        var errnoapp = "err6";
    </script>
</head>
<body>
<div id="wrap">

    <div id="content">

        <div id="main_content">
            <div id="heading_top">
                <div class="heading_name">Heading name</div>
            </div>
            <div id="heading_middle">
                <form name="governanceReport" method="get" action="<%= request.getContextPath( ) + "/frameset" %>"
                      target="_blank">
                    <table width="670" border="0" align="center" cellspacing="6">
                        <tr>
                            <td><input type='hidden' name='__report' value="report/sample.rptdesign">
                            </td>


                        </tr>


                        <tr>
                            <td width="150">&nbsp;</td>
                            <td><input type="image" src="resources/images/button.gif" width="63" height="25"
                                       border="0" alt="submit"/></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>