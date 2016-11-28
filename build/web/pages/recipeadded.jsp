<%-- 
    Document   : recipeadded
    Created on : Nov 19, 2016, 11:44:46 PM
    Author     : Dilan
--%>


<%@page import="com.backendless.Backendless"%>
<%@page import="com.backendless.drinks.data.Recipe_Details" %>
<%@page import="com.backendless.drinks.data.Recipe_Components" %>
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
        
            int numberComponents = (Integer)session.getAttribute("numberComponents");

            Recipe_Details rd = new Recipe_Details(description,name , bp, mp,sp);
            Backendless.initApp(Defaults.APPLICATION_ID, Defaults.SECRET_KEY, Defaults.VERSION);

            boolean saved = false;
            String message = "";

            try{
                Backendless.Persistence.save(rd);
                for(int i=1;i<=numberComponents+1;i++){
                    //System.out.println(numberComponents+"\n"+i);
                    String component = request.getParameter("component"+i);
                    int parts = Integer.parseInt(request.getParameter("parts"+i));
                    Recipe_Components rc = new Recipe_Components(component,parts,rd);
                    Backendless.Persistence.save(rc);
                }
                saved = true;
            } catch(Exception e){
                message = e.getMessage();
                saved = false;
            }
        
        
        

        %>
    </head>
    <body>
       <jsp:include page="nav.jsp"/>

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