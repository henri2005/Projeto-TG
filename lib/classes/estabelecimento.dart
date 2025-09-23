class Estabelecimento {
  String idEstabelecimento = "";
  String nome = "";
  String descricao = "";
  String caminhoImagem = "";
  String rua = "";
  String numero = "";
  double latitude = 0.0;
  double longitude = 0.0;
  int notaAvaliacao = 0;
  String estatus = "";
  String adicionadoRoteiro = "";
  String tipo = "";

  Estabelecimento({
    required int id,
    required String nome,
    required String tipo,
    required String adicionadoRoteiro,
    required String estatus,
    required int notaAvaliacao,
    required List servicos,
    required double longitude,
    required double latitude,
    required int numero,
    required String rua,
    required String descricao,
    required String caminhoImagem,
  });

  Estabelecimento.fromJson(Map<String, dynamic> json) {
    idEstabelecimento = json['id_estabelecimento'];
    nome = json['nome'];
    descricao = json['descricao'];
    caminhoImagem = json['caminho_imagem'];
    rua = json['rua'];
    numero = json['numero'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    notaAvaliacao = json['nota_avaliacao'];
    estatus = json['estatus'];
    adicionadoRoteiro = json['adicionado_roteiro'];
    tipo = json['tipo'];
  }
  @override
  String toString() {
    return 'Estabelecimento{id: $idEstabelecimento, nome: $nome, caminhoImagem: $caminhoImagem, descrição: $descricao, rua: $rua, numero: $numero, latitude: $latitude, longitude: $longitude, nota_avaliação: $notaAvaliacao, estatus: $estatus, adicionado_roteiro: $adicionadoRoteiro, tipo: $tipo}';
  }
}
