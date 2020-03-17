<%-- 
    Document   : WebDetalheProduto
    Created on : 17/03/2020, 11:11:59
    Author     : Ochaus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
    <c:forEach items="${TodosProdutos}" var="p">
        <h2>${p.nome}</h2>
        <img src="imagens/${p.img}.jpg" width="150px" height="150px">
        <p>Valor: ${p.valor}</p>
        <p>Descrição: ${p.desc}</p>
    </c:forEach>
    </body>
</html>
