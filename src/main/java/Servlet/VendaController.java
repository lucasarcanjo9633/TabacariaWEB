/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.VendaDAO;
import Model.Venda;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "VendaController", urlPatterns = {"/VendaController"})
public class VendaController extends HttpServlet {

  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listar(request, response);
    }
    protected void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       int idCliente = Integer.valueOf(request.getParameter("idCliente"));
       
       ArrayList<Venda> vendas = VendaDAO.getVenda(idCliente);
       
       request.setAttribute("TodasVendas", vendas);
       RequestDispatcher dispatcher = request.getRequestDispatcher("/pedidos.jsp");
       dispatcher.forward(request, response);
    }
}
