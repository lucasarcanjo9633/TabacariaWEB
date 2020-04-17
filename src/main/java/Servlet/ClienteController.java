/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.Cliente;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");

        switch (acao) {
            case "salvar":
                try {
                    salvar(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
                }

                break;
        }
    }

    protected void salvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

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
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Falha ao cadastrar!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastroWeb.jsp");
            dispatcher.forward(request, response);

        }

    }

}
