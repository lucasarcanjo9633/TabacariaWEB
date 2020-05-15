<%-- 
    Document   : enderecos
    Created on : 14/05/2020, 22:12:19
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

            function validacao() {
                var formulario = document.forms["form"];
                var nome = formulario.nome.value;
                var sobrenome = formulario.sobrenome.value;
                var rua = formulario.rua.value;
                var bairro = formulario.bairro.value;
                var cidade = formulario.cidade.value;
                var uf = formulario.uf.value;
                var email = formulario.email.value;
                var cpf = formulario.cpf.value;
                var cep = formulario.cep.value;
                var senha = formulario.senha.value;
                var confSenha = formulario.confSenha.value;

                if (nome.toString().trim().length < 3) {

                    alert("Nome inválido, preencha o campo corretamente.");
                    document.getElementById("nome").focus();
                    return false;
                }

                if (sobrenome.toString().trim().length < 3) {

                    alert("Sobrenome inválido, preencha o campo corretamente.");
                    document.getElementById("sobrenome").focus();
                    return false;
                }

                if (!validaCPF(cpf)) {

                    alert("CPF inválido, preencha o campo corretamente.");
                    document.getElementById("cpf").focus();
                    return false;
                }

                if (senha.toString().trim() == "" || senha.toString().trim() == null || senha.toString().trim().length < 8) {

                    alert("Senha inválido, preencha o campo corretamente.");
                    document.getElementById("senha").focus();
                    return false;
                }

                if (confSenha.toString().trim() == "" || confSenha.toString().trim() == null || confSenha.toString().trim().length < 8) {

                    alert("Confirmação de senha inválido, preencha o campo corretamente.");
                    document.getElementById("senha").focus();
                    return false;
                }

                if (senha.toString().trim() != confSenha.toString().trim()) {

                    alert("Senhas não correspondem, preencha os campos corretamente.");
                    document.getElementById("senha").focus();
                    return false;
                }

                if (rua.toString().trim() == "" || rua.toString().trim() == null || rua.toString().trim().length < 1) {

                    alert("Endereço inválido, preencha o campo corretamente.");
                    document.getElementById("rua").focus();
                    return false;
                }

                if (bairro.toString().trim() == "" || bairro.toString().trim() == null || bairro.toString().trim().length < 1) {

                    alert("Bairro inválido, preencha o campo corretamente.");
                    document.getElementById("bairro").focus();
                    return false;
                }

                if (cidade.toString().trim() == "" || cidade.toString().trim() == null || cidade.toString().trim().length < 1) {

                    alert("Cidade inválido, preencha o campo corretamente.");
                    document.getElementById("cidade").focus();
                    return false;
                }

                if (uf.toString().trim() == "" || uf.toString().trim() == null || uf.toString().trim().length < 1) {

                    alert("Estado inválido, preencha o campo corretamente.");
                    document.getElementById("uf").focus();
                    return false;
                }


            }


            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('uf').value = ("");
            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('uf').value = (conteudo.uf);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            }

            function pesquisacep(valor) {

                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('uf').value = "...";

                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }


        </script>

    </head>
    <body class="js">

        <!-- Preloader -->
        <div class="preloader">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- End Preloader -->

        <!-- Start Notificação -->

        <c:if test="${message != null}">
            <script>
        alert("${message}");
            </script>
        </c:if>
        <!-- End Notificação -->

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
                                    <a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">3</span></a>
                                    <!-- Shopping Item -->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span>3 Items</span>
                                            <a href="#">View Cart</a>
                                        </div>
                                        <ul class="shopping-list">
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Ring</a></h4>
                                                <p class="quantity">1x - <span class="amount">$99.00</span></p>
                                            </li>
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Necklace</a></h4>
                                                <p class="quantity">1x - <span class="amount">$35.00</span></p>
                                            </li>
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Necklace</a></h4>
                                                <p class="quantity">1x - <span class="amount">$35.00</span></p>
                                            </li>
                                        </ul>
                                        <div class="bottom">
                                            <div class="total">
                                                <span>Total</span>
                                                <span class="total-amount">$134.00</span>
                                            </div>
                                            <a href="checkout.html" class="btn animate">Checkout</a>
                                        </div>
                                    </div>
                                    <!--/ End Shopping Item -->
                                </div>
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

        <!-- Start Perfil -->
        <section id="contact-us" class="contact-us section">
            <div class="container">
                <div class="contact-head" >
                    <div class="row">
                        <div class="col-lg-12 col-12" style="margin-left: auto; margin-right: auto;">
                            <div class="form-main">
                                <div class="title">
                                    <h3>Cadastrar Endereco</h3>
                                    <br>
                                    <h5>${mensagemAttr}</h2>
                                </div>

                                <form class="form" name="form" method="post" action="${pageContext.request.contextPath}/EnderecoController" onsubmit=" return validacao();">
                                    <input type="hidden" name="acao" value="cadastrar">
                                    <input type="hidden" name="idCliente" value="${sessionScope.cliente.idCliente}">
                                    <div class="row">


                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>CEP<span>*</span></label>
                                                <input name="cep" id="cep" type="text" value="${cepAttr}" onblur="pesquisacep(this.value)" size="10" maxlength="9" placeholder="Ex: 01234567" onkeypress="return onlynumber()">
                                            </div>	
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>Endereço<span>*</span></label>
                                                <input name="rua" id="rua" type="text" value="${ruaAttr}" placeholder="Ex: Av. Eng. Eusébio Stevaux, 823">
                                            </div>	
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>Bairro<span>*</span></label>
                                                <input name="bairro" id="bairro" type="text" value="${bairroAttr}" placeholder="Ex: Jurubatuba">
                                            </div>	
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>Cidade:<span>*</span></label>
                                                <input name="cidade" id="cidade" type="text" value="${cidadeAttr}" placeholder="Ex: São Paulo">
                                            </div>	
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>Estado:<span>*</span></label>
                                                <input name="uf" id="uf" type="text" value="${estadoAttr}" placeholder="Ex: SP">
                                            </div>	
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group button">
                                                <button type="submit" class="btn ">Salvar</button>
                                            </div>
                                        </div>                                       
                                    </div>
                                </form>
                            </div>
                        </div>                    
                    </div>
                </div>
            </div>
        </section>
        <!--/ End Perfil -->

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
