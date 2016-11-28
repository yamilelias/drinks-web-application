<%-- 
    Document   : recipeupdating
    Created on : Nov 20, 2016, 12:21:37 AM
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
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <%
            String name = request.getParameter("name");
        String description = "";
        double bp = 0;
        double mp = 0;
        double sp = 0;
        
        BackendlessDataQuery dataQuery = new BackendlessDataQuery();
        dataQuery.setWhereClause("recipeId.name = '" + name + "'");
        QueryOptions queryOptions = new QueryOptions();
        dataQuery.setQueryOptions(queryOptions);
        BackendlessCollection<Recipe_Components> recipes = Backendless.Data.of(Recipe_Components.class).find(dataQuery);
        Iterator<Recipe_Components> iterator = recipes.getCurrentPage().iterator();
        
        while (iterator.hasNext()) {
            Recipe_Components rd = iterator.next();
            
            description = rd.getRecipeId().getDescription();
            bp = rd.getRecipeId().getPriceBig();
            mp = rd.getRecipeId().getPriceMedium();
            sp = rd.getRecipeId().getPriceSmall();
        }
        %>

        <title>Updating <% out.print(name); %></title>
        <!-- Bootstrap Core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <jsp:include page="nav.jsp"/>

        <div id="wrapper">
            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h5>Update <% out.print(name); %></h5>

                            <form action="recipeupdated.jsp" method="get">
                                <div class="block">
                                    <label for="name">Name:</label><input type="text" name="name" value="<% out.print(name); %>" />
                                </div>
                                <div class="block">
                                    <label for="description">Description:</label><input type="text" name="description" value="<% out.print(description); %>" />
                                </div>
                                <div class="block">
                                    <label for="pricebig">Price Big:</label>$<input type="number" name="pricebig" value="<% out.print(bp); %>" />
                                </div>
                                <div class="block">
                                    <label for="pricemedium">Price Medium</label>$<input type="number" min="0" name="pricemedium" value="<% out.print(mp); %>" />
                                </div>
                                <div class="block">
                                    <label for="pricesmall">Price Small</label>$<input type="number" min="0" name="pricesmall" value="<% out.print(sp); %>" />
                                </div>
                                <%
                                    Iterator<Recipe_Components> iterator2 = recipes.getCurrentPage().iterator();
                                    int x=0;
                                    while (iterator2.hasNext()) {
                                        Recipe_Components rc = iterator2.next();
                                        String component = rc.getAlcoholType();
                                        int parts = rc.getParts();
                                        x++;
                                        out.write("<br>"+
                                                "<label for=\"component"+x+"\">Component:</label>"+
                                                "<input type=\"text\" min=\"0\" name=\"component"+x+"\" value=\""+component+"\"/> "+
                                                "<label for=\"parts"+x+"\">Parts:</label>"+
                                                "<input type=\"number\" min=\"0\" name=\"parts"+x+"\" value=\""+parts+"\"/>"
                                        );
                                        session.setAttribute("numberComponents",x);
                                    }
                                %>
                                <div class="btns">
                                    <input type="submit" value="Submit" />
                                </div>
                            </form>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div>

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
