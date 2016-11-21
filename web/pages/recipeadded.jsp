<%-- 
    Document   : recipeadded
    Created on : Nov 19, 2016, 11:44:46 PM
    Author     : Dilan
--%>


<%@page import="com.backendless.Backendless"%>
<%@page import="com.backendless.drinks.data.Recipe_Details" %>
<%@page import="com.backendless.drinks.data.Defaults" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Recipe Added</title>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Add a Recipe</title>
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->    

    <%
        String description = request.getParameter("description");
        String name = request.getParameter("name");
        double bp = Double.parseDouble(request.getParameter("pricebig"));
        double mp = Double.parseDouble(request.getParameter("pricemedium"));
        double sp = Double.parseDouble(request.getParameter("pricesmall"));

        Recipe_Details rd = new Recipe_Details(description,name , bp, mp,sp);

        Backendless.initApp(Defaults.APPLICATION_ID, Defaults.SECRET_KEY, Defaults.VERSION);

        boolean saved = false;
        String message = "";

        try{
            Backendless.Persistence.save(rd);

            saved = true;
        } catch(Exception e){
            message = e.getMessage();
            saved = false;
        }
    %>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Drinks Web Application</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
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
                                <!-- Bottles -->
                                <li>
                                    <a href="#"><i class="fa fa-beer fa-fw"></i> Bottles<span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="addBottle.jsp">Create a Bottle</a>
                                        </li>
                                        <li>
                                            <a href="#">Find a Bottle</a>
                                        </li>
                                        <li>
                                            <a href="#">Update a Bottle</a>
                                        </li>
                                        <li>
                                            <a href="#">Delete a Bottle</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-third-level -->
                        </li>
                        <!-- Orders -->
                        <li>
                            <a href="#"><i class="fa fa-file-text-o fa-fw"></i> Orders<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Create an Order</a>
                                </li>
                                <li>
                                    <a href="#">Find an Order</a>
                                </li>
                                <li>
                                    <a href="#">Update an Order</a>
                                </li>
                                <li>
                                    <a href="#">Delete an Order</a>
                                </li>
                            </ul>
                            <!-- /.nav-third-level -->
                        </li>
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
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
    
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Recipe adding</h1>
                    <% if(saved){ %>
                        <h1>Recipe <% out.print(name); %> saved successfully!</h1>
                    <% } else { %>
                        <h1>Recipe <% out.print(name); %> could not be saved.</h1>
                        <h3>This was the reason:</h3>
                        <p> <% out.print(message); %> </p>
                    <% } %>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->
    
    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</body>
</html>