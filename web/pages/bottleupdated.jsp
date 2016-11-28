<%-- 
    Document   : bottleupdated
    Created on : Nov 19, 2016, 1:45:07 PM
    Author     : Yamil Elías <yamileliassoto@gmail.com>
--%>

<%@page import="com.backendless.Backendless"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.backendless.BackendlessCollection"%>
<%@page import="com.backendless.persistence.QueryOptions"%>
<%@page import="com.backendless.persistence.BackendlessDataQuery"%>
<%@page import="com.backendless.drinks.data.Bottle" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        int mililiters = Integer.parseInt(request.getParameter("mililiters"));
        double cost = Double.parseDouble(request.getParameter("cost"));

        String message = "";
        boolean updated = false;

        BackendlessDataQuery dataQuery = new BackendlessDataQuery();
        dataQuery.setWhereClause("name = '" + name + "'");
        QueryOptions queryOptions = new QueryOptions();
        dataQuery.setQueryOptions(queryOptions);
        BackendlessCollection<Bottle> bottles = Backendless.Data.of(Bottle.class).find(dataQuery);
        Iterator<Bottle> iterator = bottles.getCurrentPage().iterator();

        try{
           while (iterator.hasNext()) {
                Bottle b = iterator.next();
                b.setName(name);
                b.setAlcoholType(type);
                b.setMililiters(mililiters);
                b.setBottleCost(cost);
                Backendless.Persistence.save(b);
            }

           updated = true;
        } catch(Exception e){
            message = e.getMessage();
        }

    %>
    <title>Bottle Updated</title>

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
</head>
<body>
    <div id="wrapper">

    <jsp:include page="nav.jsp"/>

        <!-- Page Content -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Bottle Update</h1>
                    <% if(updated){ %>
                        <h2>Bottle <% out.print(name); %> updated successfully!</h2>
                    <% } else { %>
                        <h2>Bottle <% out.print(name); %> could not be updated.</h2>
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
