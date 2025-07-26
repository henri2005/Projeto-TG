class PontoTuristico {
  int id;
  String nome;
  String caminhoImagem;
  String rua;
  int numero;
  List<String> servicos;
  int notaAvaliacao;

  PontoTuristico({
    required this.id,
    required this.nome,
    required this.caminhoImagem,
    required this.rua,
    required this.numero,
    required this.servicos,
    required this.notaAvaliacao,
  });

  factory PontoTuristico.fromJson(Map<String, dynamic> json) {
    return PontoTuristico(
      id: json['id'],
      nome: json['nome'],
      caminhoImagem: json['caminhoImagem'],
      rua: json['rua'],
      numero: json['numero'],
      servicos: List<String>.from(json['servicos']),
      notaAvaliacao: json['notaAvaliacao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'caminhoImagem': caminhoImagem,
      'rua': rua,
      'numero': numero,
      'serviços': servicos,
      'nota_avaliacao': notaAvaliacao,
    };
  }

  @override
  String toString() {
    return 'PontoTuristico{id: $id, nome: $nome, caminhoImagem: $caminhoImagem, rua: $rua, numero: $numero, serviços: $servicos, nota_avaliação: $notaAvaliacao}';
  }
}
