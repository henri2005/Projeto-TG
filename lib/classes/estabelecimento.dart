class Estabelecimento {
  int id;
  String nome;
  String caminhoImagem;
  String descricao;
  String rua;
  int numero;
  double latitude;
  double longitude;
  List<String> servicos;
  int notaAvaliacao;

  Estabelecimento({
    required this.id,
    required this.nome,
    required this.caminhoImagem,
    required this.descricao,
    required this.rua,
    required this.numero,
    required this.latitude,
    required this.longitude,
    required this.servicos,
    required this.notaAvaliacao,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'caminhoImagem': caminhoImagem,
      'descrição': descricao,
      'rua': rua,
      'numero': numero,
      'latitude': latitude,
      'longitude': longitude,
      'serviços': servicos,
      'notaAvaliacao': notaAvaliacao,
    };
  }

  factory Estabelecimento.fromJson(Map<String, dynamic> json) {
    return Estabelecimento(
      id: json['id'],
      nome: json['nome'],
      caminhoImagem: json['caminhoImagem'],
      descricao: json['descricao'],
      rua: json['rua'],
      numero: json['numero'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      servicos: List<String>.from(json['servicos']),
      notaAvaliacao: json['notaAvaliacao'],
    );
  }

  @override
  String toString() {
    return 'Estabelecimento{id: $id, nome: $nome, caminhoImagem: $caminhoImagem, descrição: $descricao, rua: $rua, numero: $numero, latitude: $latitude, longitude: $longitude, serviços: $servicos, nota_avaliação: $notaAvaliacao}';
  }
}
