<%-- 
    Document   : WebDetalheProduto
    Created on : 17/03/2020, 11:11:59
    Author     : Ochaus
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabacaria TADS</title>

        <%--nav bar--%> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>       
        <script src="https://getbootstrap.com.br/docs/4.1/dist/js/bootstrap.min.js"></script>

        <%--produto corpo--%>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/PaginaInicial.css" />

        <%--list grig --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/list-grid.css" />
        <script>
            $(document).ready(function () {
                $('#list').click(function (event) {
                    event.preventDefault();
                    $('#products .item').addClass('list-group-item');
                });
                $('#grid').click(function (event) {
                    event.preventDefault();
                    $('#products .item').removeClass('list-group-item');
                    $('#products .item').addClass('grid-group-item');
                });
            });
        </script>
    </head>
    <body>

        <div>
            <nav class="navbar navbar-expand-md navbar-dark btn-primary">
                <a class="navbar-brand" href="#">Tabacaria-TADS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse" style="padding-left: 13.5%">
                    <ul class="navbar-nav mr-auto">                   
                        <li class="nav-item">
                            <a class="nav-link" href="#">NARGUILES</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">QUEIMADORES</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">PRATOS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">MANGUEIRAS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">BASES</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">CARVÕES</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">ACESSÓRIOS</a>
                        </li>                        
                    </ul>
                </div>
            </nav>
        </div>        
        <main role="main" style="margin-top: 3px;">
            <div>
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active" style="border: 1px solid darkgray;"></li>
                        <li data-target="#myCarousel" data-slide-to="1" style="border: 1px solid darkgray;"></li>
                        <li data-target="#myCarousel" data-slide-to="2" style="border: 1px solid darkgray;"></li>
                        <li data-target="#myCarousel" data-slide-to="3" style="border: 1px solid darkgray;"></li>
                    </ol>
                    <div class="carousel-inner">
                        <c:forEach items="${TodosProdutos}" var="p" end="0">
                            <div class="carousel-item active" style=" height: 350px;">                           
                                <div style="text-align: center;">
                                    <img class="first-slide" src="https://images.tcdn.com.br/img/img_prod/613031/1577485382_tabacaria_da_mata_b2.jpg" width="1400px" height="350px;" alt="Banner">                                    
                                </div>
                            </div>
                        </c:forEach>
                        <c:forEach items="${TodosProdutos}" var="p" begin="1" end="3">
                            <div class="carousel-item" style=" height: 350px;">
                                <div style="text-align: center;">
                                    <img class="second-slide" src="https://via.placeholder.com/1400x350.png?text=Banner+Image" width="1400px" height="350px;" alt="Banner">
                                </div>
                            </div>
                        </c:forEach>                       
                    </div>
                    <div>
                        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: black; border-radius: 10px;"></span>
                            <span class="sr-only">Voltar</span>
                        </a>
                    </div>
                    <div>
                        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: black; border-radius: 10px;"></span>
                            <span class="sr-only">Avançar</span>
                        </a>
                    </div>
                </div>
            </div>
            <h2 style="text-align: center; color: darkgrey">-----------DESTAQUES-----------</h2>
            <div class="container" >
                <div class="row">
                    <div class="col-lg-12 my-3">
                        <div class="pull-right">
                            <div class="btn-group">
                                <button class="btn btn-primary" id="list">
                                    List View
                                </button>
                                <button class="btn btn-danger" id="grid">
                                    Grid View
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="products" class="row view-group" style="text-align: left;" >
                    <c:forEach items="${TodosProdutos}" var="p" end="5">
                       
                        <div class="item col-xs-4 col-lg-4">
                            <form action="${pageContext.request.contextPath}/ProdutoController" method="get">                                
                                <input type="hidden" value="listarWebDetalhe" name="acao">
                                <input type="hidden" value="${p.id}" name="id">
                                    <div class="thumbnail card" style="border-radius: 5px; border-color: fuchsia;  width: 100%;">
                                        <div class="img-event">
                                            <img class="group list-group-image img-fluid" src="imagens/${p.img}.jpg" width="250px" height="400px" alt="Imagem do Produto" />
                                        </div>
                                        <div class="caption card-body">
                                            <h4 class="group card-title inner list-group-item-heading color-title-produto">
                                                ${p.nome}</h4>
                                            <p class="group inner list-group-item-text color-desc-produto">
                                                ${p.desc}.</p>
                                            <div class="row">
                                                <div class="col-xs-12 col-md-6">
                                                    <p class="lead color-valor-produto">
                                                        R$: ${p.valor}</p>
                                                </div>
                                                <div class="col-xs-12 col-md-6">
                                                    <input class="btn btn-success" id="confirmar"type="submit" value="Detalhes">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </input>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <footer class="text-center text-small" style="background-color: 	#007bff;">

                <div style="padding-top: 10px; padding-bottom: 5px;">
                    <p class="mb-1">&copy; 2020 Tabacaria - TADS</p>
                    <ul class="list-inline">
                        <li class="list-inline-item"><a href="#"><img src="imagens/facebook.png"></a></li>
                        <li class="list-inline-item"><a href="#"><img src="imagens/twitter.png"></a></li>
                        <li class="list-inline-item"><a href="#"><img src="imagens/instagram.png"></a></li>
                    </ul>
                </div>
            </footer>
        </main>
    </body>
</html>
