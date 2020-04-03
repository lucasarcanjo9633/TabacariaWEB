/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Modulo;
import Model.Usuario;
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
public class UsuarioDAO {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";    //Driver do MySQL 8.0 em diante - Se mudar o SGBD mude o Driver
    private static final String LOGIN = "root";                         //nome de um usuário do banco de dados
    private static final String SENHA = "";                             //sua senha de acesso
    private static final String URL = "jdbc:mysql://localhost:3306/tabacaria?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC";  //URL do banco de dados
    private static Connection conexao;

    public static Usuario login(String login, String senha) {
        Usuario user = null;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" SELECT idusuario, nome, cpf, login, senha, telefone, status "
                    + " FROM USUARIO "
                    + " WHERE "
                    + " status = '1' AND "
                    + " login = '" + login + "' AND "
                    + " senha = '" + senha + "'; ");

            ResultSet rs = comando.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                user = new Usuario(id, rs.getString("login"), rs.getString("senha"), rs.getString("nome"), rs.getString("cpf"), rs.getString("telefone"), rs.getBoolean("status"));

                ArrayList<Modulo> modulos = new ArrayList<>();

                PreparedStatement comando1 = conexao.prepareStatement(" SELECT M.idmodulo, M.nome FROM MODULO M "
                        + " INNER JOIN USUARIO_MODULO UM "
                        + " ON M.idmodulo = UM.idmodulo "
                        + " WHERE "
                        + " UM.idusuario = " + id + "; ");
                ResultSet rs1 = comando1.executeQuery();

                while (rs1.next()) {
                    Modulo m = new Modulo(rs1.getInt(1), rs1.getString(2));
                    modulos.add(m);
                }

                user.setModulos(modulos);
            }

        } catch (ClassNotFoundException ex) {
            user = null;
        } catch (SQLException ex) {
            user = null;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                user = null;
            }

        }
        return user;
    }

    public static ArrayList<Usuario> getUsuarios() {
        ArrayList<Usuario> usuarios = new ArrayList<>();
        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" "
                    + " SELECT idusuario, nome, cpf, login, senha, telefone, status "
                    + " FROM USUARIO");

            ResultSet rs = comando.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                Usuario user = new Usuario(id, rs.getString("login"), rs.getString("senha"), rs.getString("nome"), rs.getString("cpf"), rs.getString("telefone"), rs.getBoolean("status"));

                ArrayList<Modulo> modulos = new ArrayList<>();

                PreparedStatement comando1 = conexao.prepareStatement(" SELECT M.idmodulo, M.nome FROM MODULO M "
                        + " INNER JOIN USUARIO_MODULO UM "
                        + " ON M.idmodulo = UM.idmodulo "
                        + " WHERE "
                        + " UM.idusuario = " + id + "; ");
                ResultSet rs1 = comando1.executeQuery();

                while (rs1.next()) {
                    Modulo m = new Modulo(rs1.getInt(1), rs1.getString(2));
                    modulos.add(m);
                }

                user.setModulos(modulos);
                usuarios.add(user);
            }

        } catch (ClassNotFoundException ex) {
            usuarios = null;
        } catch (SQLException ex) {
            usuarios = null;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                usuarios = null;
            }

        }
        return usuarios;
    }

    public static boolean salvar(Usuario user) {
        boolean retorno = false;
        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" INSERT INTO USUARIO (nome, cpf, login, senha, telefone)"
                    + "values (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            comando.setString(1, user.getNomeCompleto());
            comando.setString(2, user.getCpf());
            comando.setString(3, user.getUsername());
            comando.setString(4, user.getHashSenha());
            comando.setString(5, user.getTelefone());

            int linhasAfetadas = comando.executeUpdate();

            ResultSet rs = comando.getGeneratedKeys();
            int idUsuario = 0;

            if (rs.next()) {

                idUsuario = rs.getInt(1);
            }

            if (linhasAfetadas > 0) {

                int linhasAfetadas2 = 0;

                for (int i = 0; i < user.getModulos().size(); i++) {

                    comando = conexao.prepareStatement("INSERT INTO USUARIO_MODULO(idusuario,idmodulo) VALUES(?, ?)");
                    comando.setInt(1, idUsuario);
                    comando.setInt(2, Integer.parseInt(user.getModulos().get(i).getNomeModulo()));
                    linhasAfetadas2 = comando.executeUpdate();
                }

                if (linhasAfetadas2 > 0) {

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

    public static Usuario getUsuario(int idUser) {
        Usuario user = null;

        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement(" SELECT idusuario, nome, cpf, login, senha, telefone, status "
                    + " FROM USUARIO "
                    + " WHERE "
                    + " idusuario = " + idUser + " ; ");

            ResultSet rs = comando.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                user = new Usuario(id, rs.getString("login"), rs.getString("senha"), rs.getString("nome"), rs.getString("cpf"), rs.getString("telefone"), rs.getBoolean("status"));

                ArrayList<Modulo> modulos = new ArrayList<>();

                PreparedStatement comando1 = conexao.prepareStatement(" SELECT M.idmodulo, M.nome FROM MODULO M "
                        + " INNER JOIN USUARIO_MODULO UM "
                        + " ON M.idmodulo = UM.idmodulo "
                        + " WHERE "
                        + " UM.idusuario = " + id + "; ");
                ResultSet rs1 = comando1.executeQuery();

                while (rs1.next()) {
                    Modulo m = new Modulo(rs1.getInt(1), rs1.getString(2));
                    modulos.add(m);
                }

                user.setModulos(modulos);
            }

        } catch (ClassNotFoundException ex) {
            user = null;
        } catch (SQLException ex) {
            user = null;
        } finally {
            try {
                conexao.close();
            } catch (SQLException ex) {
                user = null;
            }

        }
        return user;
    }

    public static boolean editar(Usuario user) {
        boolean retorno = false;
        try {

            if (removerModulos(user.getIdPessoa())) {

                Class.forName(DRIVER);
                conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

                PreparedStatement comando = conexao.prepareStatement("update usuario set nome=?, cpf=?, login=?, senha=?, telefone=? "
                        + " where idusuario= ?");

                comando.setString(1, user.getNomeCompleto());
                comando.setString(2, user.getCpf());
                comando.setString(3, user.getUsername());
                comando.setString(4, user.getHashSenha());
                comando.setString(5, user.getTelefone());
                comando.setInt(6, user.getIdPessoa());

                int linhasAfetadas = comando.executeUpdate();

                int idUsuario = user.getIdPessoa();

                if (linhasAfetadas > 0) {

                    int linhasAfetadas2 = 0;

                    for (int i = 0; i < user.getModulos().size(); i++) {

                        comando = conexao.prepareStatement("INSERT INTO USUARIO_MODULO (idusuario, idmodulo) "
                                + " VALUES (?,?) ");
                        comando.setInt(1, idUsuario);
                        comando.setInt(2, Integer.parseInt(user.getModulos().get(i).getNomeModulo()));
                        linhasAfetadas2 = comando.executeUpdate();
                    }

                    if (linhasAfetadas2 > 0) {

                        retorno = true;

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
        return true;
    }

    public static boolean removerModulos(int id) {
        boolean retorno = false;
        try {

            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

            PreparedStatement comando = conexao.prepareStatement("DELETE FROM usuario_modulo WHERE idusuario =?");
            comando.setInt(1, id);

            int linhasAfetadas = comando.executeUpdate();

            if (linhasAfetadas > 0) {
                retorno = true;
            } else {
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

    public static boolean desativarUsuario(int idUser) {
        boolean retorno = false;
        try {

            if (removerModulos(idUser)) {

                Class.forName(DRIVER);
                conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

                PreparedStatement comando = conexao.prepareStatement("update usuario set status=? "
                        + " where idusuario= ?");

                comando.setBoolean(1, false);
                comando.setInt(2, idUser);

                int linhasAfetadas = comando.executeUpdate();

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
        return true;
    }
    
    public static boolean ativarUsuario(int idUser) {
        boolean retorno = false;
        try {
            
                Class.forName(DRIVER);
                conexao = DriverManager.getConnection(URL, LOGIN, SENHA);

                PreparedStatement comando = conexao.prepareStatement("update usuario set status=? "
                        + " where idusuario= ?");

                comando.setBoolean(1, true);
                comando.setInt(2, idUser);

                int linhasAfetadas = comando.executeUpdate();

            

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
        return true;
    }

}
