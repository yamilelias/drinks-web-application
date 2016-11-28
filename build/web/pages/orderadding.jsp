<%-- 
    Document   : orderadding
    Created on : Nov 23, 2016, 6:51:46 PM
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
        String name = request.getParameter("column");
        session.setAttribute("recipe",name);
        BackendlessDataQuery dataQuery = new BackendlessDataQuery();
        dataQuery.setWhereClause("recipeId.name = '" + name + "'");
        QueryOptions queryOptions = new QueryOptions();
        queryOptions.addRelated("recipeId");
        dataQuery.setQueryOptions(queryOptions);
        BackendlessCollection<Recipe_Components> recipes = Backendless.Data.of(Recipe_Components.class).find(dataQuery);
        Iterator<Recipe_Components> iterator = recipes.getCurrentPage().iterator();
        %>

        <title>Adding <% out.print(name); %></title>
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
                            <h5>Add Order</h5>

                            <form action="orderadded.jsp" method="get">
                                <div class="block">
                                    <label for="recipe">Select Size</label>
                                        <select name="column">                  
                                            <option value="big">Big</option>
                                            <option value="medium">Medium</option>
                                            <option value="small">Small</option>
                                        </select>
                                </div>
                                <%
                                    int x=0;
                                    while (iterator.hasNext()) {
                                        x++;
                                        Recipe_Components b = iterator.next();
                                %>
                                <div>
                                    <div class="checkbox">
                                        <label><input type="checkbox" checked="true" name="component<%=x%>"><%out.write(b.getAlcoholType());%>
                                        </label>
                                    </div>
                                </div>
                                <%  
                                        session.setAttribute("NumberComponents",x);
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
