package dao;

import service.ProdutoService;

public class teste {

	public static void main(String[] args) {
		ProdutoService ps = new ProdutoService();
		String v [] = ps.listarCategoria();
		for(int i =0; i<v.length;i++) {
		System.out.println(v[i]);
		}
	}
}
