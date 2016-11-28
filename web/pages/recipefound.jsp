<%-- 
    Document   : recipefound
    Created on : Nov 20, 2016, 12:03:31 AM
    Author     : Dilan
--%>


<%@page import="com.backendless.Backendless"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.backendless.BackendlessCollection"%>
<%@page import="com.backendless.persistence.QueryOptions"%>
<%@page import="com.backendless.persistence.BackendlessDataQuery"%>
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
            String column = request.getParameter("column");
            String value = request.getParameter("value");
            
            BackendlessDataQuery dataQuery = new BackendlessDataQuery();
            dataQuery.setWhereClause("recipeId."+column + " = '" + value + "'");
            QueryOptions queryOptions = new QueryOptions();
            queryOptions.addRelated("recipeId");
            dataQuery.setQueryOptions(queryOptions);
            BackendlessCollection<Recipe_Components> recipes = Backendless.Data.of(Recipe_Components.class).find(dataQuery);
            Iterator<Recipe_Components> iterator = recipes.getCurrentPage().iterator();
            
        %>
    </head>
    <body>
        <div id="wrapper">

        <jsp:include page="nav.jsp"/>

        <!-- Page Content -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-push-3 col-md-9">
                    <h1>Recipes Found</h1>

                    <table class="table table-striped">
                        <thead>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price Big</th>
                            <th>Price Medium</th>
                            <th>Price Small</th>
                        </thead>
                        <tbody>
                            <%
                                boolean first=true;
                                while (iterator.hasNext()) {
                                    Recipe_Components rd = iterator.next();
                                    out.write("<tr>");
                                    if(first){
                                    out.write("<td>" + rd.getRecipeId().getName()+"</td>");
                                    out.write("<td>" + rd.getRecipeId().getDescription()+"</td>");
                                    out.write("<td>" + rd.getRecipeId().getPriceBig()+"</td>");
                                    out.write("<td>" + rd.getRecipeId().getPriceMedium()+"</td>");
                                    out.write("<td>" + rd.getRecipeId().getPriceSmall()+"</td>");
                            %>
                            <thead>
                            <th>Alcohol Type</th>
                            <th>Parts</th>
                            </thead>
                            <%
                                    }
                                    first=false;
                                
                            %>
                        </tbody>
                        <tbody>
                            <%
                                    out.write("<td>" + rd.getAlcoholType()+"</td>");
                                    out.write("<td>" + rd.getParts()+"</td>");
                                    out.write("</tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
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
