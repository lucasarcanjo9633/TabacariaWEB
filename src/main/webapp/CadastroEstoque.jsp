<%-- 
    Document   : CadastroEstoque
    Created on : 13/03/2020, 10:17:59
    Author     : Ochaus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">       
        <script> src = "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js";</script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AlinhamentoButton.css" />
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

        <title>Cadastrar Estoque</title>

        <script>
            function validacao() {
                var formulario = document.forms["formCadastroProduto"];
                var qtdP = formulario.qtd.value;
                var erro = false;

                if (qtdP.length < 1) {
                    document.getElementById("qtdProduto").style.backgroundColor = "#ffcccc";
                    document.getElementById("qtdProduto").focus();
                    erro = true;
                    $.notify({
                        // options
                        message: 'Preencha a quantidade do produto'
                    }, {
                        // settings
                        type: 'danger'
                    });
                    return false;
                } else {
                    document.getElementById("qtdProduto").style.backgroundColor = "#ffffff";
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
                        <h2>Atualizar Estoque</h2>
                        <label>${message}</label>
                    </div>
                    <form action="${pageContext.request.contextPath}/EstoqueController" method="post" name="formCadastroProduto" onsubmit="return validacao()" >                        

                        <div class="form-group">
                            <label>ID: </label>
                            <div>
                                <input type="text" id="idProduto" name="idProduto" value="${idProdutoAttr}" readonly placeholder="ID do Produto" class="form-control">
                            </div>				
                        </div>

                        <div class="form-group">
                            <label>Nome: </label>
                            <div>
                                <input type="text" id="nomeProduto" name="nomeProduto" value="${nomeProdutoAttr}" readonly placeholder="Nome do Produto" class="form-control">
                            </div>				
                        </div>
                        <div class="form-group">
                            <label>Valor de Compra: </label>
                            <div>
                                <input type="number" id="valor" name="valor" value="${valorAttr}" readonly placeholder="Valor do Produto" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Descrição: </label>
                            <div>
                                <input type="text" id="descricaoProduto" name="descricao" value="${descricaoAttr}" readonly placeholder="Descrição do Produto" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Palavra Chave: </label>
                            <div>
                                <input type="text" id="pChave" name="pChave" value="${pChaveAttr}" readonly placeholder="Palavra Chave" class="form-control">
                            </div>
                        </div>   

                        <div class="form-group">
                            <label>Quantidade: </label>
                            <div>
                                <input type="number" id="qtdProduto" name="qtd" value="${qtdAttr}" required placeholder="Quantidade do Produto" class="form-control">
                            </div>
                        </div>

                        <div class="posicaoButtons">
                            <input type="hidden" value="salvar" name="acao">
                            <button class="btn btn-primary" type="submit">Atualizar</button> 
                            <button class="btn btn-primary" type="reset">Resetar</button>                      
                        </div>
                    </form>
                    <div class="campoVoltarPosicao">
                        <br><br>
                        <div>
                            <form action="${pageContext.request.contextPath}/EstoqueController" method="get">
                                <input type="hidden" value="listar" name="acao">
                                <button class="btn btn-primary" type="submit" class="btn btn-primary">Voltar</button>
                            </form>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </body>
</html>
