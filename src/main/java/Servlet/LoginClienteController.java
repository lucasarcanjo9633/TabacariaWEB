/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ClienteDAO;
import Model.Cliente;
import Model.Criptografar;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author igor
 */
@WebServlet(name = "LoginClienteController", urlPatterns = {"/LoginClienteController"})
public class LoginClienteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("email");
        String senha = request.getParameter("senha");
        senha = Criptografar.criptografar(senha);
        Cliente clientes = ClienteDAO.login(username, senha);

        if (clientes != null && clientes.getSenha().equals(senha)) {
            // Usuario válido - adiciona na sessão

            Cliente c = ClienteDAO.buscaCliente(clientes.getIdCliente());

            HttpSession sessao = request.getSession();

            // Verifica se já existe atributo itensSelecionados na sessao
            // Se nao existir cria um novo
            if (sessao.getAttribute("cliente") == null) {
                sessao.setAttribute("cliente", new Cliente());
            }
            
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            
            cliente.setIdCliente(c.getIdCliente());
            cliente.setNome(c.getNome());
            cliente.setSobrenome(c.getSobrenome());
            cliente.setCPF(c.getCPF());
            cliente.setEmail(c.getEmail());
            cliente.setDtaNasc(c.getDtaNasc());
            cliente.setTelefone(c.getTelefone());
            cliente.setSenha(c.getSenha());
            cliente.setEnderecos(c.getEnderecos());
             
            // Apresenta tela home para usuario.
            response.sendRedirect(request.getContextPath() + "/ProdutoController?acao=listarWeb");
        } else {
            // Usuario não está cadastrado, deve mostrar erro
            request.setAttribute("message", "Usuário ou senha inválidos");
            request.getRequestDispatcher("/loginWeb.jsp")
                    .forward(request, response);
        }

    }

}
