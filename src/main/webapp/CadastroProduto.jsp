<%-- 
    Document   : CadastroProduto
    Created on : 11/03/2020, 03:22:54
    Author     : Ochaus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/cssPaginaInicial.css" />
        <title>Cadastrar Produto</title>
        <script> src = "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js";</script>
        <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
        <script> src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js";</script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>        
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-notify.min.js"></script>
        <link rel="shortcut icon" href="http://www.tabacariaroma.com.br/wp-content/uploads/2017/09/cafe.png">
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
        <div class="itens">                  
            <div class="form-group">
                <div class="container">
                    <div class = "h2">
                        <br>
                        <h2>Cadastro de Produto</h2>
                        <label>${message}</label>
                    </div>
                    <form action="${pageContext.request.contextPath}/ProdutoController" method="post" name="formCadastroProduto" enctype="multipart/form-data" onsubmit="return validacao()" >                        

                        <div class="form-group">
                            <label>Nome: </label>
                            <div>
                                <input type="text" id="nomeProduto" name="nomeProduto" value="${nomeProdutoAttr}" placeholder="Nome do Produto" class="form-control">
                            </div>				
                        </div>
                        <div class="form-group">
                            <label>Valor de Compra: </label>
                            <div>
                                <input type="number" id="valor" name="valor" value="${valorAttr}" placeholder="Valor do Produto" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Descrição: </label>
                            <div>
                                <input type="text" id="descricaoProduto" name="descricao" value="${descricaoAttr}" placeholder="Descrição do Produto" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Palavra Chave: </label>
                            <div>
                                <input type="text" id="pChave" name="pChave" value="${pChaveAttr}" placeholder="Palavra Chave" class="form-control">
                            </div>
                        </div>   

                        <div class="form-group">
                            <label>Arquivo de Imagem: </label>
                            <div>
                                <input type="file" id="imagemProduto" name="file" value="${imagemAttr}" required class="form-control">
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
                            <form action="${pageContext.request.contextPath}/ProdutoController" method="get">
                                <input type="hidden" value="listar" name="acao">
                                <button class="btn btn-primary" type="submit" class="btn btn-primary">Voltar
                                    <span class = "glyphicon glyphicon-arrow-left"></span>
                            </form>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </body>
</html>
