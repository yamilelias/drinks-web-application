<%-- 
    Document   : getlogin
    Created on : Nov 25, 2016, 9:33:44 AM
    Author     : Dilan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.backendless.Backendless"%>
<%@page import="com.backendless.BackendlessUser"%>
<%@page import="com.backendless.exceptions.BackendlessException"%>
<%@page import="com.backendless.drinks.data.Defaults" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            boolean valid = false;
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            //String id="";
            Backendless.initApp(Defaults.APPLICATION_ID, Defaults.SECRET_KEY, Defaults.VERSION);
            try{
                BackendlessUser user = Backendless.UserService.login( email, pass);
                session.setAttribute("user",user);
            //BackendlessUser user = Backendless.UserService.CurrentUser();
            //id = (String) user.getProperty( "objectId" );
            valid = true;
            }catch(BackendlessException e){
                valid = false;
            
            }
            if(valid){
                //session.setAttribute("id",id);
                session.setAttribute("email",email);
                session.setAttribute("pass",pass);
            }
        %>
        
        <h3>Logging in...</h3>
    </body>
</html>
<script language="javascript">
    var valid = <%=valid%>
    if(valid)
        window.location.href = "index.jsp";
    else
        window.location.href = "login-users.html";
</script>
