<%-- 
    Document   : pedidos
    Created on : 11/05/2020, 17:14:48
    Author     : Ochaus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Ochaus the Louge</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- StyleSheet -->

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="css/niceselect.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Flex Slider CSS -->
        <link rel="stylesheet" href="css/flex-slider.min.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl-carousel.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="css/slicknav.min.css">

        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <script>
            $('.carousel').carousel();
        </script>       

    </head>
    <body class="js">

        <c:if test="${message != null}">
            <script>
                alert("${message}");
            </script>
        </c:if>

        <!-- Header -->
        <header class="header shop">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-12">
                            <!-- Top Left -->
                            <div class="top-left">
                                <ul class="list-main">
                                    <li><i class="ti-email"></i>suporte@ochaus-lounge.com</li>
                                </ul>
                            </div>
                            <!--/ End Top Left -->
                        </div>
                        <div class="col-lg-8 col-md-12 col-12">
                            <!-- Top Right -->
                            <div class="right-content" style=" margin-right: 50px; margin-left: auto;">

                                <c:choose>
                                    <c:when test="${sessionScope.cliente != null}">
                                        <ul class="nav" >
                                            <li><i class="ti-user" style="color:#F7941D;"></i> ${sessionScope.cliente.nome}<i class="ti-angle-down"></i>
                                                <ul class="dropdown">
                                                    <li>
                                                        <form name="perfil" id="perfil" action="${pageContext.request.contextPath}/ClienteController" method="post">
                                                            <input type="hidden" name="acao" value="perfil">
                                                            <input type="hidden" name="idCliente" value="${sessionScope.cliente.idCliente}">
                                                            <a href="javascript:perfil.submit()">Perfil</a>
                                                        </form>
                                                    </li>
                                                    <li>
                                                        <form name="perfilSenha" id="perfilSenha" action="${pageContext.request.contextPath}/ClienteController" method="post">
                                                            <input type="hidden" name="acao" value="perfilSenha">
                                                            <input type="hidden" name="idCliente" value="${sessionScope.cliente.idCliente}">
                                                            <a href="javascript:perfilSenha.submit()">Alterar Senha</a>
                                                        </form>
                                                    </li>
                                                    <li><a href="#">Checkout</a></li>
                                                    <li><a href="#">Carrinho</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/LogoutClienteController">Sair</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </c:when>
                                    <c:otherwise>
                                        <ul class="nav">
                                            <li><i class="ti-user" style="color:#F7941D;"></i> Login <i class="ti-angle-down"></i>
                                                <ul class="dropdown">
                                                    <li><a href="loginWeb.jsp">Login</a></li>
                                                    <li><a href="cadastroWeb.jsp">Cadastre-se</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </c:otherwise>
                                </c:choose>
                            </div>     
                            <!-- End Top Right -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/ProdutoController?acao=listarWeb"><img src="images/logo.png" alt="logo"></a>
                            </div>
                            <!--/ End Logo -->
                            <!-- Search Form -->
                            <div class="search-top">
                                <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                                <!-- Search Form -->
                                <div class="search-top">
                                    <form class="search-form">
                                        <input type="text" placeholder="O que procura ?" name="search">
                                        <button value="search" type="submit"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">                                    
                                    <form>
                                        <input name="search" placeholder="O que você está procurando ?" type="search">
                                        <button class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- CARRINHO-->


                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->
                                <div class="sinlge-bar">
                                    <a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                </div>
                                <div class="sinlge-bar">
                                    <a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                </div>
                                <div class="sinlge-bar shopping">

                                    <c:choose>
                                        <c:when test="${sessionScope.itensSelecionados != null}">

                                            <a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">${sessionScope.itensSelecionados.quantidadeItem()}</span></a>
                                            <!-- Shopping Item -->
                                            <div class="shopping-item">
                                                <div class="dropdown-cart-header">
                                                    <span>${sessionScope.itensSelecionados.quantidadeItem()} Item</span>
                                                    <form name="carrinho" id="carrinho" action="${pageContext.request.contextPath}/CarrinhoController" method="post">
                                                        <a href="javascript:carrinho.submit()">View Cart</a>
                                                    </form>
                                                </div>
                                                <ul class="shopping-list">
                                                    <c:forEach items="${sessionScope.itensSelecionados.itens}" var="p">
                                                        <li>
                                                            <form name="remover" id="remover" action="${pageContext.request.contextPath}/CarrinhoController" method="post">
                                                                <button class="remove" title="Remover item"><i class="fa fa-remove"></i></button>
                                                                <!--<a href="javascript:remover.submit()" class="remove" title="Remover item"><i class="fa fa-remove"></i></a>-->
                                                                <input type="hidden" name="acao" value="retirarProduto">
                                                                <input type="hidden" name="pagina" value="carrinho">
                                                                <input type="hidden" name="idProduto" value="${p.p.id}">
                                                                <a href="${pageContext.request.contextPath}/ProdutoController?acao=listarWebDetalhe&id=${p.p.id}" class="cart-img">
                                                                    <img src="imagens/${p.p.id}.jpg" alt="${p.p.nome}">
                                                                </a>
                                                                <!--<a class="cart-img" href="#"><img src="imagens/${p.p.id}.jpg" alt="${p.p.nome}"></a>-->
                                                                <h4><a href="#">${p.p.getNome()}</a></h4>
                                                                <p class="quantity">${p.qtd}x - <span class="amount">${p.p.valor}</span></p>
                                                            </form>

                                                        </li>


                                                    </c:forEach>
                                                </ul>
                                                <div class="bottom">
                                                    <div class="total">
                                                        <span>Total:</span>
                                                        <span class="total-amount">RS ${sessionScope.itensSelecionados.getPrecoFinal()}</span>
                                                    </div>
                                                    <a href="checkout.html" class="btn animate">Checkout</a>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">0</span></a>
                                        </c:otherwise>

                                    </c:choose>


                                    <!--/ End Shopping Item -->
                                </div>
                            </div>
                        </div>
                        <!-- TERMINO CARRINHO-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Inner -->
    <div class="header-inner">
        <div class="container">
            <div class="cat-nav-head">
                <div class="row">                            
                    <div class="col-lg-9 col-12">
                        <div class="menu-area">
                            <!-- Main Menu -->
                            <nav class="navbar navbar-expand-lg">
                                <div class="navbar-collapse">	
                                    <div class="nav-inner">	
                                        <ul class="nav main-menu menu navbar-nav">
                                            <li class="active"><a href="#">Home</a></li>
                                            <li><a href="#">Narguiles</a></li>												
                                            <li><a href="#">Queimadores</a></li>                                                   
                                            <li><a href="#">Pratos</a></li>
                                            <li><a href="#">Mangueiras</a></li>
                                            <li><a href="#">Bases</a></li>
                                            <li><a href="#">Carvões</a></li>
                                            <li><a href="#">Acessórios</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!--/ End Main Menu -->	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ End Header Inner -->
</header>
<!--/ End Header -->
<!-- Shopping Cart -->
<div class="shopping-cart section">
    <div class="container" style="border-width: 3px; border-style: solid; border-color: #F7941D;">      
        <hr>
        <h5>Pedido: ${Vendas.idVenda}</h5>
        <h5>Data: ${Vendas.dataVenda}</h5>
        <hr>
        <div class="container">
            <div class="row">                                      

                    <c:choose>
                        <c:when test="${Vendas.status == 'aguardando pagamento'}">
                            <div class="col" style="text-align: right;">Entregue</div>
                            <div class="col" style="text-align: left;">aguardando pagamento</div>
                            <div class="col-12">                   
                                <div class="progress">           
                                    <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${Vendas.status == 'pagamento rejeitado'}">
                            <div class="col" style="text-align: left;">pagamento rejeitado</div>
                            <div class="col" style="text-align: right;">Entregue</div>
                            <div class="col-12">                   
                                <div class="progress">           
                                    <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${Vendas.status == 'pagamento aprovado'}">
                            <div class="col" style="text-align: left;">pagamento aprovado</div>
                            <div class="col" style="text-align: right;">Entregue</div>
                            <div class="col-12">                   
                                <div class="progress">           
                                    <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${Vendas.status == 'aguardando retirada'}">
                            <div class="col" style="text-align: left;">aguardando retirada</div>
                            <div class="col" style="text-align: right;">Entregue</div>
                            <div class="col-12">                   
                                <div class="progress">           
                                    <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${Vendas.status == 'em transito'}">
                            <div class="col" style="text-align: left;">em transito</div>
                            <div class="col" style="text-align: right;">Entregue</div>
                            <div class="col-12">                   
                                <div class="progress">           
                                    <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col" style="text-align: right;">Entregue</div>
                            <div class="col-12">                   
                                <div class="progress">           
                                    <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
        </div>
        <hr>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Shopping Summery -->
                    <table class="table shopping-summery">
                        <thead>
                            <tr class="main-hading">
                                <th class="text-center">PRODUTO</th>
                                <th class="text-center">NOME</th>
                                <th class="text-center">PREÇO UNIT</th>
                                <th class="text-center">QUANTIDADE</th>
                                <th class="text-center">TOTAL</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${Itens}" var="p">
                                <tr>                       
                                    <td class="image text-center" data-title="Imagem">
                                        <a href="#">
                                            <img src="imagens/${p.p.img}.jpg" width="100px" height="100px" alt="">
                                        </a>
                                    </td>
                                    <td class="product-name text-center" data-title="Nome">${p.p.nome}</td>               
                                    <td class="price text-center" data-title="Preço">R$ ${p.preco}</td>
                                    <td class="qty text-center" data-title="Qauntidade">${p.qtd}</td>
                                    <td class="total-amount text-center" data-title="Total">R$ ${p.preco * p.qtd}</td>                                                      
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!--/ End Shopping Summery -->
                </div>
            </div>                        
        </div>
        <hr>
        <h5>Entrega</h5>
        <hr>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div>
                        <div class="row">                       
                            <div class="col-lg-4 col-md-7 col-12">
                                <div>
                                    <ul>
                                        <li>CEP: <span>${Vendas.endereco.CEP}</span></li>
                                        <li>Endereço: <span>${Vendas.endereco.endereco}</span></li>                                        
                                        <li>Bairro: <span>${Vendas.endereco.bairro}</span></li>
                                        <li>Cidade: <span>${Vendas.endereco.cidade}</span></li>
                                        <li>Estado: <span>${Vendas.endereco.UF}</span></li>                                      
                                    </ul>                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <h5>Pagamento</h5>
        <hr>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div>
                        <div class="row">                       
                            <div class="col-lg-4 col-md-7 col-12">
                                <div>
                                    <ul>                                     
                                        <li>Total a pagar: <span>R$ ${Vendas.precoFinal}</span></li>
                                        <li>Forma de Pagamento: <span>${Vendas.pagamento}</span></li>
                                    </ul>                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </div>
</div>
<!--/ End Shopping Cart -->
<!-- Start Footer Area -->
<footer class="footer">
    <!-- Footer Top -->
    <div class="footer-top section">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer about">
                        <div class="logo">
                            <a href="index.html"><img src="images/logo2.png" alt="#"></a>
                        </div>
                        <p class="text">Projeto desenvolvido para a disciplina "PROJETO INTEGRADOR IV: DESENVOLVIMENTO DE SISTEMAS ORIENTADO A WEB E DISPOSITIVOS MÓVEIS" do curso de TADS - 4º Semestre.</p>
                        <p class="call">Tem Perguntas ? Ligue.<span><a href="tel:123456789">4002-8922</a></span></p>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-2 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer links">
                        <h4>Informação</h4>
                        <ul>
                            <li><a href="#">Sobre</a></li>
                            <li><a href="#">Perguntas Frequentes</a></li>
                            <li><a href="#">Termos e Condições</a></li>
                            <li><a href="#">Contato</a></li>
                            <li><a href="#">Ajuda</a></li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>

                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer social">
                        <h4>Fale conosco</h4>
                        <!-- Single Widget -->
                        <div class="contact">
                            <ul>
                                <li>Centro Universitário Senac</li>
                                <li> Av. Eng. Eusébio Stevaux, 823 - Santo Amaro, São Paulo - SP</li>
                                <li>ochaus-lounge@tabacaria.com</li>
                                <li>+55 (11) 4002-8922</li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                        <ul>
                            <li><a href="#"><i class="ti-facebook"></i></a></li>
                            <li><a href="#"><i class="ti-twitter"></i></a></li>
                            <li><a href="#"><i class="ti-flickr"></i></a></li>
                            <li><a href="#"><i class="ti-instagram"></i></a></li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Top -->
    <div class="copyright">
        <div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <div class="left">
                            <p>Copyright © 2020 <a href="http://www.wpthemesgrid.com" target="_blank">Wpthemesgrid</a>  -  All Rights Reserved.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="right">
                            <img src="images/payments.png" alt="#">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- /End Footer Area -->

<!-- Jquery -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.0.js"></script>
<script src="js/jquery-ui.min.js"></script>
<!-- Popper JS -->
<script src="js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="js/bootstrap.min.js"></script>
<!-- Color JS -->
<script src="js/colors.js"></script>
<!-- Slicknav JS -->
<script src="js/slicknav.min.js"></script>
<!-- Owl Carousel JS -->
<script src="js/owl-carousel.js"></script>
<!-- Magnific Popup JS -->
<script src="js/magnific-popup.js"></script>
<!-- Waypoints JS -->
<script src="js/waypoints.min.js"></script>
<!-- Countdown JS -->
<script src="js/finalcountdown.min.js"></script>
<!-- Nice Select JS -->
<script src="js/nicesellect.js"></script>
<!-- Flex Slider JS -->
<script src="js/flex-slider.js"></script>
<!-- ScrollUp JS -->
<script src="js/scrollup.js"></script>
<!-- Onepage Nav JS -->
<script src="js/onepage-nav.min.js"></script>
<!-- Easing JS -->
<script src="js/easing.js"></script>
<!-- Active JS -->
<script src="js/active.js"></script>
</body>
</html>
