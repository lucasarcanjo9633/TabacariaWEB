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
    private Endereco endereco;
    private ArrayList<Item> itens;
    private double precoFinal;
    private Date dataVenda;
    private String pagamento;
    private boolean status;

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

    public Venda(int idVenda, int idCliente, ArrayList<Item> itens, double precoFinal, Date dataVenda, String pagamento, Endereco endereco) {
        this.idVenda = idVenda;
        this.idCliente = idCliente;
        this.itens = itens;
        this.precoFinal = precoFinal;
        this.dataVenda = dataVenda;
        this.pagamento = pagamento;
        this.endereco = endereco;
    }

    public int getIdVenda() {
        return idVenda;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
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
                p.setQtd(p.getQtd() + item.getQtd());
                p.setPreco(p.getPreco() + (item.getP().getValor() * item.getQtd()));
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

    public int itemQtd(Produto p) {
        for (Item item : itens) {
            if (p.getId() == item.getP().getId()) {
                return item.getQtd() - 1;
            }
        }
        return 0;
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
        this.pagamento = "";
    }

    public int quantidadeItem() {
        int qtdItem;
        return qtdItem = this.itens.size();
    }
    
    public String mostrarValorFinal(){
        String valorFinal;
        return valorFinal = String.format("%.2f", this.precoFinal);
    }

    public String getPagamento() {
        return pagamento;
    }

    public void setPagamento(String pagamento) {
        this.pagamento = pagamento;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
    
   

}
