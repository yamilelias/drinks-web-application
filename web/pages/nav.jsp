<%-- 
    Document   : nav
    Created on : Nov 25, 2016, 11:10:12 AM
    Author     : Dilan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">Drinks Web Application</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                Hello <%out.write((String)session.getAttribute("name"));%><i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <li><a href="login-users.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" disabled placeholder="Search...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" disabled>
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <!-- Dashboard -->
                <li>
                    <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <!-- Recipes -->
                <li>
                    <a href="#"><i class="fa fa-glass fa-fw"></i> Recipes<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="addRecipe_Details.jsp">Create a Recipe</a>
                        </li>
                        <li>
                            <a href="findRecipe_Details.jsp">Find a Recipe</a>
                        </li>
                        <li>
                            <a href="updateRecipe_Details.jsp">Update a Recipe</a>
                        </li>
                        <li>
                            <a href="deleteRecipe_Details.jsp">Delete a Recipe</a>
                        </li>
                    </ul>
                    <!-- /.nav-third-level -->
                </li>
                <!-- Bottles -->
                <li>
                    <a href="#"><i class="fa fa-beer fa-fw"></i> Bottles<span class="fa arrow"></span></a>
                    <ul class="nav nav-third-level">
                        <li>
                            <a href="addBottle.jsp">Create a Bottle</a>
                        </li>
                        <li>
                            <a href="findBottle.jsp">Find a Bottle</a>
                        </li>
                        <li>
                            <a href="updateBottle.jsp">Update a Bottle</a>
                        </li>
                        <li>
                            <a href="deleteBottle.jsp">Delete a Bottle</a>
                        </li>
                    </ul>
                    <!-- /.nav-third-level -->
                </li>
                <!-- Orders -->
                <li>
                    <a href="#"><i class="fa fa-file-text-o fa-fw"></i> Orders<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="addOrder.jsp">Create an Order</a>
                        </li>
                        <li>
                            <a href="findOrder.jsp">Find an Order</a>
                        </li>
                        <%/*<li>
                            <a href="#">Update an Order</a>
                        </li>
                        <li>
                            <a href="#">Delete an Order</a>
                        </li>*/%>
                    </ul>
                    <!-- /.nav-third-level -->
                </li>

                <%/*
                <!-- Users -->
                <li>
                    <a href="#"><i class="fa fa-users fa-fw"></i> Users<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="#">Create an User</a>
                        </li>
                        <li>
                            <a href="#">Find an User</a>
                        </li>
                        <li>
                            <a href="#">Update an User</a>
                        </li>
                        <li>
                            <a href="#">Delete an User</a>
                        </li>
                    </ul>
                    <!-- /.nav-third-level -->
                </li>
                <!-- Development -->
                <li>
                    <a href="#"><i class="fa fa-code fa-fw"></i> Development<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <!-- Charts -->
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-third-level -->
                        </li>
                        <!-- Forms -->
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                        <!-- Sample Pages -->
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="dashboard.html">Dashboard Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-third-level -->
                        </li>
                        <!-- Tables -->
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
                        <!-- UI Elements -->
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-third-level -->
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li> 
                */%>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>