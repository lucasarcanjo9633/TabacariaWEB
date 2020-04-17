/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ClienteDAO;
import DAO.ProdutoWebDAO;
import Model.Cliente;
import Model.Produto;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author igor
 */
@WebServlet(name = "ClienteController", urlPatterns = {"/ClienteController"})
public class ClienteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        editar(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        switch (acao) {
            case "salvar":
                salvar(request, response);
                break;

            case "perfil":
                perfil(request, response);
                break;

            case "editar": {
                editar(request, response);
                break;
            }
        }
    }

    protected void salvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String email = request.getParameter("email");
        Date data = Date.valueOf(request.getParameter("data"));
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("rua");
        String cidade = request.getParameter("cidade");
        String bairro = request.getParameter("bairro");
        String uf = request.getParameter("uf");
        String telefone = request.getParameter("telefone");

        Cliente cliente = new Cliente(nome, sobrenome, email, cpf, data, senha, cep, endereco, bairro, cidade, uf, telefone);

        if (DAO.ClienteDAO.salvar(cliente)) {
            
            ArrayList<Produto> p = ProdutoWebDAO.getProduto();
            request.setAttribute("TodosProdutos", p);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
            
        } else {
            request.setAttribute("message", "Falha ao cadastrar!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastroWeb.jsp");
            dispatcher.forward(request, response);

        }

    }

    protected void perfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idCliente = Integer.parseInt(request.getParameter("idCliente"));

        Cliente c = ClienteDAO.buscaCliente(idCliente);
        if (c != null) {
            request.setAttribute("idClienteAttr", c.getIdCliente());
            request.setAttribute("nomeAttr", c.getNome());
            request.setAttribute("sobreNomeAttr", c.getSobrenome());
            request.setAttribute("emailAttr", c.getEmail());
            request.setAttribute("cpfAttr", c.getEmail());
            request.setAttribute("senhaAttr", c.getSenha());
            request.setAttribute("confSenhaAttr", c.getSenha());
            request.setAttribute("cepAttr", c.getCEP());
            request.setAttribute("ruaAttr", c.getEndereco());
            request.setAttribute("bairroAttr", c.getBairro());
            request.setAttribute("cidadeAttr", c.getCidade());
            request.setAttribute("estadoAttr", c.getUF());
            request.setAttribute("dateNascAttr", c.getDtaNasc());
            request.setAttribute("telefoneAttr", c.getTelefone());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/perfilWeb.jsp");
            dispatcher.forward(request, response);
        } else {

        }
    }

    protected void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        Date data = Date.valueOf(request.getParameter("data"));
        String senha = request.getParameter("senha");
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("rua");
        String cidade = request.getParameter("cidade");
        String bairro = request.getParameter("bairro");
        String uf = request.getParameter("uf");
        String telefone = request.getParameter("telefone");

        Cliente cliente = new Cliente(idCliente, nome, sobrenome, data, senha, cep, endereco, bairro, cidade, uf, telefone);

        if (ClienteDAO.editar(cliente)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp?acao=listarWeb");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Falha ao atualizar dados!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastroWeb.jsp");
            dispatcher.forward(request, response);
        }

    }

}
