/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ProdutoDAO;
import Model.Produto;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Ochaus
 */
@WebServlet(name = "ProdutoController", urlPatterns = {"/ProdutoController"})
public class ProdutoController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acao = request.getParameter("acao");
        String id = request.getParameter("id");
        
        switch (acao) {
            case "alterar":
                alterar(request, response);
                break;
            case "cadastrar":
                cadastrar(request, response);
                break;
            case "excluir":
                excluir(request, response);
                break;
            case "listar":
                listar(request, response);
                break;
            case "visualizar":
                visualizar(request, response);
                break;
            
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        
        
        if ("alterar".equals(acao)) {
            alterar(request, response);
        } else if ("excluir".equals(acao)) {
            excluir(request, response);
        } else {
            salvar(request, response);
        }
    }
    
    protected void cadastrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("title", "Cadastrar Produto");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroProduto.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void alterar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String nomeProduto = request.getParameter("nome");
        String valorCompra = request.getParameter("valor");
        String descricao = request.getParameter("descricao");
        String pChave = request.getParameter("pChave");
        
        request.setAttribute("title", "Editar Produto");
        request.setAttribute("idProdutoAttr", id);
        request.setAttribute("nomeProdutoAttr", nomeProduto);
        request.setAttribute("valorAttr", valorCompra);
        request.setAttribute("descricaoAttr", descricao);
        request.setAttribute("pChaveAttr", pChave);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroProduto.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void excluir(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO.excluir(id);
        listar(request, response);
    }
    
    protected void salvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = null;
        String nomeProduto = null;
        String valorCompra = null;
        String descricao = null;
        String pChave = null;
        String img = null;
        int idProx = 0;
        String caminho = System.getProperty("user.home");
        
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                /*Faz o parse do request*/
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                /*percorre os input*/
                for (FileItem item : multiparts) {

                    /*captura os dados dos input do formulario*/
                    if (item.getFieldName().equals("idProduto")) {
                        id = item.getString();
                    }
                    if (item.getFieldName().equals("nomeProduto")) {
                        nomeProduto = item.getString();
                    }
                    if (item.getFieldName().equals("valor")) {
                        valorCompra = item.getString();
                    }
                    if (item.getFieldName().equals("descricao")) {
                        descricao = item.getString();
                    }
                    if (item.getFieldName().equals("pChave")) {
                        pChave = item.getString();
                    }
                    if (!item.isFormField() && item.getFieldName().equals("file")) {

                        /*Escreve a o arquivo na pasta WEB-INF*/
                        if (id == null || id.isEmpty()) {
                            /*Resgata o proximo auto increment do banco pra renomear a img*/
                            idProx = ProdutoDAO.proxId();
                            /*converte o id em string*/
                            img = String.valueOf(idProx);
                            item.write(new File(caminho.concat("\\Documents\\NetBeansProjects\\TabacariaWEB\\src\\main\\webapp\\imagens") + File.separator + img));
                            
                        } else if (id != null || !id.isEmpty()) {
                            item.write(new File(caminho.concat("\\Documents\\NetBeansProjects\\TabacariaWEB\\src\\main\\webapp\\imagens") + File.separator + id));
                        }
                    }
                }
                if (idProx > 0) {
                    if (ProdutoDAO.salvar(nomeProduto, Double.parseDouble(valorCompra), descricao, pChave, img)) {
                        request.setAttribute("title", "Cadastrar Produto");
                        request.setAttribute("message", "Produto salvo com sucesso");
                    }
                    
                } else if (id != null) {
                    if (ProdutoDAO.atualizar(Integer.parseInt(id), nomeProduto, Double.parseDouble(valorCompra), descricao, pChave)) {
                        request.setAttribute("title", "Editar Produto");
                        request.setAttribute("message", "Produto alterado com sucesso");
                    }
                } else {
                    request.setAttribute("message", "Falha ao salvar produto");
                }
            } catch (Exception ex) {
                request.setAttribute("message", "Upload de arquivo falhou devido a " + ex);
            }
            
        } else {
            request.setAttribute("message", "Desculpe este Servlet lida apenas com pedido de upload de arquivos");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CadastroProduto.jsp");
        dispatcher.forward(request, response);
    }
    
    private void visualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String img = request.getParameter("img");
        String caminho = System.getProperty("user.home");
        
        /*Obtem o caminho relatorio da pasta img*/
        String path = caminho.concat("\\Documents\\NetBeansProjects\\TabacariaWEB\\src\\main\\webapp\\imagens") + File.separator;
        
        File files = new File(path);
        response.setContentType("image/jpeg");

        /*Mostra o arquivo que está na pasta img onde foi realizado o upload*/
        for (String file : files.list()) {
            
            File f = new File(path + file);
            if (f.getName().equals(img)) {
                BufferedImage bi = ImageIO.read(f);
                OutputStream out = response.getOutputStream();
                ImageIO.write(bi, "jpg", out);
                out.close();
            }
        }
    }
    
    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Produto> p = ProdutoDAO.getProduto();
        request.setAttribute("TodosProdutos", p);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ListarProduto.jsp");
        dispatcher.forward(request, response);
    }
    
}
