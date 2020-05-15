/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Endereco;
import Model.Item;
import Model.Venda;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author igor
 */
public class VendaDAO {
    
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";    //Driver do MySQL 8.0 em diante - Se mudar o SGBD mude o Driver
    private static final String LOGIN = "root";                         //nome de um usuário do banco de dados
    private static final String SENHA = "";                             //sua senha de acesso
    private static final String URL = "jdbc:mysql://localhost:3306/tabacaria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC";  //URL do banco de dados
    private static Connection conexao;
    
    
    public static boolean salvar(Venda venda) {
        boolean retorno = false;
        java.sql.Date mysqlDate = new java.sql.Date(new java.util.Date().getTime());
        
        venda.setDataVenda(mysqlDate);

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("INSERT INTO "
                    + "venda (idcliente, idendereco, precofinal, datavenda, pagamento) "
                    + "VALUES (?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);

            comando.setInt(1, venda.getIdCliente());
            comando.setInt(2, venda.getEndereco().getId());
            comando.setDouble(3, venda.getPrecoFinal());
            comando.setDate(4, venda.getDataVenda());
            comando.setString(5, venda.getPagamento());
            

            int linhasAfetadas = comando.executeUpdate();
            
            ResultSet rs = comando.getGeneratedKeys();
            
            if (rs.next()) {
                
                venda.setIdVenda(rs.getInt(1));
            }
            ArrayList<Item> itemVenda = venda.getItens();           
            if (linhasAfetadas > 0) {
                for (int i = 0; i < itemVenda.size(); i++) {
                    
                    comando = conexao.prepareStatement("INSERT INTO saida_produto (id_venda, id_produto, qtde, data_saida, valor_venda) VALUES (?, ?, ?, ?,?)");                               
                    comando.setInt(1,venda.getIdVenda());
                    comando.setInt(2, itemVenda.get(i).getP().getId());
                    comando.setInt(3, itemVenda.get(i).getQtd());
                    comando.setDate(4, venda.getDataVenda());
                    comando.setDouble(5, itemVenda.get(i).getP().getValor());
                   
                    linhasAfetadas = comando.executeUpdate();
                                           
                    if (linhasAfetadas > 0) {

                        retorno = true;
                        
                    } else {
                        
                        retorno = false;
                    }                    
                }                                                       
            }

        } catch (ClassNotFoundException ex) {
            retorno = false;
        } catch (SQLException ex) {
            retorno = false;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                retorno = false;
            }

        }

        return retorno;

    }
    
    public static ArrayList<Venda> getVenda(int idCliente) {
        
        ArrayList<Venda> listaVendas = new ArrayList<>();
        
        Venda v = new Venda();             

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" SELECT idvenda, idcliente, idendereco, precofinal, datavenda, pagamento, status "
                    + " FROM venda "
                    + " WHERE "
                    + " idcliente = " + idCliente + " ; ");

            ResultSet rs = comando.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idVenda");
                v.setIdVenda(id);
                v.setIdCliente(rs.getInt("idcliente"));
                int idEndereco = rs.getInt("idendereco");
                v.setPrecoFinal(rs.getDouble("precofinal"));
                v.setDataVenda(rs.getDate("datavenda"));
                v.setPagamento(rs.getString("pagamento"));
                v.setStatus(rs.getBoolean("status"));
               
                
                Endereco e = new Endereco();

                PreparedStatement comando1 = conexao.prepareStatement(" SELECT idendereco, cep, endereco, bairro, cidade, uf FROM endereco"
                        + " WHERE "
                        + " idendereco = " + idEndereco + "; ");
                ResultSet rs1 = comando1.executeQuery();

                while (rs1.next()) {
                    
                    e.setId(rs1.getInt("idendereco"));
                    e.setCEP(rs1.getString("cep"));
                    e.setEndereco(rs1.getString("endereco"));
                    e.setBairro(rs1.getString("bairro"));
                    e.setCidade(rs1.getString("cidade"));
                    e.setUF(rs1.getString("uf"));
                }

                v.setEndereco(e);
                listaVendas.add(v);
            }

        } catch (ClassNotFoundException ex) {
            listaVendas = null;
        } catch (SQLException ex) {
            listaVendas = null;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                listaVendas = null;
            }

        }
        return listaVendas;
    }
}