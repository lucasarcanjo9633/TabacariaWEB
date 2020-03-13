/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ProdutoDAO;
import Model.Produto;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ochaus
 */
@WebServlet(name = "EstoqueController", urlPatterns = {"/EstoqueController"})
public class EstoqueController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        switch (acao) {
            case "alterar":
                alterar(request, response);
                break;
            case "listar":
                listar(request, response);
                break;
            case "salvar":
                salvar(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        switch (acao) {
            case "alterar":
                alterar(request, response);
                break;
            case "listar":
                listar(request, response);
                break;
            case "salvar":
                salvar(request, response);
                break;

        }
    }

    protected void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Produto> p = ProdutoDAO.getProduto();
        request.setAttribute("TodosProdutos", p);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarEstoque.jsp");
        dispatcher.forward(request, response);
    }

    protected void alterar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String nomeProduto = request.getParameter("nome");
        String valorCompra = request.getParameter("valor");
        String descricao = request.getParameter("descricao");
        String pChave = request.getParameter("pChave");
        String qtd = request.getParameter("qtd");

        request.setAttribute("idProdutoAttr", id);
        request.setAttribute("nomeProdutoAttr", nomeProduto);
        request.setAttribute("valorAttr", valorCompra);
        request.setAttribute("descricaoAttr", descricao);
        request.setAttribute("pChaveAttr", pChave);
        request.setAttribute("qtdAttr", qtd);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroEstoque.jsp");
        dispatcher.forward(request, response);
    }

    protected void salvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("idProduto");
        String nomeProduto = request.getParameter("nomeProduto");
        String valorCompra = request.getParameter("valor");
        String descricao = request.getParameter("descricao");
        String pChave = request.getParameter("pChave");
        String qtd = request.getParameter("qtd");

        if (ProdutoDAO.atualizarEstoque(Integer.parseInt(qtd), Integer.parseInt(qtd), Double.parseDouble(valorCompra))) {

            listar(request, response);
        } else {
            request.setAttribute("idProdutoAttr", id);
            request.setAttribute("nomeProdutoAttr", nomeProduto);
            request.setAttribute("valorAttr", valorCompra);
            request.setAttribute("descricaoAttr", descricao);
            request.setAttribute("pChaveAttr", pChave);
            request.setAttribute("qtdAttr", qtd);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroEstoque.jsp");
            dispatcher.forward(request, response);
        }
    }
}
