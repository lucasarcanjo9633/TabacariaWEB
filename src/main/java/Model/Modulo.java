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
public class Modulo {

    private int id;
    private String nomeModulo;

    public Modulo(int id, String nomeModulo) {
        this.id = id;
        this.nomeModulo = nomeModulo;
    }

    public Modulo(String nomeModulo) {
        this.nomeModulo = nomeModulo;
    }

    public Modulo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeModulo() {
        return nomeModulo;
    }

    public void setNomeModulo(String nomeModulo) {
        this.nomeModulo = nomeModulo;
    }

    @Override
    public String toString() {
        return "Modulo{" + "id=" + id + ", nomeModulo=" + nomeModulo + '}';
    }
}
