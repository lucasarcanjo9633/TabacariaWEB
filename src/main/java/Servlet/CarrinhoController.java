/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ClienteDAO;
import DAO.ProdutoDAO;
import DAO.ProdutoWebDAO;
import DAO.VendaDAO;
import Model.Cliente;
import Model.Endereco;
import Model.Item;
import Model.Produto;
import Model.Venda;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ochaus
 */
@WebServlet(name = "CarrinhoController", urlPatterns = {"/CarrinhoController"})
public class CarrinhoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession();

        // Verifica se já existe atributo itensSelecionados na sessao
        // Se nao existir cria um novo
        if (sessao.getAttribute("itensSelecionados") == null) {
            sessao.setAttribute("itensSelecionados", new Venda());
        }
        Venda venda = (Venda) sessao.getAttribute("itensSelecionados");

        listarCarrinho(request, response, venda);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession();

        // Verifica se já existe atributo itensSelecionados na sessao
        // Se nao existir cria um novo
        if (sessao.getAttribute("itensSelecionados") == null) {
            sessao.setAttribute("itensSelecionados", new Venda());
        }
        Venda venda = (Venda) sessao.getAttribute("itensSelecionados");

        String acao = request.getParameter("acao");

        switch (acao) {
            case "adicionarCliente":
                adicionarCliente(request, response, venda);
                break;
            case "adicionarProduto":
                adicionarProduto(request, response, venda);
                break;
            case "retirarProduto":
                retirarProduto(request, response, venda);
                break;
            case "alterarQtd":
                alterarQtd(request, response, venda);
                break;
            case "listarCarrinnho":
                listarCarrinho(request, response, venda);
                break;
            case "pagamento":
                String formaPagamento = request.getParameter("tipoPagamento");
                venda.setPagamento(formaPagamento);
                switch (formaPagamento) {
                    case "cartao":
                        checkoutCartao(request, response, venda);
                        break;
                    default:
                        cadastrarVenda(request, response, venda);
                }
                break;
            case "cadastrarVenda":
                cadastrarVendaCartao(request, response, venda);
                break;
        }
    }

    protected void adicionarCliente(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {

        String idCliente = request.getParameter("id");
        venda.setIdCliente(Integer.parseInt(idCliente));
        request.setAttribute("idClienteAttr", idCliente);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Venda.jsp");
        dispatcher.forward(request, response);
    }

    protected void adicionarProduto(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {
        String pagina = request.getParameter("pagina");
        Produto p = new Produto();
        p.setId(Integer.parseInt(request.getParameter("idProduto")));
        p.setNome(request.getParameter("nome"));
        p.setValor(Double.parseDouble(request.getParameter("valor")));
        p.setImg(request.getParameter("idProduto"));
        int qtd = Integer.parseInt(request.getParameter("quant[1]"));

        Item item = new Item(p, qtd, 0);
        item.precoTotal();

        if (venda.itemExisteCarrinho(p)) {
            venda.adicionarItemExistente(item);
        } else {
            venda.adicionarItem(item);
        }
        venda.precoFinal();
        request.setAttribute("itens", venda.getItens());
        request.setAttribute("precoFinal", venda.getPrecoFinal());
        RequestDispatcher dispatcher;
        switch (pagina) {
            case "index":
                response.sendRedirect(request.getContextPath() + "/ProdutoController?acao=listarWeb");
                break;
            default:
                dispatcher = request.getRequestDispatcher("/carrinho.jsp");
                dispatcher.forward(request, response);
        }

    }

    protected void alterarQtd(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {
        Produto p = new Produto();
        p.setId(Integer.parseInt(request.getParameter("idProduto")));
        p.setNome(request.getParameter("nome"));
        p.setValor(Double.parseDouble(request.getParameter("valor")));
        p.setImg(request.getParameter("idProduto"));
        int qtd = Integer.parseInt(request.getParameter("quant[1]"));

        Item item = new Item(p, qtd, 0);
        item.precoTotal();
        if (venda.itemQtd(p) == 0) {
            venda.removerItem(p.getId());
        } else if (venda.itemExisteCarrinho(p)) {
            venda.adicionarItemExistente(item);
        } else {
            venda.adicionarItem(item);
        }
        venda.precoFinal();
        request.setAttribute("itens", venda.getItens());
        request.setAttribute("precoFinal", venda.getPrecoFinal());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/carrinho.jsp");
        dispatcher.forward(request, response);
    }

    protected void retirarProduto(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        String pagina = request.getParameter("pagina");
        venda.removerItem(idProduto);
        venda.precoFinal();
        request.setAttribute("itens", venda.getItens());
        request.setAttribute("precoFinal", venda.getPrecoFinal());
        RequestDispatcher dispatcher;
        switch (pagina) {
            case "carrinho":
                dispatcher = request.getRequestDispatcher("/carrinho.jsp");
                dispatcher.forward(request, response);
                break;
            case "detalhe":
                dispatcher = request.getRequestDispatcher("/ProdutoController?acao=listarWebDetalhe&id=" + idProduto);
                dispatcher.forward(request, response);
            default:
                response.sendRedirect(request.getContextPath() + "/ProdutoController?acao=listarWeb");
        }

    }

    protected void cadastrarVenda(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {

        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int idEndereco = Integer.parseInt(request.getParameter("endereco"));
        venda.setIdCliente(idCliente);
        Endereco end = new Endereco();
        end.setId(idEndereco);
        venda.setEndereco(end);

        if (VendaDAO.salvar(venda)) {
            request.setAttribute("idVenda", venda.getIdVenda());
            request.setAttribute("qtdItem", venda.quantidadeItem());
            request.setAttribute("valorTotal", venda.getPrecoFinal());
            request.setAttribute("pagamento", venda.getPagamento());
            venda.vendarealizada();
            RequestDispatcher dispatcher = request.getRequestDispatcher("/confirmar-pedido.jsp");
            dispatcher.forward(request, response);

        } else {
            response.sendRedirect(request.getContextPath() + "/ProdutoController?acao=listarWeb");
        }
    }

    protected void cadastrarVendaCartao(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {

            //String nome = request.getParameter("numero");
            venda.setPagamento(venda.getPagamento()+" de crédito");
        if (VendaDAO.salvar(venda)) {
            request.setAttribute("idVenda", venda.getIdVenda());
            request.setAttribute("qtdItem", venda.quantidadeItem());
            request.setAttribute("valorTotal", venda.getPrecoFinal());
            request.setAttribute("pagamento", venda.getPagamento());
            venda.vendarealizada();
            RequestDispatcher dispatcher = request.getRequestDispatcher("/confirmar-pedido.jsp");
            dispatcher.forward(request, response);

        } else {
            response.sendRedirect(request.getContextPath() + "/ProdutoController?acao=listarWeb");
        }
    }

    protected void listarCarrinho(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {

        request.setAttribute("itens", venda.getItens());
        request.setAttribute("precoFinal", venda.getPrecoFinal());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/carrinho.jsp");
        dispatcher.forward(request, response);

    }

    protected void checkoutCartao(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        //int idEndereco = Integer.parseInt(request.getParameter("idEndereco"));
        venda.setIdCliente(idCliente);
        Endereco end = new Endereco();
        end.setId(1);
        venda.setEndereco(end);
        request.setAttribute("precoFinal", venda.getPrecoFinal());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout-cartao.jsp");
        dispatcher.forward(request, response);
        
    }

}
