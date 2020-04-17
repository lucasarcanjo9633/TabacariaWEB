/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;

/**
 *
 * @author igor
 */
public class Cliente {

    private int idCliente;
    private String nome;
    private String sobrenome;
    private String email;
    private String CPF;
    private Date dtaNasc; 
    private String senha;
    private String CEP;
    private String endereco;
    private String bairro;
    private String cidade;
    private String UF;
    private String telefone;
    private boolean status;

    public Cliente(int idCliente, String nome, String sobrenome, String email, String CPF, Date dtaNasc, String senha, String CEP, String endereco, String bairro, String cidade, String UF, String telefone, boolean status) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.email = email;
        this.CPF = CPF;
        this.dtaNasc = dtaNasc;
        this.senha = senha;
        this.CEP = CEP;
        this.endereco = endereco;
        this.bairro = bairro;
        this.cidade = cidade;
        this.UF = UF;
        this.telefone = telefone;
        this.status = status;
    }

    public Cliente(int idCliente, String nome, String sobrenome, Date dtaNasc, String senha, String CEP, String endereco, String bairro, String cidade, String UF, String telefone) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dtaNasc = dtaNasc;
        this.senha = senha;
        this.CEP = CEP;
        this.endereco = endereco;
        this.bairro = bairro;
        this.cidade = cidade;
        this.UF = UF;
        this.telefone = telefone;
    }
    
    public Cliente(String nome, String sobrenome, String email, String CPF, Date dtaNasc, String senha, String CEP, String endereco, String bairro, String cidade, String UF, String telefone) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.email = email;
        this.CPF = CPF;
        this.dtaNasc = dtaNasc;
        this.senha = senha;
        this.CEP = CEP;
        this.endereco = endereco;
        this.bairro = bairro;
        this.cidade = cidade;
        this.telefone = telefone;
        this.UF = UF;
    }

    public Cliente() {
        
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    
    public Date getDtaNasc() {
        return dtaNasc;
    }

    public void setDtaNasc(Date dtaNasc) {
        this.dtaNasc = dtaNasc;
    }

    

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String CPF) {
        this.CPF = CPF;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCEP() {
        return CEP;
    }

    public void setCEP(String CEP) {
        this.CEP = CEP;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getUF() {
        return UF;
    }

    public void setUF(String UF) {
        this.UF = UF;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
