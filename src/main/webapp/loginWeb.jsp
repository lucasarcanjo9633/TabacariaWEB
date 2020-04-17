<%-- 
    Document   : loginWeb
    Created on : 15/04/2020, 16:55:31
    Author     : Ochaus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <!-- Meta Tag -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name='copyright' content=''>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title Tag  -->
    <title>Ochaus the Lounge</title>
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

    <!-- Adicionando Javascript -->
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

            if (email.toString().indexOf("@") == -1 || email.toString().indexOf(".") == -1 || email.toString().trim() == "" || email.toString().trim() == null) {

                alert("Email inválido, preencha o campo corretamente.");
                document.getElementById("email").focus();
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

        function validaCPF(cpf)
        {

            var numeros, digitos, soma, i, resultado, digitos_iguais;
            digitos_iguais = 1;
            if (cpf.length < 11)
                return false;
            for (i = 0; i < cpf.length - 1; i++)
                if (cpf.charAt(i) != cpf.charAt(i + 1))
                {
                    digitos_iguais = 0;
                    break;
                }
            if (!digitos_iguais)
            {
                numeros = cpf.substring(0, 9);
                digitos = cpf.substring(9);
                soma = 0;
                for (i = 10; i > 1; i--)
                    soma += numeros.charAt(10 - i) * i;
                resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
                if (resultado != digitos.charAt(0))
                    return false;
                numeros = cpf.substring(0, 10);
                soma = 0;
                for (i = 11; i > 1; i--)
                    soma += numeros.charAt(11 - i) * i;
                resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
                if (resultado != digitos.charAt(1))
                    return false;
                return true;
            } else
                return false;
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



    <!-- Header -->
    <header class="header shop">        
        <div class="middle-inner" style="background: #333;">
            <div class="container" >
                <div class="row" >
                    <div class="col-lg-2 col-md-2 col-12">
                        <!-- Logo -->
                        <div>
                            <a href="${pageContext.request.contextPath}/ProdutoController?acao=listarWeb"><img src="images/logo.png" alt="logo"></a>
                        </div>
                        <!--/ End Logo -->
                        <div class="mobile-nav"></div>
                    </div>                 
                </div>
            </div>
        </div>
        <!-- Header Inner -->

        <!--/ End Header Inner -->
    </header>


    <!-- Start Contact -->
    <section id="contact-us" class="contact-us section">
        <div class="container">
            <div class="contact-head" style="pa" >
                <div class="row ">
                    <div class="col-lg-6 col-12" style="margin-left: auto; margin-right: auto;">
                        <div class="form-main">
                            
                                <div class="title">
                                    <h3>Login</h3>
                                </div>
                            
                            
                            <form class="form" action="${pageContext.request.contextPath}/LoginClienteController" method="post">
                                <div class="row">
                                    <div class="col-lg-12 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>Email<span>*</span></label>
                                            <input type="text" name="email" required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>Senha<span>*</span></label>
                                            <input type="password" name="senha" required="required">
                                        </div>
                                    </div>                                    
                                    <div class="col-12">
                                        <div class="form-group button">
                                            <button type="submit" class="btn">Continuar</button>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div style="text-align: center; margin-top: 20px;">
                                            <p>Não tem cadastro ? <a href="${pageContext.request.contextPath}/cadastroWeb.jsp">Cadastre-se</a></p>
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
    <!--/ End Contact -->

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
    <!-- Fancybox JS -->
    <script src="js/facnybox.min.js"></script>
    <!-- Waypoints JS -->
    <script src="js/waypoints.min.js"></script>
    <!-- Jquery Counterup JS -->
    <script src="js/jquery-counterup.min.js"></script>
    <!-- Countdown JS -->
    <script src="js/finalcountdown.min.js"></script>
    <!-- Nice Select JS -->
    <script src="js/nicesellect.js"></script>
    <!-- Ytplayer JS -->
    <script src="js/ytplayer.min.js"></script>
    <!-- Flex Slider JS -->
    <script src="js/flex-slider.js"></script>
    <!-- ScrollUp JS -->
    <script src="js/scrollup.js"></script>
    <!-- Onepage Nav JS -->
    <script src="js/onepage-nav.min.js"></script>
    <!-- Easing JS -->
    <script src="js/easing.js"></script>
    <!-- Google Map JS -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnhgNBg6jrSuqhTeKKEFDWI0_5fZLx0vM"></script>	
    <script src="js/gmap.min.js"></script>
    <script src="js/map-script.js"></script>
    <!-- Active JS -->
    <script src="js/active.js"></script>
</body>
</html>
