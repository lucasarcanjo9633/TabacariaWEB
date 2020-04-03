/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import Model.Usuario;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ochaus
 */
public class Autorizacao implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Verificar se usuario esta na sessao
        HttpSession sessao = httpRequest.getSession();
        if (sessao.getAttribute("usuario") == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Login.jsp");
            return;
        }
        // Verificar se usuario tem permissao de acesso na pagina
        Usuario usuario = (Usuario) sessao.getAttribute("usuario");
        if (verificarPermissaoAcesso(httpRequest, usuario)) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/index.html");
        }
    }

    private boolean verificarPermissaoAcesso(
            HttpServletRequest httpRequest, Usuario usuario) {
        String urlAcessada = httpRequest.getRequestURI();
        if (urlAcessada.endsWith("/PaginaInicial.jsp")) {
            return true;
        }else if (urlAcessada.endsWith("/LogoutController")) {
            return true;                
        }else if (urlAcessada.endsWith("/ProdutoController")
                && usuario.verificarPapel("PRODUTO")) {
            return true;
        }else if (urlAcessada.endsWith("/ListarProduto.jsp")
                && usuario.verificarPapel("PRODUTO")) {
            return true;
        }else if (urlAcessada.endsWith("/CadastroProduto.jsp")
                && usuario.verificarPapel("PRODUTO")) {
            return true;
        }else if (urlAcessada.endsWith("/UsuarioController")
                && usuario.verificarPapel("USUARIO")) {
            return true;            
        }else if (urlAcessada.endsWith("/ListarUsuario.jsp")
                && usuario.verificarPapel("USUARIO")) {
            return true;
        }else if (urlAcessada.endsWith("/CadastroUsuario.jsp")
                && usuario.verificarPapel("USUARIO")) {
            return true;
        }else if (urlAcessada.endsWith("/EstoqueController")
                && usuario.verificarPapel("ESTOQUE")) {
            return true;
        } else if (urlAcessada.endsWith("/ListarEstoque.jsp")
                && usuario.verificarPapel("ESTOQUE")) {
            return true;
        }else if (urlAcessada.endsWith("/CadastroEstoque.jsp")
                && usuario.verificarPapel("ESTOQUE")) {
            return true;
        }
        return false;
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }
    }
