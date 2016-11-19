<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Add a Bottle</title>
    <link rel="stylesheet" href="assets/bootstrap.css">
    <link rel="stylesheet" href="css/app.css">
    <!--[if IE]>
    <script src="assets/ie.js"></script>
    <![endif]-->
    <script src="assets/jquery.min.js"></script>
    <script src="assets/jquery-ui.min.js"></script>
    <script type="text/javascript">
        var script=document.createElement('script'),
                url = ((window.location.protocol == 'file:') ? "http:" : window.location.protocol) + "//api.backendless.com/sdk/js/latest/backendless.min.js";
        script.setAttribute('src',url);
        document.head.appendChild(script);
    </script>
</head>
<body>
<div class="container">
    <div class="form login span12">
        <div class="appLogin">
            <h5>Add a Drink</h5>
            
            <form action="bottleadded.jsp" method="get">
                <div class="block">
                    <label for="name">Name:</label><input type="text" name="name" placeholder="name" />
                </div>
                <div class="block">
                    <label for="type">Alcohol Type:</label><input type="text" name="type" placeholder="alcohol type" />
                </div>
                <div class="block">
                    <label for="mililiters">Mililiters:</label><input type="number" name="mililiters" placeholder="mililiters" />
                </div>
                <div class="block">
                    <label for="cost">Cost:</label>$<input type="number" min="0" name="cost" placeholder="cost" />
                </div>
                <div class="btns">
                    <input type="submit" value="Submit" />
                </div>
            </form>
</div>
<script src="js/zepto.js"></script>
<script src="js/app.js"></script>
</body>
</html>
