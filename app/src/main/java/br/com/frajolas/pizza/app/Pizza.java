package br.com.frajolas.pizza.app;

/**
 * Created by 16254841 on 28/11/2017.
 */

public class Pizza {

    private int id;
    private String nome;
    private String preco;
    private String img;
    private String descricao;
    private String informacao;
    private String ingrediente;

    public static Pizza create(int id, String nome, String preco, String img, String descricao, String informacao, String ingrediente){
        Pizza m = new Pizza();
        m.setId(id);
        m.setNome(nome);
        m.setPreco(preco);
        m.setImg(img);
        m.setDescricao(descricao);
        m.setInformacao(informacao);
        m.setIngrediente(ingrediente);

        return m;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getInformacao() {
        return informacao;
    }

    public void setInformacao(String informacao) {
        this.informacao = informacao;
    }

    public String getIngrediente() {
        return ingrediente;
    }

    public void setIngrediente(String ingrediente) {
        this.ingrediente = ingrediente;
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

    public String getPreco() {
        return preco;
    }

    public void setPreco(String preco) {
        this.preco = preco;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }


}
