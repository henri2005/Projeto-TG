import 'dart:convert';

class Estabelecimento {
  final String nome;
  final String caminhoImagem;
  final String descricao;
  final String rua;
  final int numero;
  final String servicos;

  Estabelecimento(
    this.nome,
    this.caminhoImagem,
    this.descricao,
    this.rua,
    this.numero,
    this.servicos,
  );

  Estabelecimento.fromJson(
    Map<String, dynamic> json,
    this.nome,
    this.caminhoImagem,
    this.descricao,
    this.rua,
    this.numero,
    this.servicos,
  ) {
    nome:
    json['nome'];
    caminhoImagem:
    json['caminhoImagem'];
    descricao:
    json['descricao'];
    rua:
    json['rua'];
    numero:
    json['numero'];
    servicos:
    json['servicos'];
  }

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'caminhoImagem': caminhoImagem,
    'descrição': descricao,
    'rua': rua,
    'numero': numero,
    'serviços': servicos,
  };
}
