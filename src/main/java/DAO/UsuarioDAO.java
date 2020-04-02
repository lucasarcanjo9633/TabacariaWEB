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
import java.util.List;

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
                    + " FROM USUARIO ");

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

}
