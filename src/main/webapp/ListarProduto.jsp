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
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
        <title>Lista Produtos</title>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </head>
    <body>
        <div>
            <h2 style="text-align: center;">Lista de Produtos</h2>
        </div>               

        <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%;">
                <thead>
                    <tr>
                        <th>Cod.</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Palavra Chave</th>
                        <th>Imagem</th>
                        <th>Editar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${TodosProdutos}" var="p">
                        <tr>                       
                            <td>${p.id}</td>              
                            <td>${p.nome}</td>               
                            <td>${p.desc}</td>
                            <td>${p.pChave}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/ProdutoController" method="get" >
                                    <input type="hidden" name="acao" value="visualizar">
                                    <input type="hidden" name="img" value="${p.img}">
                                    <input class="btn btn-primary" type="submit" value="Visalizar imagem" />
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
                                <form action="${pageContext.request.contextPath}/ProdutoController" method="post">
                                    <input type="hidden" value="excluir" name="acao">
                                    <input type="hidden" value="${p.id}" name="id">
                                    <button class="btn btn-primary" type="submit">Excluir</button>                                    
                                </form>
                            </td>                            
                        </tr>
                    </c:forEach>
                </tbody>                
            </table>       

        </div>
        <div>           
            <div style="text-align: center; display: inline;"> 
                <div style="display: flex;">
                    <form action="${pageContext.request.contextPath}/ProdutoController" method="get">
                        <input type="hidden" value="cadastrar" name="acao">
                        <button class="btn btn-primary" type="submit">Cadastrar
                        <span class = "glyphicon glyphicon-send"></span>
                        </button>
                    </form>
                </div>
                <div>
                    <form action="${pageContext.request.contextPath}/PaginaInicial.jsp">
                        <button class="btn btn-primary" type="submit" class="btn btn-primary">Voltar
                            <span class = "glyphicon glyphicon-arrow-left"></span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>