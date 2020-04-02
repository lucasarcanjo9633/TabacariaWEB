<%-- 
    Document   : Login
    Created on : 13/03/2020, 09:30:44
    Author     : Ochaus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
        <link href="https://getbootstrap.com.br/docs/4.1/examples/sign-in/signin.css" rel="stylesheet">
        <link href="https://getbootstrap.com.br/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Login Sistema</title>
    </head>

    <body class="text-center">
        <form class="form-signin" action="${pageContext.request.contextPath}/LoginController" method="post">
            <img class="mb-4" src="https://i.pinimg.com/originals/e2/cb/4b/e2cb4bc56740dd0af40e3098f850e5fc.png" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Faça login</h1>
            <label for="inputEmail" class="sr-only">Endereço de email</label>
            <input type="text" id="inputEmail" name="login" class="form-control" placeholder="Login" required autofocus>
            <label for="inputPassword" class="sr-only">Senha</label>
            <input type="password" id="inputPassword" name="senha" class="form-control" placeholder="Senha" required>          
            <button class="btn btn-lg  btn-block btn-primary" type="submit" style="font-size: 15px;">Login</button>
            <p class="mt-5 mb-3 text-muted">Projeto-Tabacaria</p>
        </form>
    </body>
</html>
