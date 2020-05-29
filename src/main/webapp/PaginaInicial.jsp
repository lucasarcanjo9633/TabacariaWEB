<%-- 
    Document   : PaginaInicial
    Created on : 12/03/2020, 21:56:13
    Author     : Ochaus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AlinhamentoButton.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">      
        <link href="https://getbootstrap.com.br/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com.br/docs/4.1/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>');</script>
        <script src="https://getbootstrap.com.br/docs/4.1/assets/js/vendor/popper.min.js"></script>
        <script src="https://getbootstrap.com.br/docs/4.1/dist/js/bootstrap.min.js"></script>
        <title>Pagina Inicial</title>       
    </head>
    <body>
    <c:choose>
        <c:when test="${sessionScope.usuario != null}">
            <nav class="navbar navbar-expand-md navbar-dark fixed-top btn-primary">
                <a class="navbar-brand">Tabacaria</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/PaginaInicial.jsp">Home <span class="sr-only">(atual)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/LogoutController">Sair</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main role="main" class="container">
                <c:if test="${sessionScope.usuario.verificarPapel('USUARIO')}">
                <div class="jumbotron">
                    <h2>Usuários</h2>
                    <p class="lead"> Cadastrar, consultar, inativar ou editar usuarios. </p>
                    <form action="${pageContext.request.contextPath}/UsuarioController" method="get">
                        <input type="hidden" value="listar" name="acao">
                        <button class="btn btn-primary" type="submit" class="btn btn-primary">Acessar &raquo</button>
                    </form> 
                </div>
                </c:if> 
                <c:if test="${sessionScope.usuario.verificarPapel('PRODUTO')}"> 
                <div class="jumbotron">
                    <h2>Produto</h2>
                    <p class="lead"> Cadastrar, consultar, inativar ou editar produtos. </p>
                    <form action="${pageContext.request.contextPath}/ProdutoController" method="get">
                        <input type="hidden" value="listar" name="acao">
                        <button class="btn btn-primary" type="submit" class="btn btn-primary">Acessar &raquo</button>
                    </form> 
                </div>
                </c:if>
                <c:if test="${sessionScope.usuario.verificarPapel('ESTOQUE')}">
                <div class="jumbotron">
                    <h2>Estoque</h2>
                    <p class="lead"> Consultar ou adicionar produtos ao estoque. </p>
                    <form action="${pageContext.request.contextPath}/EstoqueController" method="get">
                        <input type="hidden" value="listar" name="acao">
                        <button class="btn btn-primary" type="submit" class="btn btn-primary">Acessar &raquo</button>
                    </form> 
                </div>
                </c:if>
                <c:if test="${sessionScope.usuario.verificarPapel('ESTOQUE')}">
                <div class="jumbotron">
                    <h2>Pedidos</h2>
                    <p class="lead"> Consultar ou alterar status do pedido. </p>
                    <form action="${pageContext.request.contextPath}/VendaController" method="get">
                        <input type="hidden" value="todosPedidos" name="acao">
                        <button class="btn btn-primary" type="submit" class="btn btn-primary">Acessar &raquo</button>
                    </form> 
                </div>
                </c:if>
                <div class="jumbotron">
                    <h2>Web Site</h2>
                    <p class="lead"> Em desenvolvimento. </p>
                    <form action="${pageContext.request.contextPath}/ProdutoController" method="get">
                        <input type="hidden" value="listarWeb" name="acao">
                        <button class="btn btn-primary" type="submit" class="btn btn-primary">Acessar &raquo</button>
                    </form> 
                </div>                                                     
            </main>       
        </c:when>
        <c:otherwise>
            <div>
                <h1 style="text-align: center; color: red;">Sessão Encerrada!</h1>
                <div class="posicao">           
                    <div class="buttonBack">
                        <form action="${pageContext.request.contextPath}/Login.jsp">
                            <button class="btn btn-primary" type="submit">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</html>
