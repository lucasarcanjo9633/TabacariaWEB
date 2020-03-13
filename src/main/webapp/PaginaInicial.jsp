<%-- 
    Document   : PaginaInicial
    Created on : 12/03/2020, 21:56:13
    Author     : Ochaus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <a href="${pageContext.request.contextPath}/ProdutoController">Produto</a>
        <form action="${pageContext.request.contextPath}/ProdutoController?acao=" method="get">
            <input type="hidden" name="acao" value="listar">
            <button class="campoVoltar" type="submit">Login</button>
        </form>
    </body>
</html>
