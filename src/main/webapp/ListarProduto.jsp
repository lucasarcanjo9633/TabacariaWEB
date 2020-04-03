<%-- 
    Document   : ListarProduto
    Created on : 12/03/2020, 19:55:32
    Author     : Ochaus
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Produto"%>
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

        <title>Lista Produtos</title>
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
                        <th>Status</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Palavra Chave</th>
                        <th>Imagem</th>
                        <th>Editar</th>
                        <th>Ativar/Desativar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${TodosProdutos}" var="p">
                        <tr>                       
                            <td>${p.id}</td>
                            <td> 
                                <c:choose>
                                    <c:when test="${p.status == true}">
                                        <img src="icones/ativado.png" style="height: 20px; width: 20px; text-align: center;">
                                    </c:when>
                                    <c:when test="${p.status == false}">
                                        <img src="icones/desativado.png" style="height: 20px; width: 20px; text-align: center;">
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>${p.nome}</td>               
                            <td>${p.desc}</td>
                            <td>${p.pChave}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/ProdutoController" method="get" >
                                    <input type="hidden" name="acao" value="visualizar">
                                    <input type="hidden" name="img" value="${p.img}">
                                    <button class="btn btn-primary" type="submit">Visualizar</button>
                                </form>
                            </td>
                            <td> 
                                <form action="${pageContext.request.contextPath}/ProdutoController" method="post">
                                    <input type="hidden" value="alterar" name="acao">
                                    <input type="hidden" value="${p.id}" name="id">
                                    <input type="hidden" value="${p.nome}" name="nome">
                                    <input type="hidden" value="${p.valor}" name="valor">                                   
                                    <input type="hidden" value="${p.desc}" name="descricao">
                                    <input type="hidden" value="${p.pChave}" name="pChave">
                                    <button class="btn btn-primary" type="submit">Editar</button>
                                </form>                            
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/ProdutoController" method="post" onsubmit="return mensagem()">
                                    <input type="hidden" value="excluir" name="acao">
                                    <input type="hidden" value="${p.status}" name="status">
                                    <input type="hidden" value="${p.id}" name="id">
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
                    <form action="${pageContext.request.contextPath}/ProdutoController" method="get">
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