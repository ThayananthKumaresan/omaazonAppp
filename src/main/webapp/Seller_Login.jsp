<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>

<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
	<!--Bootsrap 4 CDN-->
	<script src="https://code.jquery.com/jquery-3.5.1.js" charset="utf-8"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css"></style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <style>

@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 470px;
margin-top: auto;
margin-bottom: auto;
width: 600px;
background-color: rgba(0,0,0,1) !important;
padding-top:50px;
border-radius:40px;
  border-bottom: 10px solid #9F6899FF;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #7f5feb;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h2{
    text-align:center;
color: white;

}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}



input[type = "text"],input[type = "password"] {
  display: block;
  margin: 20px auto;
  background: #262e49;
  border: 0;
  border-radius: 5px;
  padding: 14px 10px;
  width: 320px;
  outline: none;
  color: #d6d6d6;
  text-align:center;

}

input[type=text]:focus, input[type=password]:focus {
  width: 350px;
  border: 2px solid;
  background:black;
}


.card-header h2 span {
  color: #7f5feb;
  font-weight:bolder;
}

.btn1 {
  border:0;
  background: #7f5feb;
  color: #dfdeee;
  border-radius: 100px;
  width: 140px;
  height: 49px;
  font-size: 16px;
  position: absolute;
  top: 65%;
  left: 35%;
  transition: 0.3s;
  cursor: pointer;
}

.btn1:hover {
  background: #5d33e6;
}

.links{
color: white;
}

 a{
    text-decoration:none;
margin-left: 4px;
color: white;
}
    </style>
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h2>WELCOME BACK, <span>Seller</span> !</h2>
				<div class="d-flex justify-content-end social_icon">
                <a href="#"><span><i class="fab fa-facebook-square"></i></span></a>
                <a href="https://www.google.com/gmail/"><span><i class="fab fa-google-plus-square"></i></span></a>
                <a href="https://trytestcubakl.000webhostapp.com/admin/index.php"><span><i class="fa fa-globe" aria-hidden="true"></i></span></a>
				</div>
			</div>
			<div class="card-body">
				<form id="seller-login-form" action="LoginServlet" method="post">
						<input type="text" name="Seller_Username" id="Seller_Username" class="form-control" placeholder="username" required>
						
						<input type="password" name="Seller_Password" id="Seller_Password"class="form-control" placeholder="password" required>
                    
                        <button type="submit" name="LoginBtn"  class="btn1">Login</button>
				</form>
			</div>
		</div>
	</div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script >
    $ (document).ready (function (e) {
        $ ("#seller-login-form").on ("submit", function (event) {

            event.preventDefault ();
            var form = {
                password: $("#Seller_Password").val(),
                email: $("#Seller_Username").val(),
				userRole: "seller"
			};

            $. ajax ({
                url: "LoginServlet",
                type: 'POST',
                data: form,
                success : function (data ,textStatus,jqXHR){
                    console.log(data);
                    if(data.trim() == 'unsuccessful')
                        swal('Invalid Username/Password entered!', 'Please check your credentials again !', 'error');
                    else
                    {
                        swal({
                            icon: 'success',
                            title: 'Omazon Welcomes You !',
                            html: 'Welcome back !',
                            timer: 5000,
                            timerProgressBar: true,
                            didOpen: () => {
                                Swal.showLoading()
                                timerInterval = setInterval(() => {
                                    const content = Swal.getContent()
                                    if (content) {
                                        const b = content.querySelector('b')
                                        if (b) {
                                            b.textContent = Swal.getTimerLeft()
                                        }
                                    }
                                }, 100)
                            }
                        }).then(function() {
                            window.location.replace('Seller_Dashboard.jsp');
                        });


                    }

                }
            })
        })
    })


</script>
</body>
</html>

