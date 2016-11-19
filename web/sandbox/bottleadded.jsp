<%-- 
    Document   : bottleadded
    Created on : Nov 18, 2016, 8:34:16 PM
    Author     : Yamil Elías <yamileliassoto@gmail.com>
--%>

<%@page import="com.backendless.Backendless"%>
<%@page import="com.backendless.drinks.data.Bottle" %>
<%@page import="com.backendless.drinks.data.Defaults" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bottle Added</title>
        
        <%
            String name = request.getParameter("name");
            String alcohol = request.getParameter("type");
            int mililiters = Integer.parseInt(request.getParameter("mililiters"));
            double cost = Double.parseDouble(request.getParameter("cost"));
            
            Bottle bottle = new Bottle(name, cost, mililiters, alcohol);
            
            Backendless.initApp(Defaults.APPLICATION_ID, Defaults.SECRET_KEY, Defaults.VERSION);
            
            boolean saved = false;
            String message = "";
            
            try{
                Backendless.Persistence.save(bottle);
                
                saved = true;
            } catch(Exception e){
                message = e.getMessage();
                saved = false;
            }
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% if(saved){ %>
            <h1>Bottle <% out.print(name); %> saved successfully!</h1>
        <% } else { %>
            <h1>Bottle <% out.print(name); %> could not be saved.</h1>
            <h3>This was the reason:</h3>
            <p> <% out.print(message); %> </p>
        <% } %>
    </body>
</html>
