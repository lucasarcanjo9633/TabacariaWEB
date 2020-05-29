<%-- 
    Document   : AlterarStatusPedido
    Created on : 28/05/2020, 14:05:31
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
                        <h2>Atualizar Status</h2>
                        <label>${message}</label>
                    </div>
                    <form action="${pageContext.request.contextPath}/VendaController" method="post" name="formCadastroProduto">                        

                        <div class="form-group">
                            <label>Cod. Pedido: </label>
                            <div>
                                <input type="text" id="idVenda" name="idVenda" value="${idVendaAttr}" readonly class="form-control">
                            </div>				
                        </div>

                        <div class="form-group">
                            <label>ID Cliente: </label>
                            <div>
                                <input type="text" id="idCliente" name="idCliente" value="${idClienteAttr}" readonly class="form-control">
                            </div>				
                        </div>
                        <div class="form-group">
                            <label>Valor de Compra: </label>
                            <div>
                                <input type="number" id="precoFinal" name="precoFinal" value="${precoFinalAttr}" readonly class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Data: </label>
                            <div>
                                <input type="text" id="data" name="data" value="${dataVendaAttr}" readonly class="form-control">
                            </div>
                        </div>
                            
                            <div class="form-group">
                            <label>Status Atual: </label>
                            <div>
                                <input type="text" id="statusAtual" name="statusAtual" value="${statusAttr}" readonly class="form-control">
                            </div>
                        </div>  

                        <div class="form-group">
                            <label>Status Alterar: </label>
                            <div>
                                <select class="selectpicker form-control" data-live-search="true" name="status">                                   
                                    
                                    <option value="aguardando pagamento">aguardando pagamento</option>
                                    <option value="pagamento rejeitado">pagamento rejeitado</option>
                                    <option value="pagamento aprovado">pagamento aprovado</option>
                                    <option value="aguardando retirada">aguardando retirada</option>
                                    <option value="em transito">em transito</option>
                                    <option value="entregue">entregue</option>
                                    
                                </select>
                            </div>
                        </div>

                        <div class="posicaoButtons">
                            <input type="hidden" value="salvarStatus" name="acao">
                            <button class="btn btn-primary" type="submit">Atualizar</button>                    
                        </div>
                    </form>
                    <div class="campoVoltarPosicao">
                        <br><br>
                        <div>
                            <form action="${pageContext.request.contextPath}/VendaController" method="get">
                                <input type="hidden" value="todosPedidos" name="acao">
                                <button class="btn btn-primary" type="submit" class="btn btn-primary">Voltar</button>
                            </form>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </body>
</html>
