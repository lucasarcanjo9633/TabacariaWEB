/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Cliente;
import Model.Endereco;
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

            PreparedStatement comando = conexao.prepareStatement("INSERT INTO cliente "
                    + " (nome, sobrenome, email, cpf, senha, telefone, dateNasc) "
                    + " VALUES (?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

            comando.setString(1, cliente.getNome());
            comando.setString(2, cliente.getSobrenome());
            comando.setString(3, cliente.getEmail());
            comando.setString(4, cliente.getCPF());
            comando.setString(5, cliente.getSenha());
            comando.setString(6, cliente.getTelefone());
            comando.setDate(7, (java.sql.Date) cliente.getDtaNasc());

            int linhasAfetadas = comando.executeUpdate();

            ResultSet rs = comando.getGeneratedKeys();
            int idUsuario = 0;

            if (rs.next()) {

                idUsuario = rs.getInt(1);
            }

            if (linhasAfetadas > 0) {

                retorno = true;

                int linhasAfetadas2 = 0;

                for (int i = 0; i < cliente.getEnderecos().size(); i++) {

                    comando = conexao.prepareStatement("INSERT INTO endereco (idcliente,cep,endereco,bairro,cidade,uf) VALUES(?,?,?,?,?,?)");

                    comando.setInt(1, idUsuario);
                    comando.setString(2, cliente.getEnderecos().get(i).getCEP());
                    comando.setString(3, cliente.getEnderecos().get(i).getEndereco());
                    comando.setString(4, cliente.getEnderecos().get(i).getBairro());
                    comando.setString(5, cliente.getEnderecos().get(i).getCidade());
                    comando.setString(6, cliente.getEnderecos().get(i).getUF());

                    linhasAfetadas2 = comando.executeUpdate();
                }

                if (linhasAfetadas > 0) {

                    retorno = true;
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

    public static Cliente login(String login, String senha) {
        Cliente cliente = null;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("SELECT idCliente, nome, email, senha FROM CLIENTE WHERE email = '" + login + "' AND senha = '" + senha + "';");

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
//

    public static Cliente buscaCliente(int idCliente) {
        Cliente cliente = null;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" SELECT "
                    + " idCliente, nome, sobrenome, email, "
                    + " cpf, senha, telefone, "
                    + " dateNasc "
                    + " FROM CLIENTE "
                    + " WHERE "
                    + " idCliente = " + idCliente + " ");

            ResultSet rs = comando.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                cliente = new Cliente();
                cliente.setIdCliente(id);
                cliente.setNome(rs.getString("nome"));
                cliente.setSobrenome(rs.getString("sobrenome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setCPF(rs.getString("cpf"));
                cliente.setSenha(rs.getString("senha"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setDtaNasc(rs.getDate("dateNasc"));

                ArrayList<Endereco> enderecos = new ArrayList<>();

                PreparedStatement comando1 = conexao.prepareStatement("SELECT idendereco, cep, endereco, bairro, cidade, uf FROM endereco WHERE "
                        + " idcliente = " + id + " AND status = 1; ");

                ResultSet rs1 = comando1.executeQuery();

                while (rs1.next()) {

                    Endereco e = new Endereco(rs1.getInt(1), rs1.getString(2), rs1.getString(3), rs1.getString(4), rs1.getString(5), rs1.getString(6));
                    enderecos.add(e);
                }

                cliente.setEnderecos(enderecos);
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
                    + " telefone=?, "
                    + " dateNasc=? "
                    + " WHERE idCliente=? ");

            comando.setString(1, cliente.getNome());
            comando.setString(2, cliente.getSobrenome());
            comando.setString(3, cliente.getTelefone());
            comando.setDate(4, (java.sql.Date) cliente.getDtaNasc());
            comando.setInt(5, cliente.getIdCliente());

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

            PreparedStatement comando = conexao.prepareStatement("SELECT idcliente, senha "
                    + " FROM CLIENTE "
                    + " WHERE "
                    + " idCliente = " + id + "  AND "
                    + " senha = '" + senhaAtual + "';");

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

    public static boolean salvarEndereco(Endereco e, int id) {
        boolean retorno = false;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("INSERT INTO endereco (idcliente,cep,endereco,bairro,cidade,uf) VALUES(?,?,?,?,?,?)");

            comando.setInt(1, id);
            comando.setString(2, e.getCEP());
            comando.setString(3, e.getEndereco());
            comando.setString(4, e.getBairro());
            comando.setString(5, e.getCidade());
            comando.setString(6, e.getUF());

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
    
    public static boolean desativarEndereco(int cID) {

        boolean retorno = false;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("UPDATE endereco SET status=0 WHERE idendereco= ?");

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
}
