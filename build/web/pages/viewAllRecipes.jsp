<%-- 
    Document   : viewAllRecipes
    Created on : Nov 28, 2016, 12:28:16 AM
    Author     : Yamil Elías <yamileliassoto@gmail.com>
--%>

<%@page import="com.backendless.Backendless"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.backendless.BackendlessCollection"%>
<%@page import="com.backendless.drinks.data.Recipe_Details" %>
<%@page import="com.backendless.drinks.data.Recipe_Components" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recipe Found</title>
        
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
            BackendlessCollection<Recipe_Components> recipes = Backendless.Data.of(Recipe_Components.class).find();
            Iterator<Recipe_Components> iterator = recipes.getCurrentPage().iterator();
            
        %>
    </head>
    <body>
        <div id="wrapper">

        <jsp:include page="nav.jsp"/>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <h1>All Recipes</h1>

                    <table class="table table-striped">
                        <thead>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price Big</th>
                            <th>Price Medium</th>
                            <th>Price Small</th>
                            <th>Alcohol Type</th>
                            <th>Parts</th>
                        </thead>
                        <tbody>
                            <%
                                while (iterator.hasNext()) {
                                    Recipe_Components rd = iterator.next();
                                    out.write("<tr>");
                                    out.write("<td>" + rd.getRecipeId().getName()+"</td>");
                                    out.write("<td>" + rd.getRecipeId().getDescription()+"</td>");
                                    out.write("<td>" + rd.getRecipeId().getPriceBig()+"</td>");
                                    out.write("<td>" + rd.getRecipeId().getPriceMedium()+"</td>");
                                    out.write("<td>" + rd.getRecipeId().getPriceSmall()+"</td>");
                                    out.write("<td>" + rd.getAlcoholType()+"</td>");
                                    out.write("<td>" + rd.getParts()+"</td>");
                                    out.write("</tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#wrapper -->

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
