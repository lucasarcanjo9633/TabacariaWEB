/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ClienteDAO;
import DAO.ProdutoDAO;
import DAO.ProdutoWebDAO;
import Model.Cliente;
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
            case "cadastrarVenda":
                cadastrarVenda(request, response, venda);
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
        Produto p = new Produto();
        p.setId(Integer.parseInt(request.getParameter("idProduto")));
        p.setNome(request.getParameter("nome"));
        p.setValor(Double.parseDouble(request.getParameter("valor")));        
        p.setImg(request.getParameter("idProduto"));
        int qtd = Integer.parseInt(request.getParameter("quant[1]"));
        
        Item item = new Item(p, qtd, 0);
        item.precoTotal();
        
        if(venda.itemExisteCarrinho(p)){
            venda.adicionarItemExistente(item);
        }else{
            venda.adicionarItem(item);
        }        
        venda.precoFinal();
        String r = "500";
        request.setAttribute("itens", venda.getItens());
        request.setAttribute("total", r);
        response.sendRedirect(request.getContextPath() + "/carrinho.jsp");
    }

    protected void retirarProduto(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {
        int idProduto = Integer.parseInt(request.getParameter("idProduto"));
        venda.removerItem(idProduto);
        venda.precoFinal();
        request.setAttribute("itens", venda.getItens());
        request.setAttribute("precoFinal", venda.getPrecoFinal());
        response.sendRedirect(request.getContextPath() + "/carrinho.jsp");
    }

    protected void cadastrarVenda(HttpServletRequest request, HttpServletResponse response, Venda venda)
            throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        venda.setIdCliente(idCliente);
//        if (VendaDAO.salvar(venda)) {
//            venda.vendarealizada();
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/VendaSucesso.jsp");
//            dispatcher.forward(request, response);
//        }
        response.sendRedirect(request.getContextPath() + "/Venda.jsp");

    }

}
