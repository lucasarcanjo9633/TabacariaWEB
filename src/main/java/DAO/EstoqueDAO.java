/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Produto;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ochaus
 */
public class EstoqueDAO {

    private static final String DRIVER = "com.mysql.jdbc.Driver";    //Driver do MySQL 8.0 em diante - Se mudar o SGBD mude o Driver
    private static final String LOGIN = "root";                         //nome de um usuário do banco de dados
    private static final String SENHA = "";                             //sua senha de acesso
    private static final String URL = "jdbc:mysql://localhost:3306/tabacaria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC";  //URL do banco de dados
    private static Connection conexao;

    public static boolean atualizarEstoque(int id, int qtde, double valor) {

        boolean retorno = false;
        java.sql.Date mysqlDate = new java.sql.Date(new java.util.Date().getTime());

        Produto p = new Produto(id, valor, qtde, mysqlDate);

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("INSERT INTO entrada_produto (id_produto, qtde, valor_venda, data_entrada) VALUES (?, ?, ?, ?)");

            comando.setInt(1, p.getId());
            comando.setInt(2, p.getQtd());
            comando.setDouble(3, p.getValor());
            comando.setDate(4, (Date) p.getEntrada());

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
            } else {
                retorno = false;
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
    
    public static ArrayList<Produto> getProduto() {

        ArrayList<Produto> listaProdutos = new ArrayList<>();

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("select produto.id, produto.status, produto.nome, estoque.valor_venda, produto.descricao, produto.palavra_chave, estoque.qtde, produto.img from produto, estoque where produto.id = estoque.id_produto and produto.status = 1 group by produto.id;");

            ResultSet rs = comando.executeQuery();

            while (rs.next()) {

                Produto p = new Produto(rs.getInt("id"), rs.getBoolean("status"), rs.getString("nome"), rs.getDouble("valor_venda"), rs.getString("descricao"), rs.getString("palavra_chave"), rs.getInt("qtde"), rs.getString("img"));

                listaProdutos.add(p);
            }

        } catch (ClassNotFoundException ex) {
            listaProdutos = null;
        } catch (SQLException ex) {
            listaProdutos = null;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                listaProdutos = null;
            }
        }

        return listaProdutos;
    }
}
