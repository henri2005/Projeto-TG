import 'dart:convert';

class PontoTuristico {
  final String nome;
  final String caminhoImagem;
  final String rua;
  final int numero;
  final String servicos;

  PontoTuristico(
    this.nome,
    this.caminhoImagem,
    this.rua,
    this.numero,
    this.servicos,
  );

  PontoTuristico.fromJson(
    Map<String, dynamic> json,
    this.nome,
    this.caminhoImagem,
    this.rua,
    this.numero,
    this.servicos,
  ) {
    nome:
    json['nome'];
    caminhoImagem:
    json['caminhoImagem'];
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
    'rua': rua,
    'numero': numero,
    'serviços': servicos,
  };
}
