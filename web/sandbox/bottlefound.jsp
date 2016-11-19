<%-- 
    Document   : bottleadded
    Created on : Nov 18, 2016, 8:34:16 PM
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
        <title>Bottle Added</title>
        
        <%
            String column = request.getParameter("column");
            String value = request.getParameter("value");
            
            boolean found = false;
            String message = "";
            
            try{
                BackendlessDataQuery dataQuery = new BackendlessDataQuery();
                dataQuery.setWhereClause(column + " = '" + value + "'");
                QueryOptions queryOptions = new QueryOptions();
                dataQuery.setQueryOptions(queryOptions);
                BackendlessCollection<Bottle> nycPeople = Backendless.Data.of(Bottle.class).find(dataQuery);
                Iterator<Bottle> iterator = nycPeople.getCurrentPage().iterator();
                while (iterator.hasNext()) {
                    Bottle b = iterator.next();
                    out.write("Type - " + b.getAlcoholType()+"<br>");
                    out.write("Name - " + b.getName()+"<br>");
                }
                
                found = true;
            } catch(Exception e){
                message = e.getMessage();
                found = false;
            }
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
