<%-- 
    Document   : CadastroUsuario
    Created on : 02/04/2020, 11:56:41
    Author     : igor
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Modulo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">       
        <script> src = "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js";</script>
        <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
        <script> src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js";</script>              
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-notify.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">      
        <link href="https://getbootstrap.com.br/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com.br/docs/4.1/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>');</script>
        <script src="https://getbootstrap.com.br/docs/4.1/assets/js/vendor/popper.min.js"></script>
        <script src="https://getbootstrap.com.br/docs/4.1/dist/js/bootstrap.min.js"></script>
        <title>Cadastro Produto</title>

        <script>
            function validacao() {
                var formulario = document.forms["formCadastroProduto"];
                var nomeP = formulario.nomeProduto.value;
                var valorCompraP = formulario.valor.value;
                var descricaoP = formulario.descricao.value;
                var pChaveP = formulario.pChave.value;
                var erro = false;

                if (nomeP.length < 1) {
                    document.getElementById("nomeProduto").style.backgroundColor = "#ffcccc";
                    document.getElementById("nomeProduto").focus();
                    erro = true;
                    $.notify({
                        // options
                        message: 'Preencha o nome do produto'
                    }, {
                        // settings
                        type: 'danger'
                    });
                    return false;
                } else {
                    document.getElementById("nomeProduto").style.backgroundColor = "#ffffff";
                    erro = false;
                }

                if (valorCompraP.length < 1) {
                    document.getElementById("valor").style.backgroundColor = "#ffcccc";
                    document.getElementById("valor").focus();
                    erro = true;
                    $.notify({
                        // options
                        message: 'Preencha o valor do produto'
                    }, {
                        // settings
                        type: 'danger'
                    });
                    return false;
                } else {
                    document.getElementById("valor").style.backgroundColor = "#ffffff";
                    erro = false;
                }


                if (descricaoP.length < 1) {
                    document.getElementById("descricaoProduto").style.backgroundColor = "#ffcccc";
                    $.notify({
                        // options
                        message: 'Preencha a descrição do produto'
                    }, {
                        // settings
                        type: 'danger'
                    });
                    document.getElementById("descricaoProduto").focus();
                    erro = true;
                    return false;
                } else {
                    document.getElementById("descricaoProduto").style.backgroundColor = "#ffffff";
                    erro = false;
                }

                if (pChaveP.length < 1) {
                    document.getElementById("pChave").style.backgroundColor = "#ffcccc";
                    $.notify({
                        // options
                        message: 'Preencha a palavra chave'
                    }, {
                        // settings
                        type: 'danger'
                    });
                    document.getElementById("pChave").focus();
                    erro = true;
                    return false;
                } else {
                    document.getElementById("pChave").style.backgroundColor = "#ffffff";
                    erro = false;
                }

                if (erro) {
                    alert("Cadastro não realizado.");
                    return false;
                }
            }

        </script>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top btn-primary">
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
        <div class="itens">                  
            <div class="form-group">
                <div class="container">
                    <div class = "h2">
                        <br>
                        <h2>${title}</h2>
                        <label>${message}</label>
                    </div>
                    <form action="${pageContext.request.contextPath}/UsuarioController" method="post" onsubmit="return validacao()" >                        

                        <div class="form-group">
                            <label>ID: </label>
                            <div>
                                <input type="text" id="idProduto" name="idPessoa" value="${idPessoaAttr}" readonly placeholder="ID do usuário" class="form-control">
                            </div>				
                        </div>

                        <div class="form-group">
                            <label>NomeCompleto: </label>
                            <div>
                                <input type="text" id="nomeProduto" name="nomeCompleto" value="${nomeCompletoAttr}" placeholder="Nome Completo" class="form-control">
                            </div>				
                        </div>                      

                        <div class="form-group">
                            <label>CPF: </label>
                            <div>
                                <input type="text" id="cpf" name="cpf" value="${cpfAttr}" placeholder="000.000.000-00" class="form-control" onkeypress="$(this).mask('000.000.000-00')">
                            </div>				
                        </div>

                        <div>
                            <label>Modulo: </label>
                            <div>
                                <select name="modulo" multiple style="height: 100px">
                                    <c:forEach items="${TodosModulos}" var="modulos">
                                        <option value="${modulos.id}">
                                            ${modulos.nomeModulo}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Telefone: </label>
                            <div>
                                <input type="text" id="telefone" name="telefone" value="${telefoneAttr}" placeholder="(00) 00000-0000" class="form-control" onkeypress="$(this).mask('(00) 00000-0009')">
                            </div>
                        </div>   
                        <div class="form-group">
                            <label>Login: </label>
                            <div>
                                <input type="email" id="login" name="login" value="${loginAttr}" placeholder="Login" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Senha: </label>
                            <div>
                                <input type="password" id="senha" name="senha" value="${senhaAttr}" placeholder="Senha" class="form-control">
                            </div>
                            <div>
                                <br>
                                <input type="password" id="senha" name="senha" value="${senhaAttr}" placeholder="Confirme a senha" class="form-control">
                            </div>
                        </div>
                        <div class="posicaoButtons">
                            <button class="btn btn-primary" type="submit">Cadastrar
                                <span class = "glyphicon glyphicon-send"></span>
                            </button> 
                            <button class="btn btn-primary" type="reset">Resetar
                                <span class = "glyphicon glyphicon-refresh"></span>
                            </button>                      
                        </div>
                    </form>
                    <div class="campoVoltarPosicao">
                        <br><br>
                        <div>
                            <form action="${pageContext.request.contextPath}/UsuarioController" method="get">
                                <input type="hidden" value="listar" name="acao">
                                <button class="btn btn-primary" type="submit" class="btn btn-primary">Voltar
                                    <span class = "glyphicon glyphicon-arrow-left"></span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </body>
</html>
