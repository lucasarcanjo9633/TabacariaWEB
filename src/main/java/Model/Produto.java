/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;

/**
 *
 * @author Ochaus
 */
public class Produto {

    private int id;
    private String nome;
    private double valor;
    private String desc;
    private String pChave;
    private int qtd;
    private String img;
    private Date entrada;

    public Produto() {

    }

    public Produto(int id, double valor, int qtd, Date entrada) {
        this.id = id;
        this.valor = valor;
        this.qtd = qtd;
        this.entrada = entrada;
    }   
    
    public Produto(String nome, double valor, String desc, String pChave, String img, Date entrada) {
        this.nome = nome;
        this.valor = valor;
        this.desc = desc;
        this.pChave = pChave;
        this.img = img;
        this.entrada = entrada;
    }

    public Produto(int id, String nome, double valor, String desc, String pChave, int qtd, String img) {
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.desc = desc;
        this.pChave = pChave;
        this.qtd = qtd;
        this.img = img;
    }

    public Produto(int id, String nome, double valor, String desc, String pChave) {
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.desc = desc;
        this.pChave = pChave;
    }
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getpChave() {
        return pChave;
    }

    public void setpChave(String pChave) {
        this.pChave = pChave;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getEntrada() {
        return entrada;
    }

    public void setEntrada(Date entrada) {
        this.entrada = entrada;
    }

}
