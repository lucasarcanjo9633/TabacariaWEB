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
        
        switch (acao) {
//            case "alterar":
//                alterar(request, response);
//                break;
//            case "salvarAlterar":
//                salvarAlterar(request, response);
//                break;
//            case "excluir":
//                excluir(request, response);
//                break;
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
        salvar(request, response);
    }
    
    protected void salvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nomeProduto = null;
        String valorCompra = null;
        String descricao = null;
        String pChave = null;
        String img = null;
        
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                /*Faz o parse do request*/
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                /*percorre os input*/
                for (FileItem item : multiparts) {

                    /*captura os dados dos input do formulario*/
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

                        /*Resgata o proximo auto increment do banco pra renomear a img*/
                        int id = ProdutoDAO.proxId();
                        /*converte o id em string*/
                        img = String.valueOf(id);
                        /*Escreve a o arquivo na pasta WEB-INF*/
                        item.write(new File(request.getServletContext().getRealPath("WEB-INF") + File.separator + img));
                    }
                }
                
                if (Integer.parseInt(img) > 0) {
                    if (ProdutoDAO.salvar(nomeProduto, Double.parseDouble(valorCompra), descricao, pChave, img)) {
                        request.setAttribute("message", "Produto salvo com sucesso");
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

        /*Obtem o caminho relatorio da pasta img*/
        String path = request.getServletContext().getRealPath("WEB-INF") + File.separator;
        
        File files = new File(path);
        response.setContentType("image/jpeg");

        /*Mostra o arquivo que está na pasta img onde foi realizado o upload*/
        for (String file : files.list()) {
            
            File f = new File(path + file);
            if(f.getName().equals(img)){           
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
