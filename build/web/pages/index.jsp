<%-- 
    Document   : index
    Created on : Nov 25, 2016, 10:46:57 AM
    Author     : Dilan
--%>

<%@page import="com.backendless.Backendless"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.backendless.BackendlessCollection"%>
<%@page import="com.backendless.persistence.QueryOptions"%>
<%@page import="com.backendless.persistence.BackendlessDataQuery"%>
<%@page import="com.backendless.drinks.data.Recipe_Details" %>
<%@page import="com.backendless.drinks.data.Recipe_Components" %>
<%@page import="com.backendless.drinks.data.Bottle" %>
<%@page import="com.backendless.drinks.data.Order_Details" %>
<%@page import="com.backendless.drinks.data.Order_Components" %>
<%@page import="com.backendless.BackendlessUser"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Administrator | Drinks Web Application</title>

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
        /* Variables to be print*/
        int users = 0;
        int recipes = 0;
        int bottles = 0;
        int orders = 0;
        
        /* Users Query */
        BackendlessCollection<BackendlessUser> user = Backendless.Data.of(BackendlessUser.class).find();
        users = user.getCurrentPage().size();
        
        /* Recipes Query */
        BackendlessCollection<Recipe_Components> recipe = Backendless.Data.of(Recipe_Components.class).find();
        recipes = recipe.getCurrentPage().size();

        /* Bottles Query */
        BackendlessCollection<Bottle> bottle = Backendless.Data.of(Bottle.class).find();
        bottles = bottle.getCurrentPage().size();

        /* Order Query */
        BackendlessCollection<Order_Details> order = Backendless.Data.of(Order_Details.class).find();
        orders = order.getCurrentPage().size();

    %>

</head>

<body>

    <div id="wrapper">
        <jsp:include page="nav.jsp"/>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-users fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><% out.print(users); %></div>
                                    <div>Total Users</div>
                                </div>
                            </div>
                        </div>
                        <a href="viewAllUsers.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">View All</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-glass fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><% out.print(recipes); %></div>
                                    <div>Total Recipes</div>
                                </div>
                            </div>
                        </div>
                        <a href="viewAllRecipes.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">View All</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-beer fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><% out.print(bottles); %></div>
                                    <div>Total Bottles</div>
                                </div>
                            </div>
                        </div>
                        <a href="viewAllBottles.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">View All</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-file-text-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><% out.print(orders); %></div>
                                    <div>Orders Today</div>
                                </div>
                            </div>
                        </div>
                        <a href="viewAllOrders.jsp">
                            <div class="panel-footer">
                                <span class="pull-left">View All</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
