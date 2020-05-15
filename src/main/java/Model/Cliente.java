/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    private List<Endereco> enderecos;
    private String telefone;
    private boolean status;

    public Cliente(int idCliente, String nome, String sobrenome, String email, String CPF, Date dtaNasc, String senha, List<Endereco> enderecos, String telefone, boolean status) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.email = email;
        this.CPF = CPF;
        this.dtaNasc = dtaNasc;
        this.senha = senha;
        this.enderecos = enderecos;
        this.telefone = telefone;
        this.status = status;
    }

    public Cliente(String nome, String sobrenome, String email, String CPF, Date dtaNasc, String senha, List<Endereco> enderecos, String telefone, boolean status) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.email = email;
        this.CPF = CPF;
        this.dtaNasc = dtaNasc;
        this.senha = senha;
        this.enderecos = enderecos;
        this.telefone = telefone;
        this.status = status;
    }

    public Cliente(int idCliente, String nome, String sobrenome, Date dtaNasc, String telefone) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dtaNasc = dtaNasc;
        this.telefone = telefone;
    }

    public Cliente() {

    }

    public List<Endereco> getEnderecos() {
        return enderecos;
    }

    public void setEnderecos(List<Endereco> enderecos) {
        this.enderecos = enderecos;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
