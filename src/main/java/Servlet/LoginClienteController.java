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
        Cliente cliente = ClienteDAO.login(username, senha);
        

        if (cliente != null && cliente.getSenha().equals(senha)) {
            // Usuario válido - adiciona na sessão
            HttpSession sessao = request.getSession();
            sessao.setAttribute("cliente", cliente);

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
