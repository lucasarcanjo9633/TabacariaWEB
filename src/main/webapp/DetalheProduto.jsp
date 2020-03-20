<%-- 
    Document   : DetalheProduto
    Created on : 18/03/2020, 07:20:11
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

       
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/detalheproduto.css" />
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


            <div class="container">
                <br> 
                <div class="card">
                    <div class="row">
                        <aside class="col-sm-5 border-right">
                            <article class="gallery-wrap"> 
                                <div class="img-big-wrap">
                                    <div><img src="imagens/${imgAttr}.jpg" height="100%" width="100%" alt="Imagem do Produto"></div>
                                </div> <!-- slider-product.// -->                          
                            </article> <!-- gallery-wrap .end// -->
                        </aside>
                        <aside class="col-sm-7">
                            <article class="card-body p-5">
                                <h3 class="title mb-3">${nomeAttr}</h3>

                                <p class="price-detail-wrap"> 
                                    <span class="price h3 text-warning"> 
                                        <span class="currency">R$</span><span class="num">${valorAttr}</span>
                                    </span>                                     
                                </p> <!-- price-detail-wrap .// -->
                                <dl class="item-property">
                                    <dt>Descrição</dt>
                                    <dd><p>${descAttr}</p></dd>
                                </dl>                                                           
                                <hr>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <dl class="param param-inline">
                                            <dt>Quantidade: </dt>
                                            <dd>
                                                <input type="number" min="1" value="1" class="form-control form-control-sm" style="width:70px;">                                                    
                                            </dd>
                                        </dl>  <!-- item-property .// -->
                                    </div> <!-- col.// -->
                                    <!-- col.// -->
                                </div> <!-- row.// -->
                                <hr>
                                <a href="#" class="btn btn-lg btn-primary text-uppercase"> COMPRAR </a>
                                <a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i>ADD CARRINHO</a>
                            </article> <!-- card-body.// -->
                        </aside> <!-- col.// -->
                    </div> <!-- row.// -->
                </div> <!-- card.// -->


            </div>
            <!--container.//-->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2><b>Produtos em Destaque</b></h2>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
                            <!-- Carousel indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>   
                            <!-- Wrapper for carousel items -->
                            <div class="carousel-inner">
                                <div class="item carousel-item active">
                                    <div class="row">
                                        
                                        <c:forEach items="${TodosProdutos}" var="p" begin="0" end="3">
                                        <div class="col-sm-3">
                                            <div class="thumb-wrapper">
                                                <div class="img-box">
                                                    <img src="imagens/${p.img}.jpg" class="img-responsive img-fluid" alt="">
                                                </div>
                                                <div class="thumb-content">
                                                    <h4>${p.nome}</h4>
                                                    <p class="item-price"><span>R$ ${p.valor}</span></p>                                                   
                                                    <a href="#" class="btn btn-primary">Add Carrinho</a>
                                                </div>						
                                            </div>
                                        </div>
                                        </c:forEach>		                                       								
                                        
                                    </div>
                                </div>
                                <div class="item carousel-item">
                                    <div class="row">
                                        
                                        <c:forEach items="${TodosProdutos}" var="p" begin="4" end="7">
                                        <div class="col-sm-3">
                                            <div class="thumb-wrapper">
                                                <div class="img-box">
                                                    <img src="imagens/${p.img}.jpg" class="img-responsive img-fluid" alt="">
                                                </div>
                                                <div class="thumb-content">
                                                    <h4>${p.nome}</h4>
                                                    <p class="item-price"><span>R$ ${p.valor}</span></p>
                                                    <a href="#" class="btn btn-primary">ADD CARRINHO</a>
                                                </div>						
                                            </div>
                                        </div>
                                        </c:forEach>
                                        
                                    </div>
                                </div>
                                <div class="item carousel-item">
                                    <div class="row">
                                        
                                        <c:forEach items="${TodosProdutos}" var="p" begin="8" end="11">
                                        <div class="col-sm-3">
                                            <div class="thumb-wrapper">
                                                <div class="img-box">
                                                    <img src="imagens/${p.img}.jpg" class="img-responsive img-fluid" alt="">
                                                </div>
                                                <div class="thumb-content">
                                                    <h4>${p.nome}</h4>
                                                    <p class="item-price"><span>R$ ${p.valor}</span></p>
                                                    <a href="#" class="btn btn-primary">ADD CARRINHO</a>
                                                </div>						
                                            </div>
                                        </div>
                                        </c:forEach>
                                        
                                    </div>
                                </div>
                            </div>
                            <!-- Carousel controls -->
                            <a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Voltar</span>
                            </a>
                            <a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Avançar</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <br><br><br>
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
