<%-- 
    Document   : orderfound
    Created on : Nov 23, 2016, 11:19:18 AM
    Author     : Dilan
--%>

<%@page import="com.backendless.Backendless"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.backendless.BackendlessCollection"%>
<%@page import="com.backendless.persistence.QueryOptions"%>
<%@page import="com.backendless.persistence.BackendlessDataQuery"%>
<%@page import="com.backendless.drinks.data.Order_Details" %>
<%@page import="com.backendless.drinks.data.Recipe_Details" %>
<%@page import="com.backendless.drinks.data.Order_Components" %>

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
            BackendlessDataQuery dataQuery1 = new BackendlessDataQuery();
            dataQuery1.setWhereClause("objectId='"+column+"'");
            BackendlessCollection<Recipe_Details> recipe = Backendless.Data.of(Recipe_Details.class).find(dataQuery1);
            
            Iterator<Recipe_Details> iterator2 = recipe.getCurrentPage().iterator();
            Recipe_Details rd = iterator2.next();
            
            
            //out.write(rd.getName());
            
            BackendlessDataQuery dataQuery = new BackendlessDataQuery();
            dataQuery.setWhereClause("recipeId.objectId = '"+column+"'");
            QueryOptions queryOptions = new QueryOptions();
            //queryOptions.addRelated("orderId");
            dataQuery.setQueryOptions(queryOptions);
            BackendlessCollection<Order_Details> orders = Backendless.Data.of(Order_Details.class).find(dataQuery);
            Iterator<Order_Details> iterator = orders.getCurrentPage().iterator();
            
        %>
    </head>
    <body>
        <div id="wrapper">

            <jsp:include page="nav.jsp"/>

            <!-- Page Content -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-push-3 col-md-9">
                        <h1>Orders of <%out.write(rd.getName());%> Found</h1>

                        <table class="table table-striped">
                            <thead>
                            <th>User</th>
                            <th>Selling Price</th>
                            <th>Size</th>
                            </thead>
                            <tbody>
                                <%
                                    while (iterator.hasNext()) {
                                        Order_Details oc = iterator.next();
                                        out.write("<tr>");
                                        out.write("<td>" + (String) session.getAttribute("email")+"</td>");
                                        out.write("<td>" + oc.getSellingPrice()+"</td>");
                                        out.write("<td>" + oc.getSize()+"</td>");
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
