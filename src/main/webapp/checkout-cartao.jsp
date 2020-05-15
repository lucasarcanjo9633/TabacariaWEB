<%-- 
    Document   : checkout-cartao
    Created on : 11/05/2020, 20:07:49
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

        <script type="text/javascript" >

            function onlynumber(evt) {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                //var regex = /^[0-9.,]+$/;
                var regex = /^[0-9]+$/;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }


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

<!-- Start Checkout -->
<section class="shop checkout section">
    <div class="container">
        <form action="${pageContext.request.contextPath}/CarrinhoController" method="post">
            <input type="hidden" name="acao" value="pagamento"> 
            <div class="row"> 
                <div class="col-lg-8 col-12">
                    <div class="checkout-form">
                        <h2>Finalize sua compra</h2>
                        <p>Confirme os dados do cartão</p>
                        <!-- Form -->
                        <!--<form class="form" method="post" action="#">-->
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Número do Cartão<span>*</span></label>
                                    <input type="text" name="numero" placeholder="" required="required" onkeypress="return onlynumber()">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Código de Segurança<span>*</span></label>
                                    <input type="number" name="number" placeholder="" required="required" onkeypress="return onlynumber()">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Mês de Validade<span>*</span></label>
                                    <select name="mes" id="mes">                 
                                        <option value="company" selected="selected">01</option>
                                        <option>02</option>
                                        <option>03</option>
                                        <option>04</option>
                                        <option>05</option>
                                        <option>06</option>
                                        <option>07</option>
                                        <option>08</option>
                                        <option>09</option>
                                        <option>10</option>
                                        <option>11</option>
                                        <option>12</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Ano de Validade<span>*</span></label>
                                    <select name="ano" id="ano">
                                        <option value="ano" selected="selected">2020</option>
                                        <option>2021</option>
                                        <option>2022</option>
                                        <option>2023</option>
                                        <option>2024</option>
                                        <option>2025</option>
                                        <option>2026</option>
                                        <option>2027</option>
                                        <option>2028</option>
                                        <option>2029</option>
                                        <option>2030</option>
                                    </select>
                                </div>
                            </div>                           
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Nome do Titular<span>*</span></label>
                                    <input name="nome" id="nome" type="text" placeholder="">
                                </div>	
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Parcelas<span>*</span></label>
                                    <select name="parcela" id="parcela">
                                        <option value="parcela" selected="selected">1 x ${precoFinal() / 1}</option>
                                        <option>2 x ${precoFinal() / 2}</option>
                                        <option>3 x ${precoFinal() / 3}</option>
                                        <option>4 x ${precoFinal() / 4}</option>
                                        <option>5 x ${precoFinal() / 5}</option>
                                    </select>
                                </div>

                            </div>                           
                        </div>
                        <!--</form> -->
                        <!--/ End Form -->
                    </div>
                </div>

                <div class="col-lg-4 col-12">
                    <div class="order-details">
                        <!-- Order Widget -->
                        <div class="single-widget">
                            <h2>TOTAL DO CARRINHO</h2>
                            <div class="content">
                                <ul>
                                    <li>Sub Total<span>${precoFinal()-20}</span></li>
                                    <li>(+) Frete<span>$20.00</span></li>
                                    <li class="last">Total<span>${precoFinal()}</span></li>
                                </ul>
                            </div>
                        </div>
                        <!--/ End Order Widget -->
                        <!-- Payment Method Widget -->
                        <div class="single-widget payement">
                            <div class="content">
                                <img src="images/payment-method.png" alt="#">
                            </div>
                        </div>
                        <!--/ End Payment Method Widget -->
                        <!-- Button Widget -->
                        <div class="single-widget get-button">
                            <div class="content">
                                <div class="button">
                                    <button class="btn">Finalizar a Compra<button></a>
                                            </div>
                                            </div>
                                            </div>
                                            <!--/ End Button Widget -->
                                            </div>
                                            </div>
                                            </div>
                                            </form>
                                            </div>
                                            </section>
                                            </form>
                                            <!--/ End Checkout -->

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