<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Registrazione nuovo utente</title>

  <!-- Bootstrap -->
  <link href="../../framework/css/bootstrap.min.css" rel="stylesheet">

  <!-- carica tutti i file css qui -->
  <link rel="stylesheet" href="signup.css">
  <link href="../../shared/header/header.css"  rel="stylesheet" type="text/css" />

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <%@ include file="../../shared/header/header.jsp" %>

  <div class="container">

      <div class="row">
          <div class="col-sm-8 col-sm-offset-2 text">
              <h1></h1>
          </div>
      </div>

      <div class="row">
          <div class="col-sm-5">
              <div class="form-box">
            <div class="form-top">
                <div class="form-top-left">
                    <h3>Login</h3>
                </div>
                <div class="form-top-right">
                    <i class="fa fa-lock"></i>
                </div>
            </div>
            <div class="form-bottom">
    <form role="form" action="" method="post" class="login-form">
                          <div class="form-group">
      <label class="sr-only" for="login-email">Email</label>
      <input id="login-email" type="email" name="login-email" placeholder="Email" class="login-email form-control" required>
                          </div>
                          <div class="form-group">
                              <label class="sr-only" for="login-password">Password</label>
      <input  id="form-password" type="password" name="login-password" placeholder="Password" class="login-password form-control">
                          </div>
                          <button type="submit" class="btn">Accedi</button>
    </form>
                  </div>
  </div>
          </div>

          <div class="col-sm-1 middle-border"></div>
          <div class="col-sm-1"></div>

          <div class="col-sm-5">
              <div class="form-box">
                  <div class="form-top">
                <div class="form-top-left">
                    <h3>Registrati</h3>
                </div>
                <div class="form-top-right">
                    <i class="fa fa-pencil"></i>
                </div>
            </div>
                  <div class="form-bottom">
    <form role="form" action="" method="post" class="registration-form">
                          <div class="form-group">
      <label class="sr-only" for="signup-first-name">Nome</label>
      <input id="signup-first-name" type="text" name="signup-first-name" placeholder="Nome" class="signup-first-name form-control" required>
                          </div>
                          <div class="form-group">
      <label class="sr-only" for="signup-last-name">Cognome</label>
      <input id="signup-last-name" type="text" name="signup-last-name" placeholder="Cognome" class="signup-last-name form-control" required>
                          </div>
                          <div class="form-group">
      <label class="sr-only" for="signup-email">Email</label>
      <input id="signup-email" type="email" name="signup-email" placeholder="Email" class="signup-email form-control" required>
                          </div>
                          <div class="form-group">
                              <label class="sr-only" for="password-email">Email</label>
      <input id="signup-password" type="password" name="signup-password" placeholder="Password" class="signup-password form-control" required>
                          </div>
                          <button type="submit" class="btn">Registrati ora</button>
    </form>
                  </div>
              </div>	<!-- form-box -->
          </div> <!-- col -->

      </div> <!-- row -->     
  </div> <!-- container -->

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../framework/js/bootstrap.min.js"></script>

  <!-- carica tutti gli script qui -->
  <script src="../../shared/header/header.js"></script>
</body>
</html>
