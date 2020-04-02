<%-- 
    Document   : ListarEstoque
    Created on : 13/03/2020, 10:03:58
    Author     : Igor Lima
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"/>
        <link href="https://getbootstrap.com.br/docs/4.1/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>              
        <script src="https://getbootstrap.com.br/docs/4.1/dist/js/bootstrap.min.js"></script>        
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

        <title>Lista Usuários</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top btn-primary" >
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
                        <a class="nav-link" href="#">Sair</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div>
            <h2 style="text-align: center;">Lista de Produtos</h2>
        </div>               

        <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%;">
                <thead>
                    <tr>
                        <th>Cod.</th>
                        <th>Login</th>
                        <th>Nome</th>
                        <th>Status</th>
                        <th>Modulo</th>
                        <th>Editar</th>
                        <th>Ativar / Desativar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${TodosUsuarios}" var="user">
                        <tr>                       
                            <td>${user.idPessoa}</td>              
                            <td>${user.username}</td>
                            <td>${user.nomeCompleto}</td>
                            <td> 
                                <c:choose>
                                    <c:when test="${user.status == true}">
                                        <img src="icones/ativado.png" style="height: 20px; width: 20px; text-align: center;">
                                    </c:when>
                                    <c:when test="${user.status == false}">
                                        <img src="icones/desativado.png" style="height: 20px; width: 20px; text-align: center;">
                                    </c:when>
                                </c:choose>
                            </td>
                            <td> 
                                <c:forEach items="${user.modulos}" var="modulo" > 
                                    <c:out value="${modulo.nomeModulo}"></c:out><br>
                                </c:forEach></td> 
                            </td>                           
                            <td> 
                                <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
                                    <input type="hidden" value="editar" name="acao">
                                    <input type="hidden" value="${user.idPessoa}" name="idPessoa">
                                    <input type="hidden" value="${user.nomeCompleto}" name="nomeCompleto">
                                    <input type="hidden" value="${user.modulos}" name="modulos">                                   
                                    <input type="hidden" value="${user.cpf}" name="cpf">
                                    <input type="hidden" value="${user.telefone}" name="telefone">
                                    <button class="btn btn-primary" type="submit">Editar</button>
                                </form>                            
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
                                    <input type="hidden" value="excluir" name="acao">
                                    <input type="hidden" value="${user.status}" name="status">
                                    <input type="hidden" value="${user.idPessoa}" name="id">
                                    <button class="btn btn-primary" type="submit">Ativ/Desa</button>                                    
                                </form>                                
                            </td>                                
                        </tr>
                    </c:forEach>
                </tbody>                
            </table>       
        </div>
        <div>           
            <div style="text-align: center; display: inline;"> 
                <div>
                    <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
                        <input type="hidden" value="cadastrar" name="acao">
                        <button class="btn btn-primary" type="submit">Cadastrar</button>
                    </form>
                </div>
                <div style="margin-top: 8px;">
                    <form action="${pageContext.request.contextPath}/PaginaInicial.jsp">
                        <button class="btn btn-primary" type="submit" class="btn btn-primary">Voltar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
