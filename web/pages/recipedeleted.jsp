<%-- 
    Document   : recipedeleted
    Created on : Nov 20, 2016, 12:35:18 AM
    Author     : Dilan
--%>

<%@page import="com.backendless.Backendless"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.backendless.BackendlessCollection"%>
<%@page import="com.backendless.persistence.QueryOptions"%>
<%@page import="com.backendless.persistence.BackendlessDataQuery"%>
<%@page import="com.backendless.drinks.data.Recipe_Details" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recipe Deleted</title>
        
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
            String value = request.getParameter("value");
            String message = "";
            boolean deleted = false;
            
            BackendlessDataQuery dataQuery = new BackendlessDataQuery();
            dataQuery.setWhereClause("name = '"+ value +"'");
            QueryOptions queryOptions = new QueryOptions();
            dataQuery.setQueryOptions(queryOptions);
            BackendlessCollection<Recipe_Details> recipes = Backendless.Data.of(Recipe_Details.class).find(dataQuery);
            Iterator<Recipe_Details> iterator = recipes.getCurrentPage().iterator();
            try{
                while (iterator.hasNext()) {
                    Recipe_Details rd = iterator.next();
                    Long result = Backendless.Persistence.of(Recipe_Details.class).remove(rd);
                }
                
                deleted = true;
            } catch(Exception e){
                message = e.getMessage();
            }
            
            
        %>
    </head>
    <body>
        <div id="wrapper">

        <jsp:include page="nav.jsp"/>

        <!-- Page Content -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Recipe deleted</h1>
                    <% if(deleted){ %>
                        <h1>Recipe <% out.print(value); %> deleted successfully!</h1>
                    <% } else { %>
                        <h1>Recipe <% out.print(value); %> could not be deleted.</h1>
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
