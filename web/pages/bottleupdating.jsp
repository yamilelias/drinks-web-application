<%-- 
    Document   : bottleupdating
    Created on : Nov 19, 2016, 1:38:17 PM
    Author     : Yamil Elías <yamileliassoto@gmail.com>
--%>

<%@page import="com.backendless.Backendless"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.backendless.BackendlessCollection"%>
<%@page import="com.backendless.persistence.QueryOptions"%>
<%@page import="com.backendless.persistence.BackendlessDataQuery"%>
<%@page import="com.backendless.drinks.data.Bottle" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    
    <%
        String name = request.getParameter("name");
        String type = "";
        int mililiters = 0;
        double cost = 0;
        
        BackendlessDataQuery dataQuery = new BackendlessDataQuery();
        dataQuery.setWhereClause("name = '" + name + "'");
        QueryOptions queryOptions = new QueryOptions();
        dataQuery.setQueryOptions(queryOptions);
        BackendlessCollection<Bottle> bottles = Backendless.Data.of(Bottle.class).find(dataQuery);
        Iterator<Bottle> iterator = bottles.getCurrentPage().iterator();
        
        while (iterator.hasNext()) {
            Bottle b = iterator.next();
            
            type = b.getAlcoholType();
            mililiters = b.getMililiters();
            cost = b.getBottleCost();
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
            
                        <form action="bottleupdated.jsp" method="get">
                            <div class="block">
                                <label for="name">Name:</label><input type="text" name="name" value="<% out.print(name); %>" />
                            </div>
                            <div class="block">
                                <label for="type">Alcohol Type:</label><input type="text" name="type" value="<% out.print(type); %>" />
                            </div>
                            <div class="block">
                                <label for="mililiters">Mililiters:</label><input type="number" name="mililiters" value="<% out.print(mililiters); %>" />
                            </div>
                            <div class="block">
                                <label for="cost">Cost:</label>$<input type="number" min="0" name="cost" value="<% out.print(cost); %>" />
                            </div>
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
