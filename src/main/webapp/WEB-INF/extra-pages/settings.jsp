<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dorsa
  Date: 7/12/17
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Settings</title>
    <script src="<c:url value="/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/stylesheet.css"/>" rel="stylesheet">
    <style>
        /* make sidebar nav vertical */
        @media (min-width: 768px){
            .affix-content .container {
                width: 700px;
                padding-top: 100px;
            }

            html,body{
                background-color: #f8f8f8;
                height: 100%;
                overflow: hidden;
            }
            .affix-content .container .page-header{
                margin-top: 0;
            }
            .sidebar-nav{
                position:fixed;
                width:100%;
            }
            .affix-sidebar{
                padding-right:0;
                font-size:small;
                padding-left: 0;
                /*me*/
                padding-top: 114px;
            }
            .affix-row, .affix-container, .affix-content{
                height: 100%;
                margin-left: 0;
                margin-right: 0;
            }
            .affix-content{
                background-color:white;
            }
            .sidebar-nav .navbar .navbar-collapse {
                padding: 0;
                max-height: none;
            }
            .sidebar-nav .navbar{
                border-radius:0;
                margin-bottom:0;
                border:0;
            }
            .sidebar-nav .navbar ul {
                float: none;
                display: block;
            }
            .sidebar-nav .navbar li {
                float: none;
                display: block;
            }
            .sidebar-nav .navbar li a {
                padding-top: 12px;
                padding-bottom: 12px;
            }
        }

        @media (min-width: 769px){
            .affix-content .container {
                width: 600px;
            }
            .affix-content .container .page-header{
                margin-top: 0;
            }
        }

        @media (min-width: 992px){
            .affix-content .container {
                width: 900px;
            }
            .affix-content .container .page-header{
                margin-top: 0;
            }
        }

        @media (min-width: 1220px){
            .affix-row{
                overflow: hidden;
            }

            .affix-content{
                overflow: auto;
            }

            .affix-content .container {
                width: 1000px;
            }

            .affix-content .container .page-header{
                margin-top: 0;
            }
            .affix-content{
                padding-right: 30px;
                padding-left: 30px;
            }
            .affix-title{
                border-bottom: 1px solid #ecf0f1;
                padding-bottom:10px;
            }
            .navbar-nav {
                margin: 0;
            }
            .navbar-collapse{
                padding: 0;
            }
            .sidebar-nav .navbar li a:hover {
                background-color: #428bca;
                color: white;
            }
            .sidebar-nav .navbar li a > .caret {
                margin-top: 8px;
            }
        }


    </style>
</head>
<body>
<%--<div class="affix-container">--%>
    <div class="row affix-row">
        <div class="col-sm-3 col-md-2 affix-sidebar">
            <div class="sidebar-nav">
                <div class="navbar navbar-default" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <span class="visible-xs navbar-brand">Sidebar menu</span>
                    </div>
                    <div class="navbar-collapse collapse sidebar-navbar-collapse">
                        <ul class="nav navbar-nav" id="sidenav01">
                            <li class="active">
                                <%--<a href="#" data-toggle="collapse" data-target="#toggleDemo0" data-parent="#sidenav01" class="collapsed">
                                    <h4>
                                        Control Panel
                                        <br>
                                        <small>IOSDSV <span class="caret"></span></small>
                                    </h4>
                                </a>--%>
                                <%--<div class="collapse" id="toggleDemo0" style="height: 0px;">
                                    <ul class="nav nav-list">
                                        <li><a href="#">ProfileSubMenu1</a></li>
                                        <li><a href="#">ProfileSubMenu2</a></li>
                                        <li><a href="#">ProfileSubMenu3</a></li>
                                    </ul>
                                </div>--%>
                            </li>
                            <li>
                                <a href="#" data-toggle="collapse" data-target="#toggleDemo" data-parent="#sidenav01" class="collapsed">
                                    <span class="glyphicon glyphicon-cloud"></span> Add new host <span class="caret pull-right"></span>
                                </a>
                                <div class="collapse" id="toggleDemo" style="height: 0px;">
                                    <ul class="nav nav-list">
                                        <li><a href="#">Submenu1.1</a></li>
                                        <li><a href="#">Submenu1.2</a></li>
                                        <li><a href="#">Submenu1.3</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#" data-toggle="collapse" data-target="#toggleDemo2" data-parent="#sidenav01" class="collapsed">
                                    <span class="glyphicon glyphicon-inbox"></span> All Hosts <span class="caret pull-right"></span>
                                </a>
                                <div class="collapse" id="toggleDemo2" style="height: 0px;">
                                    <ul class="nav nav-list">
                                        <li><a href="#">Submenu2.1</a></li>
                                        <li><a href="#">Submenu2.2</a></li>
                                        <li><a href="#">Submenu2.3</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li><a href="#"><span class="glyphicon glyphicon-lock"></span> Host groups</a></li>
                            <li class="active"><a id="file-monitoring" href="#"><span class="glyphicon glyphicon-calendar"></span> File Monitoring <span class="badge pull-right">42</span></a></li>
                            <li><a href=""><span class="glyphicon glyphicon-cog"></span> Tags</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-md-10 affix-content">
            <div class="container" id="result">
            </div>
        </div>
    </div>
<%--</div>--%>
<script>
    $(document).ready(function(){
        $('#file-monitoring').click(function () {
            $('#result').load("file-monitoring");
        });
    });
</script>
</body>
</html>
