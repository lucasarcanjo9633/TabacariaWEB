/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author igor
 */
public abstract class Pessoa {

    private int idPessoa;
    private String nomeCompleto;
    private String cpf;
    private String telefone;

    public Pessoa() {
    }

    public Pessoa(int idPessoa, String nomeCompleto, String cpf, String telefone) {
        this.idPessoa = idPessoa;
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.telefone = telefone;
    }

    public Pessoa(String nomeCompleto, String cpf, String telefone) {
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.telefone = telefone;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNome(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

}
