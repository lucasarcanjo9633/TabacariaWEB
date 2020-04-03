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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AlinhamentoButton.css" />
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

            function mensagem() {
                var name = confirm("Pressione o botão OK para exclusão.")
                if (name == true)
                {
                    alert("operação realizada")
                } else
                {
                    alert("operação cancelada")
                    return false;
                }
            }
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
            <h2 style="text-align: center;">Lista de Usuarios</h2>
        </div>               

        <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%;">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Status</th>
                        <th>Nome</th>
                        <th>Usuario</th>
                        <th>Modulos</th>
                        <th>Editar</th>
                        <th>Ativar/Desativar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${TodosUsuarios}" var="user">
                        <tr>                       
                            <td>${user.idPessoa}</td>
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
                            <td>${user.nomeCompleto}</td>              
                            <td>${user.username}</td>                       
                            <td>
                                <c:forEach items="${user.modulos}" var="modulo" > 
                                    <c:out value="${modulo.nomeModulo}"></c:out>
                                </c:forEach></td>                                              
                            <td> 
                                <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
                                    <c:forEach items="${user.modulos}" var="modulo" > 
                                        <input type="hidden" value="${modulo.id}" name="modulo">
                                    </c:forEach>
                                    <input type="hidden" value="editar" name="acao">
                                    <input type="hidden" value="${user.idPessoa}" name="id">
                                    <input type="hidden" value="${user.nomeCompleto}" name="nome">
                                    <input type="hidden" value="${user.cpf}" name="cpf">
                                    <input type="hidden" value="${user.telefone}" name="telefone">
                                    <input type="hidden" value="${user.username}" name="login">                                    
                                    <input type="hidden" value="${user.hashSenha}" name="senha">
                                    <button type="submit" class="btn btn-primary">Editar</button>
                                </form>                           
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
                                    <input type="hidden" value="excluir" name="acao">
                                    <input type="hidden" value="${user.status}" name="status">
                                    <input type="hidden" value="${user.idPessoa}" name="id">
                                    <button class="btn btn-primary" type="submit">
                                        <c:choose>
                                            <c:when test="${user.status == true}">
                                                Desativar
                                            </c:when>
                                            <c:when test="${user.status == false}">
                                                Ativar
                                            </c:when>
                                        </c:choose>
                                    </button>                                    
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>                
            </table>       
        </div>
        <div>           
            <div class="posicao"> 
                <div class="buttonCad">
                    <form action="${pageContext.request.contextPath}/UsuarioController" method="post">
                        <input type="hidden" value="cadastrar" name="acao">
                        <button style="width: 100px;" class="btn btn-primary" type="submit">Cadastrar</button>
                    </form>
                </div>
                <div class="buttonBack">
                    <form action="${pageContext.request.contextPath}/PaginaInicial.jsp">                        
                        <button style="width: 100px;" class="btn btn-primary" type="submit" class="btn btn-primary">Voltar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
