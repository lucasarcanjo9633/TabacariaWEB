/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ClienteDAO;
import Model.Cliente;
import Model.Endereco;
import java.io.IOException;
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
@WebServlet(name = "EnderecoController", urlPatterns = {"/EnderecoController"})
public class EnderecoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        switch (acao) {

            case "cadastrar":
                cadastrar(request, response);
                break;
            case "excluir":
                excluir(request, response);
                break;
        }

    }

    protected void cadastrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.valueOf(request.getParameter("idCliente"));
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("rua");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");

        Endereco e = new Endereco(cep, endereco, bairro, cidade, uf);

        if (ClienteDAO.salvarEndereco(e, id)) {

            Cliente c = ClienteDAO.buscaCliente(id);
            request.getSession().setAttribute("cliente", c);
            
            request.setAttribute("message", "Endereço cadastrado com sucesso.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/enderecolistar.jsp");
            dispatcher.forward(request, response);
        }

    }

    protected void excluir(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.valueOf(request.getParameter("idEndereco"));

        int idCliente = Integer.valueOf(request.getParameter("idCliente"));
        
        if (ClienteDAO.desativarEndereco(id)) {

            Cliente c = ClienteDAO.buscaCliente(idCliente);
            request.getSession().setAttribute("cliente", c);
            
            request.setAttribute("message", "Endereço excluido com sucesso.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/enderecolistar.jsp");
            dispatcher.forward(request, response);
        }

    }

}
