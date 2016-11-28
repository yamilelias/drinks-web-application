<%-- 
    Document   : orderadded.jsp
    Created on : Nov 22, 2016, 4:51:38 PM
    Author     : Dilan
--%>

<%@page import="com.backendless.Backendless"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.backendless.BackendlessCollection"%>
<%@page import="com.backendless.persistence.QueryOptions"%>
<%@page import="com.backendless.persistence.BackendlessDataQuery"%>
<%@page import="com.backendless.drinks.data.Order_Details" %>
<%@page import="com.backendless.drinks.data.Order_Components" %>
<%@page import="com.backendless.drinks.data.Recipe_Details" %>
<%@page import="com.backendless.drinks.data.Recipe_Components" %>
<%@page import="com.backendless.drinks.data.Defaults" %>
<%@page import="com.backendless.BackendlessUser" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Added</title>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Add an Order</title>
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
        String size = request.getParameter("column");
        double sp = 0;
        String name = (String) session.getAttribute("recipe");
        BackendlessUser user = (BackendlessUser) session.getAttribute("user");
        
        BackendlessDataQuery dataQuery2 = new BackendlessDataQuery();
        dataQuery2.setWhereClause("recipeId.name = '" + name + "'");
        QueryOptions queryOptions2 = new QueryOptions();
        queryOptions2.addRelated("recipeId");
        dataQuery2.setQueryOptions(queryOptions2);
        BackendlessCollection<Recipe_Components> recipes2 = Backendless.Data.of(Recipe_Components.class).find(dataQuery2);
        Iterator<Recipe_Components> iterator2 = recipes2.getCurrentPage().iterator();
        
        
        int numberComponents = (Integer) session.getAttribute("numberComponents");

        BackendlessDataQuery dataQuery = new BackendlessDataQuery();
        dataQuery.setWhereClause("name = '" + name + "'");
        BackendlessCollection<Recipe_Details> recipes = Backendless.Data.of(Recipe_Details.class).find(dataQuery);
        Iterator<Recipe_Details> iterator = recipes.getCurrentPage().iterator();

        Backendless.initApp(Defaults.APPLICATION_ID, Defaults.SECRET_KEY, Defaults.VERSION);

        boolean saved = false;
        String message = "";

        try{
            while(iterator.hasNext()){
                Recipe_Details rd = iterator.next();
                if(size.equals("big"))
                    sp=rd.getPriceBig();
                else if(size.equals("medium"))
                    sp=rd.getPriceMedium();
                else
                    sp=rd.getPriceSmall();
                Order_Details od = new Order_Details(sp,size,rd,user);
                
                Backendless.Persistence.save(od);
                
                int i=0;
                while(iterator2.hasNext()){
                    i++;
                    Recipe_Components rc = iterator2.next();
                    if((request.getParameter("component"+i))==null){
                        //out.write("es falso "+ i);
                        Order_Components oc = new Order_Components(rc.getAlcoholType(),false, od);
                        Backendless.Persistence.save(oc);
                    }
                    else{
                        //out.write("es verdadero "+ i);
                        Order_Components oc = new Order_Components(rc.getAlcoholType(),true, od);
                        Backendless.Persistence.save(oc);
                    }
                }
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
                    <h1>Order adding</h1>
                    <% if(saved){ %>
                        <h1>Recipe <% out.print("Order with Selling Price: "+sp+" and Size:"+size); %> saved successfully!</h1>
                    <% } else { %>
                        <h1>Recipe <% out.print("Order with Selling Price: "+sp+" and Size:"+size); %> could not be saved.</h1>
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