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
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ochaus
 */
public class ProdutoDAO {

    private static final String DRIVER = "com.mysql.jdbc.Driver";    //Driver do MySQL 8.0 em diante - Se mudar o SGBD mude o Driver
    private static final String LOGIN = "root";                         //nome de um usuário do banco de dados
    private static final String SENHA = "";                             //sua senha de acesso
    private static final String URL = "jdbc:mysql://localhost:3306/tabacaria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC";  //URL do banco de dados
    private static Connection conexao;

    public static int proxId() {

        int id = 0;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("SELECT AUTO_INCREMENT FROM information_schema.tables WHERE  table_name = 'produto' AND table_schema = 'tabacaria'");

            ResultSet rs = comando.executeQuery();

            while (rs.next()) {

                id = rs.getInt(1);

            }

        } catch (ClassNotFoundException ex) {
            id = 0;
        } catch (SQLException ex) {
            id = 0;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                id = 0;
            }
        }

        return id;
    }

    public static boolean salvar(String nome, double valor, String desc, String pChave, String img) {
        boolean retorno = false;
        java.sql.Date mysqlDate = new java.sql.Date(new java.util.Date().getTime());

        Produto p = new Produto(nome, valor, desc, pChave, img, mysqlDate);

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("INSERT INTO produto (nome,descricao,palavra_chave,img) VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

            comando.setString(1, p.getNome());
            comando.setString(2, p.getDesc());
            comando.setString(3, p.getpChave());
            comando.setString(4, p.getImg());

            int linhasAfetadas = comando.executeUpdate();

            ResultSet rs = comando.getGeneratedKeys();
            int idProduto = 0;

            if (rs.next()) {

                idProduto = rs.getInt(1);
            }

            if (linhasAfetadas > 0) {

                comando = conexao.prepareStatement("INSERT INTO entrada_produto (id_produto, qtde, valor_venda, data_entrada) VALUES (?, ?, ?, ?)");
                comando.setInt(1, idProduto);
                comando.setInt(2, p.getQtd());
                comando.setDouble(3, p.getValor());
                comando.setDate(4, (Date) p.getEntrada());

                linhasAfetadas = comando.executeUpdate();

                if (linhasAfetadas > 0) {

                    retorno = true;

                } else {

                    retorno = false;
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

    public static boolean excluir(int cID) {

        boolean retorno = false;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("UPDATE produto SET status=0 WHERE id= ?");

            comando.setInt(1, cID);

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

    public static boolean atualizar(int id, String nomeProduto, double valor, String desc, String pChave) {

        boolean retorno = false;
        Produto p = new Produto(id, nomeProduto, valor, desc, pChave);

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("UPDATE produto, entrada_produto SET produto.nome=?, entrada_produto.valor_venda= ?, produto.descricao=?, produto.palavra_chave=? WHERE entrada_produto.id_produto=? AND produto.id=?");

            comando.setString(1, p.getNome());
            comando.setDouble(2, p.getValor());
            comando.setString(3, p.getDesc());
            comando.setString(4, p.getpChave());
            comando.setInt(5, p.getId());
            comando.setInt(6, p.getId());

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

            PreparedStatement comando = conexao.prepareStatement("select produto.id, produto.nome, estoque.valor_venda, produto.descricao, produto.palavra_chave, estoque.qtde, produto.img from produto, estoque where produto.id = estoque.id_produto and produto.status = 1");

            ResultSet rs = comando.executeQuery();

            while (rs.next()) {

                Produto p = new Produto(rs.getInt("id"), rs.getString("nome"), rs.getDouble("valor_venda"), rs.getString("descricao"), rs.getString("palavra_chave"), rs.getInt("qtde"), rs.getString("img"));

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
    
    public static ArrayList<Produto> getProduto(int id) {

        ArrayList<Produto> listaProdutos = new ArrayList<>();

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("select produto.id, produto.nome, estoque.valor_venda, produto.descricao, produto.palavra_chave, estoque.qtde, produto.img from produto, estoque where produto.id = estoque.id_produto and produto.id = "+id+" and produto.status = 1");

            ResultSet rs = comando.executeQuery();

            while (rs.next()) {

                Produto p = new Produto(rs.getInt("id"), rs.getString("nome"), rs.getDouble("valor_venda"), rs.getString("descricao"), rs.getString("palavra_chave"), rs.getInt("qtde"), rs.getString("img"));

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
