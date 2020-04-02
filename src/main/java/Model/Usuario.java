/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author igor
 */
public class Usuario extends Pessoa {

    private static final long serialVersionUID = 1L;

    private String username;
    private String hashSenha;
    private List<Modulo> modulos;

    public Usuario(String username, String hashSenha, List<Modulo> modulos, String nomeCompleto, String cpf, String telefone, boolean status) {
        super(nomeCompleto, cpf, telefone, status);
        this.username = username;
        this.hashSenha = hashSenha;
        this.modulos = modulos;
    }

    public Usuario(int idPessoa, String username, String hashSenha, List<Modulo> modulos, String nomeCompleto, String cpf, String telefone, boolean status) {
        super(idPessoa, nomeCompleto, cpf, telefone, status);
        this.username = username;
        this.hashSenha = hashSenha;
        this.modulos = modulos;
    }

    public Usuario(int idPessoa, String username, String hashSenha, String nomeCompleto, String cpf, String telefone, boolean status) {
        super(idPessoa, nomeCompleto, cpf, telefone, status);
        this.username = username;
        this.hashSenha = hashSenha;
    }

    public Usuario() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHashSenha() {
        return hashSenha;
    }

    public void setHashSenha(String hashSenha) {
        this.hashSenha = hashSenha;
    }

    public List<Modulo> getModulos() {
        return modulos;
    }

    public void setModulos(List<Modulo> modulos) {
        this.modulos = modulos;
    }

    public boolean verificarPapel(String nomePapel) {
        for (Modulo m : modulos) {
            if (m.getNomeModulo().equals(nomePapel)) {
                return true;
            }
        }
        return false;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}
