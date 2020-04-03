/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ModuloDAO;
import DAO.UsuarioDAO;
import Model.Modulo;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listar(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        switch (acao) {
            case "salvar":
                salvar(request, response);
                break;
            case "editar":
                editar(request, response);
                break;
            /*case "excluir":
                excluir(request, response);
                break;
            case "listar":
                listar(request, response);
                break;*/
            case "cadastrar":
                retornaModulos(request, response);
                break;
            case "atualizar":
                atualizar(request, response);
                break;
        }
    }

    protected void salvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nomeCompleto");
        String cpf = request.getParameter("cpf");
        String idModulo[] = request.getParameterValues("modulo");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");

        List<Modulo> modulos = new ArrayList<>();

        if (idModulo != null) {
            for (int i = 0; i < idModulo.length; i++) {

                Modulo m = new Modulo(i, idModulo[i]);
                modulos.add(m);
            }
        }
        Usuario user = new Usuario(login, senha, modulos, nome, cpf, telefone, true);
        ArrayList<Modulo> m = ModuloDAO.getModulos();
        request.setAttribute("TodosModulos", m);
        if (UsuarioDAO.salvar(user)) {

            request.setAttribute("message", "Cadastro realizado com sucesso!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroUsuario.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Falha ao cadastrar!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroUsuario.jsp");
            dispatcher.forward(request, response);

        }
    }

    protected void atualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idPessoa"));
        String nome = request.getParameter("nomeCompleto");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String cpf = request.getParameter("cpf");
        String idModulo[] = request.getParameterValues("modulo");
        String telefone = request.getParameter("telefone");

        List<Modulo> modulos = new ArrayList<>();

        if (idModulo != null) {
            for (int i = 0; i < idModulo.length; i++) {

                Modulo m = new Modulo(i, idModulo[i]);
                modulos.add(m);
            }
        }
        Usuario user = new Usuario(id, login, senha, modulos, nome, cpf, telefone, true);

        if (UsuarioDAO.editar(user)) {
            request.setAttribute("title", "Editar Usuário");
            request.setAttribute("message", "Edição realizada com sucesso");
            request.setAttribute("user", user);
            int x = 1;
            request.setAttribute("x", x);
            ArrayList<Modulo> m = ModuloDAO.getModulos();
            request.setAttribute("TodosModulos", m);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroUsuario.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("title", "Editar Usuário");
            request.setAttribute("user", user);
            request.setAttribute("message", "Erro ao editar");
            ArrayList<Modulo> m = ModuloDAO.getModulos();
            request.setAttribute("TodosModulos", m);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroUsuario.jsp");
            dispatcher.forward(request, response);

        }
    }

    protected void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        int id = Integer.parseInt(request.getParameter("idPessoa"));
//        String nome = request.getParameter("nomeCompleto");
//        String login = request.getParameter("login");
//        String senha = request.getParameter("senha");
//        String cpf = request.getParameter("cpf");
//        String idModulo[] = request.getParameterValues("modulo");
//        String telefone = request.getParameter("telefone");
        int id = Integer.parseInt(request.getParameter("idPessoa"));
        Usuario user = UsuarioDAO.getUsuario(id);

        request.setAttribute("user", user);
        int x = 1;
        request.setAttribute("x", x);
        ArrayList<Modulo> modulos = ModuloDAO.getModulos();
        request.setAttribute("TodosModulos", modulos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroUsuario.jsp");
        dispatcher.forward(request, response);

    }

    protected void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Usuario> usuarios = UsuarioDAO.getUsuarios();
        request.setAttribute("TodosUsuarios", usuarios);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarUsuario.jsp");
        dispatcher.forward(request, response);

    }

    protected void retornaModulos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Modulo> modulos = ModuloDAO.getModulos();
        request.setAttribute("TodosModulos", modulos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroUsuario.jsp");
        dispatcher.forward(request, response);

    }

    /*
    protected void excluir(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        if (UsuarioDAO.remover(id)) {

            listar(request, response);

        } else {
            request.setAttribute("mensagemFalha", "Falha ao excluir!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarUsuario.jsp");
            dispatcher.forward(request, response);

        }
    }*/
}
