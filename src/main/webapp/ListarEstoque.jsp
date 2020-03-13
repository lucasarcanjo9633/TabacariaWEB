<%-- 
    Document   : ListarEstoque
    Created on : 13/03/2020, 10:03:58
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
                        <th>Nome</th>
                        <th>Preço</th>
                        <th>Quantidade</th>
                        <th>Adicionar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${TodosProdutos}" var="p">
                        <tr>                       
                            <td>${p.id}</td>              
                            <td>${p.nome}</td>               
                            <td>${p.valor}</td>
                            <td>${p.qtd}</td>                           
                            <td> 
                                <form action="${pageContext.request.contextPath}/EstoqueController" method="post">
                                    <input type="hidden" value="alterar" name="acao">
                                    <input type="hidden" value="${p.id}" name="id">
                                    <input type="hidden" value="${p.nome}" name="nome">
                                    <input type="hidden" value="${p.valor}" name="valor">                                   
                                    <input type="hidden" value="${p.desc}" name="descricao">
                                    <input type="hidden" value="${p.pChave}" name="pChave">
                                    <input type="hidden" value="${p.qtd}" name="pChave">
                                    <button class="btn btn-primary" type="submit">Adicionar</button>
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
                    <form action="${pageContext.request.contextPath}/PaginaInicial.jsp">
                        <button class="btn btn-primary" type="submit" class="btn btn-primary">Voltar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
