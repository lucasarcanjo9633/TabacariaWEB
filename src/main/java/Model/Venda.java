/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author igor
 */
public class Venda {
    
    private int idVenda;
    private int idCliente;
    private ArrayList<Item> itens;
    private double precoFinal;
    private Date dataVenda;
    
    public Venda(int idVenda, int idCliente, ArrayList<Item> itens, double precoFinal, Date dataVenda) {
        this.idVenda = idVenda;
        this.idCliente = idCliente;
        this.itens = itens;
        this.precoFinal = precoFinal;
        this.dataVenda = dataVenda;
    }
    
    public Venda(int idVenda, int idCliente, double precoFinal, Date dataVenda) {
        this.idVenda = idVenda;
        this.idCliente = idCliente;
        this.precoFinal = precoFinal;
        this.dataVenda = dataVenda;
    }
    
    public Venda() {
        itens = new ArrayList<>();
    }
    
    public Venda(int idCliente, ArrayList<Item> itens, double precoFinal, Date dataVenda) {
        this.idCliente = idCliente;
        this.itens = itens;
        this.precoFinal = precoFinal;
        this.dataVenda = dataVenda;
    }
    
    public int getIdVenda() {
        return idVenda;
    }
    
    public void setIdVenda(int idVenda) {
        this.idVenda = idVenda;
    }
    
    public int getIdCliente() {
        return idCliente;
    }
    
    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
    
    public ArrayList<Item> getItens() {
        return itens;
    }
    
    public void setItens(ArrayList<Item> itens) {
        this.itens = itens;
    }
    
    public double getPrecoFinal() {
        return precoFinal;
    }
    
    public void setPrecoFinal(double precoFinal) {
        this.precoFinal = precoFinal;
    }
    
    public Date getDataVenda() {
        return dataVenda;
    }
    
    public void setDataVenda(Date dataVenda) {
        this.dataVenda = dataVenda;
    }
    
    public void adicionarItem(Item item) {
        this.itens.add(item);
    }
    
    public void adicionarItemExistente(Item item) {
        for (Item p : itens) {
            if (p.getP().getId() == item.getP().getId()) {                
               p.setQtd(p.getQtd()+item.getQtd());
               p.setPreco(p.getPreco()+(item.getP().getValor()*item.getQtd())) ;
            }
        }
    }
    
    public boolean itemExisteCarrinho(Produto p) {
        for (Item item : itens) {
            if (p.getId() == item.getP().getId()) {
                return true;
            }
        }
        return false;
    }
    
    public void precoFinal() {
        this.precoFinal = 0;
        for (Item item : itens) {
            this.precoFinal = (this.precoFinal + item.getPreco());
        }
    }
    
    public void alterarQuantidade(int idProduto, int qtd) {
        for (Item item : itens) {
            if (idProduto == item.getP().getId()) {
                item.setQtd(qtd);
            }
        }
    }
    
    public void removerItem(int id) {
        for (int i = 0; i < itens.size(); i++) {
            if (itens.get(i).getP().getId() == id) {
                itens.remove(i);
            }
        }
    }
    
    public void vendarealizada() {
        this.itens = new ArrayList<>();
        this.idCliente = 0;
        this.precoFinal = 0;
    }
    
}
