/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Cliente;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author igor
 */
public class ClienteDAO {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";    //Driver do MySQL 8.0 em diante - Se mudar o SGBD mude o Driver
    private static final String LOGIN = "root";                         //nome de um usuário do banco de dados
    private static final String SENHA = "";                             //sua senha de acesso
    private static final String URL = "jdbc:mysql://localhost:3306/tabacaria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC";  //URL do banco de dados
    private static Connection conexao;

    public static boolean salvar(Cliente cliente) {
        boolean retorno = false;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" INSERT INTO CLIENTE "
                    + " (nome, sobrenome, email, cpf, senha, cep, endereco, bairro, cidade, uf, telefone, dateNasc) "
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ");

            comando.setString(1, cliente.getNome());
            comando.setString(2, cliente.getSobrenome());
            comando.setString(3, cliente.getEmail());
            comando.setString(4, cliente.getCPF());
            comando.setString(5, cliente.getSenha());
            comando.setString(6, cliente.getCEP());
            comando.setString(7, cliente.getEndereco());
            comando.setString(8, cliente.getBairro());
            comando.setString(9, cliente.getCidade());
            comando.setString(10, cliente.getUF());
            comando.setString(11, cliente.getTelefone());
            comando.setDate(12, (java.sql.Date) cliente.getDtaNasc());

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
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

    public static Cliente login(String login, String senha) {
        Cliente cliente = null;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" SELECT idCliente, nome, email, senha "
                    + " FROM CLIENTE "
                    + " WHERE "
                    + " status = '1' AND "
                    + " email = '" + login + "' AND "
                    + " senha = '" + senha + "'; ");

            ResultSet rs = comando.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setSenha(rs.getString("senha"));
            }

        } catch (ClassNotFoundException ex) {
            cliente = null;
        } catch (SQLException ex) {
            cliente = null;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                cliente = null;
            }

        }
        return cliente;
    }

    public static Cliente buscaCliente(int idCliente) {
        Cliente cliente = null;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" SELECT "
                    + " idCliente, nome, sobrenome, email, "
                    + " cpf, senha, cep, endereco, "
                    + " bairro, cidade, uf, telefone, "
                    + " dateNasc "
                    + " FROM CLIENTE "
                    + " WHERE "
                    + " status = '1' AND "
                    + " idCliente = " + idCliente + " ");

            ResultSet rs = comando.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setSobrenome(rs.getString("sobrenome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setCPF(rs.getString("cpf"));
                cliente.setSenha(rs.getString("senha"));
                cliente.setCEP(rs.getString("cep"));
                cliente.setEndereco(rs.getString("endereco"));
                cliente.setBairro(rs.getString("bairro"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setUF(rs.getString("uf"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setDtaNasc(rs.getDate("dateNasc"));
            }

        } catch (ClassNotFoundException ex) {
            cliente = null;
        } catch (SQLException ex) {
            cliente = null;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                cliente = null;
            }

        }
        return cliente;
    }

    public static boolean editar(Cliente cliente) {
        boolean retorno = false;
        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("UPDATE CLIENTE SET"
                    + " nome=?, sobrenome=?,"
                    + " cep=?, endereco=?, "
                    + " bairro=?, cidade=?, uf=?, telefone=?, "
                    + " dateNasc=? "
                    + " WHERE idCliente=? ");

            comando.setString(1, cliente.getNome());
            comando.setString(2, cliente.getSobrenome());
            comando.setString(3, cliente.getCEP());
            comando.setString(4, cliente.getEndereco());
            comando.setString(5, cliente.getBairro());
            comando.setString(6, cliente.getCidade());
            comando.setString(7, cliente.getUF());
            comando.setString(8, cliente.getTelefone());
            comando.setDate(9, (java.sql.Date) cliente.getDtaNasc());
            comando.setInt(10, cliente.getIdCliente());

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
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

    public static boolean editarSenha(int id, String senha) {
        boolean retorno = false;
        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("UPDATE CLIENTE SET"
                    + " senha=? "
                    + " WHERE idCliente=? ");

            comando.setString(1, senha);
            comando.setInt(2, id);

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;

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

    public static boolean validarSenha(int id, String senhaAtual) {
        boolean retorno = false;
        try {
            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" SELECT idcliente, senha "
                    + " FROM CLIENTE "
                    + " WHERE "
                    + " status = 1 AND "
                    + " idCliente = "+id+"  AND "
                    + " senha = '"+senhaAtual+"' ");
            
            ResultSet rs = comando.executeQuery();
            while (rs.next()) {
                retorno = true;

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

}
