package model;

import java.util.ArrayList;

import controller.Mensagens;

public class Usuario {
	private String nome;
	private String login;
	private String senha;
	private String foto;
	private ArrayList<Msg> mensagens;
	private ArrayList<Usuario> seguidos; 

	public Usuario() {
		mensagens = new ArrayList<Msg>();
		seguidos = new ArrayList<Usuario>();
	}
	
	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public ArrayList<Usuario> getSeguidos() {
		return seguidos;
	}

	public void setSeguidos(ArrayList<Usuario> seguidos) {
		this.seguidos = seguidos;
	}

	
	public void addMensagens(String foto, String msg){
		Msg m = new Msg();
		m.setFoto(foto);
		m.setMsg(msg);
		mensagens.add(m);
	}

	public ArrayList<Msg> getMensagens() {
		return mensagens;
	}

	public void setMensagens(ArrayList<Msg> mensagens) {
		this.mensagens = mensagens;
	}

}