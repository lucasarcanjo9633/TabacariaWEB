/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import Model.Cliente;
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
public class AutorizacaoCliente implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Verificar se usuario esta na sessao
        HttpSession sessao = httpRequest.getSession();

        // Verificar se usuario tem permissao de acesso na pagina
        Cliente cliente = (Cliente) sessao.getAttribute("cliente");
        if (verificarPermissaoAcesso(httpRequest, cliente)) {
            chain.doFilter(request, response);
        }
    }

    private boolean verificarPermissaoAcesso(
            HttpServletRequest httpRequest, Cliente cliente) {
        String urlAcessada = httpRequest.getRequestURI();
        if (urlAcessada.endsWith("/PaginaInicial.jsp")) {
            return true;
        }else if (urlAcessada.endsWith("/LogoutController")) {
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
