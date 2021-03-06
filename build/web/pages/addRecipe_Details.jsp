<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Add a Recipe</title>
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
                         <h5>Add a Recipe</h5>
            
                        <form action="recipeadded.jsp" method="get">
                            <div class="block">
                                <label for="description">Description:</label><input type="text" name="description" placeholder="description" />
                            </div>
                            <div class="block">
                                <label for="name">Name:</label><input type="text" name="name" placeholder="name" />
                            </div>
                            <div class="block">
                                <label for="pricebig">Price Big:</label>$<input type="number" name="pricebig" placeholder="pricebig" />
                            </div>
                            <div class="block">
                                <label for="pricemedium">Price Medium: </label>$<input type="number" min="0" name="pricemedium" placeholder="pricemedium" />
                            </div>
                            <div class="block">
                                <label for="pricesmall">Price Small:</label>$<input type="number" min="0" name="pricesmall" placeholder="pricesmall" />
                            </div>
                            <div class="block" id="componentRows">
                                <label for="component1">Component:</label><input type="text" min="0" name="component1" placeholder="component1" />
                                <label for="parts1">Parts:</label><input type="number" min="0" name="parts1" placeholder="parts1" />
                                <button id="mas" type="button" onclick="addRow()">+</button>
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
    
    <script type="text/javascript">
        <%
            int x=1;
        %>
        var x=<%=x%>;
        
    /*$("#mas").click(function{
        $("#componentRows").html("aaaaaa");
    });*/
        
        function addRow(){
            x++;
            <%x++;%>
            document.getElementById("componentRows").innerHTML += "<br>"+
                    "<label for=\"component"+x+"\">Component:</label>"+
                    "<input type=\"text\" min=\"0\" name=\"component"+x+"\" placeholder=\"component"+x+"\"/> "+
                    "<label for=\"parts"+x+"\">Parts:</label>"+
                    "<input type=\"number\" min=\"0\" name=\"parts"+x+"\" placeholder=\"parts"+x+"\"/>"
            ;
            <%
                session.setAttribute("numberComponents",x);
            %>
        }
    </script>
</body>
</html>
