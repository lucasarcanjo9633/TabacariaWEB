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
public class Item {
    
    private Produto p;
    private int qtd;
    private double preco;

    public Item(Produto p, int qtd, double preco) {
        this.p = p;
        this.qtd = qtd;
        this.preco = preco;
    }

    public Item() {
    }

    public Item(Produto p) {
        this.p = p;
    }

    public Produto getP() {
        return p;
    }

    public void setP(Produto p) {
        this.p = p;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }  
    
    public void precoTotal(){
       this.preco = p.getValor()*this.qtd;
    }
}
