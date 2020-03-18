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

        <%--carrosel
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        
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
        --%>
    </head>
    <body>

        <div>
            <nav class="navbar navbar-expand-md navbar-dark btn-primary">
                <a class="navbar-brand" href="#">Tabacaria-TADS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse" >
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
        <%--        
        <div>
            <div id="main_area" >
                <!-- Slider -->
                <div class="row" >
                    <div class="col-xs-12"  id="slider">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-8" id="carousel-bounding-box" style="margin-left: auto; margin-right: auto;">
                                <div class="carousel slide" id="myCarousel" style="height: 300px;">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner" style="height: 300px;">
                                        <c:forEach items="${TodosProdutos}" var="p" end="0">
                                            <div class="active item img-event" data-slide-number="${p.id}" style="left: 35%; right: 35%;">
                                                <img src="imagens/${p.img}.jpg" width="300px" height="300px" alt="Imagem do Produto">
                                            </div>
                                        </c:forEach>
                                        <c:forEach items="${TodosProdutos}" var="p" end="3">
                                            <div class="item img-event" data-slide-number="${p.id}" style="left: 35%; right: 35%;">
                                                <img src="imagens/${p.img}.jpg" width="300px" height="300px" alt="Imagem do Produto">
                                            </div>
                                        </c:forEach>
                                    </div><!-- Carousel nav -->
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left "></span>                                       
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/Slider-->                
            </div>
        </div> --%>
        <main role="main">
            <div style="height: 300px;">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">                    
                    <div class="carousel-inner">
                        <c:forEach items="${TodosProdutos}" var="p" end="0">
                            <div class="carousel-item active" style=" height: 300px;">                           
                                <div class="container" style="text-align: center;">
                                    <img class="first-slide" src="imagens/${p.img}.jpg" width="300px;" height="300px;" alt="First slide">
                                    <div class="carousel-caption text-left" style="color: black;">
                                        <h1>${p.nome}</h1>
                                        <p>R$: ${p.valor}</p>                                    
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:forEach items="${TodosProdutos}" var="p" begin="1" end="3">
                            <div class="carousel-item" style="height: 300px;">

                                <div class="container" style="text-align: center;">
                                    <img class="second-slide" src="imagens/${p.img}.jpg" height="300px;" alt="Second slide">
                                    <div class="carousel-caption text-left" style="color: black;">
                                        <h1>${p.nome}</h1>
                                        <p>R$: ${p.valor}</p>                                    
                                    </div>
                                </div>
                            </div>
                        </c:forEach>                       
                    </div>
                    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: black;"></span>
                        <span class="sr-only">Voltar</span>
                    </a>
                    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: black;"></span>
                        <span class="sr-only">Avançar</span>
                    </a>
                </div>
            </div>
            <h2 style="text-align: center; color: darkgrey">-----------DESTAQUES-----------</h2>
            <div class="container" >
                <div id="products" class="row view-group" >
                    <c:forEach items="${TodosProdutos}" var="p">

                        <div class="item col-xs-4 col-lg-4">
                            <a href="#">
                                <div class="thumbnail card">
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; 2020 Tabacaria - TADS</p>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#"><img src="imagens/facebook.png"></a></li>
                    <li class="list-inline-item"><a href="#"><img src="imagens/twitter.png"></a></li>
                    <li class="list-inline-item"><a href="#"><img src="imagens/instagram.png"></a></li>
                </ul>
            </footer>
        </main>
    </body>
</html>
